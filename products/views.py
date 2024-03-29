import datetime
import json
import random
import string

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User, Group
from django.forms import formset_factory
from django.http import JsonResponse
from django.shortcuts import render, redirect


# Create your views here.

from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.permissions import AllowAny

from products.forms import RegisterForm, FeedBackForm, OrderDetailForm
from products.models import Dealer, FeedBack, Customer, Order, DealerStock, Product_DealerStock, Shipment

from rest_framework import status
from rest_framework.response import Response

from products.renderers import ProductJSONRenderer
from .serializers import *
#my decorate Function
def randomString(stringLength=20):
    """Generate String length = 20"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(stringLength))
def group_required(*group_names):
    """Requires user membership in at least one of the groups passed in."""
    def in_groups(u):
        if u.is_authenticated:
            if bool(u.groups.filter(name__in=group_names)) | u.is_superuser:
                return True
        return False
    return user_passes_test(in_groups, login_url='login')

@login_required
@group_required('customer')
def index(request):
    try:
        dealer = Dealer.objects.filter(customer_ptr_id=request.user.id).all()[0]
    except IndexError:
        dealer = Dealer.objects.filter(customer_ptr_id=request.user.id).all()
    context = {'dealer': dealer}
    product = Product.objects.all()
    context['product'] = product
    return render(request, 'products/index.html', context)
@login_required
@group_required('customer')
def api_index(request):
    if request.method == 'POST':
        # customer object
        customer = Customer.objects.get(pk=request.user.id)
        #get data from api
        group_list = json.loads(request.body)
        error_list = []
        total_price1 = int()
        for product in group_list[1]:
            total_price1 = product['total']
        total_price2 = total_price1 - (customer.dealer.discount*total_price1)
        #create object order
        order = Order(
            date=datetime.date.today(),
            detail=customer.address,
            total_price1=total_price1,
            total_price2=total_price2,
            customer_id=request.user.id
        )
        order.save()
        #shipment
        shipment = Shipment(
            track_number=randomString(),
            name=group_list[0]['shipment'],
            receive_date=datetime.date.today(),
            order_id=order.id
        )
        shipment.save()
        #add data to order detail
        for my_product in group_list[1]:
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
            #dealer-stock
            dealerStock = DealerStock.objects.filter(dealer_id=request.user.id).all()
            # update stock
            product_dealerStock = Product_DealerStock.objects
            if Product_DealerStock.objects.filter(dealer_stock=dealerStock[0]):
                # have product
                if Product_DealerStock.objects.filter(dealer_stock=dealerStock[0]).filter(product=product):
                    product_dealerStock = Product_DealerStock.objects.filter(dealer_stock=dealerStock[0]).filter(product=product).all()[0]
                    product_dealerStock.quantity += my_product['quantity']
                else:
                    product_dealerStock = Product_DealerStock.objects.create(
                        quantity=my_product['quantity'],
                        dealer_stock=dealerStock[0],
                        product=product
                    )
            else:
                product_dealerStock = Product_DealerStock.objects.create(
                    quantity=my_product['quantity'],
                    dealer_stock=dealerStock[0],
                    product=product
                )
            product_dealerStock.save()
            #save orderdetail
            if form.is_valid():
                form.save()
            else:
                error_list.append(form.errors.as_text())
        # increase amount of dealer
        try:
            dealer = Dealer.objects.filter(customer_ptr_id=request.user.id).all()[0]
        except IndexError:
            dealer = Dealer.objects.filter(customer_ptr_id=request.user.id).all()
        dealer.amount += total_price2
        dealer.save()
        if len(error_list) == 0:
            return redirect('profile')
            # return JsonResponse({'message': 'success'}, status=200)

        else:
            return  JsonResponse({'message': error_list}, status=400)
    return JsonResponse({'message': 'This API does not accept GET request'}, status=405)
def my_login(request):
    context = {}
    product = Product.objects.all()
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
                if request.user.is_superuser:
                    return redirect('/admin/')

                else:
                    return redirect('index')
        else:
            context['username'] = username
            context['password'] = password
            context['error'] = "Wrong username or Password !"
    next_url = request.GET.get('next')
    if next_url:
        context['next_url'] = next_url
    context['product'] = product
    return render(request, template_name="user/login.html", context=context)

def my_logout(request):
    logout(request)
    return redirect('login')

def register(request):
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            uservalue = form.cleaned_data.get('username')
            try:
                user = User.objects.get(username=uservalue)
                context = {'form': form, 'usererror': 'The username you entered has already been taken. Please try another username.'}
                return render(request, 'user/register.html', context)
            except User.DoesNotExist:

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
                dealerstock = DealerStock.objects.create(
                    dealer_id=dealer.customer_ptr_id
                )
                dealer.save()
                dealerstock.save()
                form.save()
                return redirect('login')
    else:
        form = RegisterForm()
    context = {'form': form}
    return render(request, template_name="user/register.html", context=context)

@login_required
@group_required('customer')
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
@group_required('customer')
def feedback(request):
    data = []
    feedbacks = FeedBack.objects
    for detail in feedbacks.all():
        print(detail.status)
        data.append(
            {
                'customer': detail.customer,
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
@group_required('customer')
def profile(request):
    try:
        dealer = Dealer.objects.filter(customer_ptr_id=request.user.id).all()[0]
    except IndexError:
        dealer = Dealer.objects.filter(customer_ptr_id=request.user.id).all()
    orders = Order.objects.filter(customer_id=request.user.id).all()
    products = Product.objects.all()
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
    context = {'dealer': dealer}
    context['formset'] = formset
    context['orders'] = orders
    context['products'] = products
    return render(request, 'customer/profile.html', context)
@login_required
@group_required('customer')
def orderDetail(request, order_id):
    dealer = Dealer.objects.filter(customer_ptr_id=request.user.id).all()[0]
    order = Order.objects.get(pk=order_id)
    orderdetail = order.orderdetail_set.all()
    products = Product.objects.all()
    shipment = Shipment.objects.filter(order_id=order_id).all()[0]
    context = {'dealer': dealer}
    context['order'] = order
    context['orderdetail'] = orderdetail
    context['products'] = products
    context['shipment'] = shipment
    return render(request, 'customer/order.html', context)
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
def aboutus(request):
    return render(request,'products/aboutus.html')