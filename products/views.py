import datetime
import json

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
from django.forms import formset_factory
from django.http import JsonResponse
from django.shortcuts import render, redirect


# Create your views here.

from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.permissions import AllowAny

from products.forms import RegisterForm, FeedBackForm, ProductForm, DealerForm, OrderForm, OrderDetailForm
from products.models import Dealer, FeedBack, Product, Customer, Order

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from products.renderers import ProductJSONRenderer
from .serializers import *

@login_required
def index(request):
    context = {}
    return render(request, 'products/index.html', context)
def api_index(request):
    if request.method == 'POST':
        # customer object
        customer = Customer.objects.get(pk=request.user.id)
        #get data from api
        product_list = json.loads(request.body)
        error_list = []

        total_price1 = int()
        for product in product_list:
            total_price1 = product['total']
        #create object order
        order = Order(
            date=datetime.date.today(),
            detail=customer.address,
            total_price1=total_price1,
            total_price2=customer.dealer.discount,
            customer_id=request.user.id
        )
        order.save()
        #add data to order detail
        for my_product in product_list:
            data = {
                'detail': my_product['name'],
                'price': float(my_product['price']),
                'quantity': my_product['quantity'],
                'amount': (float(my_product['price']) * float(my_product['quantity'])),
                'order': order.id,
                'product': my_product['id'],
            }
            form = OrderDetailForm(data)
            # decrease-product
            product = Product.objects.get(pk=my_product['id'])
            product.quantity -= my_product['quantity']
            product.save()
            #save orderdetail
            if form.is_valid():
                form.save()
            else:
                error_list.append(form.errors.as_text())
        if len(error_list) == 0:
            return JsonResponse({'message': 'success'}, status=200)
        else:
            return  JsonResponse({'message': error_list}, status=400)
    return JsonResponse({'message': 'This API does not accept GET request'}, status=405)
def my_login(request):
    context = {}
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)#แค่เช็คแต่ไม่ได้สร้าง session
        if user:
            login(request, user) #สร้าง session
            next_url = request.POST.get('next_url')
            if next_url:
                return redirect(next_url)
            else:
                return redirect('index')
        else:
            context['username'] = username
            context['password'] = password
            context['error'] = "Wrong username or Password !"
    next_url = request.GET.get('next')
    if next_url:
        context['next_url'] = next_url
    return render(request, template_name="user/login.html", context=context)

def my_logout(request):
    logout(request)
    return redirect('login')

def register(request):
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            u = User.objects.create_user(
                username = form.cleaned_data.get('username'),
                email = form.cleaned_data.get('email'),
                password = form.cleaned_data.get('password'),
                first_name = form.cleaned_data.get('name'),
                last_name = form.cleaned_data.get('surname')
            )
            u.save()
            check = form.save(commit=False)
            check.user_id = u.id
            dealer = Dealer.objects.create(
                customer_ptr_id = u.id,
                discount = 0,
                amount = 0
            )
            group = Group.objects.get(name='customer')
            u.groups.add(group)
            dealer.save()
            form.save()
            return redirect('login')
    else:
        form = RegisterForm()
    context = {'form': form}
    return render(request, template_name="user/register.html", context=context)

@login_required
def create_feedback(request):
    if request.method == "POST":
        form = FeedBackForm(request.POST)
        if form.is_valid():
            print("VALID")
            check = form.save(commit=False)
            check.customer_id = request.user.id
            form.save()
            return redirect('feedback')
    else:
        form = FeedBackForm()
    context = {'form':form}
    context['name'] = request.user.first_name
    context['surname'] = request.user.last_name
    return render(request, 'feedback/create-feedback.html', context)

@login_required
def feedback(request):
    data = []
    feedbacks = FeedBack.objects.filter(customer_id=request.user.id)
    for detail in feedbacks.all():
        print(detail.status)
        data.append(
            {
                'customer_id': detail.customer.user.id,
                'detail': detail.detail,
                'status': detail.status
            }
        )

    FeedBackFormSet = formset_factory(FeedBackForm, max_num=len(data))
    formset = FeedBackFormSet(initial=data)
    context = {'formset': formset}
    name = request.user.first_name + " "  + request.user.last_name
    context['name'] = name
    return render(request, 'feedback/feedback.html', context)

@login_required
def profile(request):
    dealer = Dealer.objects.filter(customer_ptr_id=request.user.id)
    data = {}
    for detail in dealer.all():
        data['username'] = detail.user.username
        data['first_name'] = detail.user.first_name
        data['last_name'] = detail.user.last_name
        data['e_mail'] = detail.user.email
        data['address'] = detail.address
        data['phone'] = detail.phone
        data['discount'] = detail.discount
        data['amount'] = detail.amount
        data['blacklist'] = detail.blacklist
    form = DealerForm(initial=data)
    context = {'form': form}
    return render(request, 'customer/profile.html', context)

class ProductListApiView(ListAPIView):
    model = Product
    queryset = Product.objects.all()
    permissions_classes = (AllowAny, )
    renderer_classes = (ProductJSONRenderer, )
    serializer_class = ProductListSerializer

class ProductRetrieveApiView(RetrieveAPIView):
    permission_classes = (AllowAny, )
    renderer_classes = (ProductJSONRenderer, )
    serializer_class = ProductSerializer
    def retrieve(self, request, product_id, *args, **kwargs):
      product = Product.objects.get(id=product_id)
      serializer = self.serializer_class(product)
      return Response(serializer.data, status = status.HTTP_200_OK)

