from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User, Group
from django.forms import formset_factory
from django.shortcuts import render, redirect


# Create your views here.
from products.forms import RegisterForm, FeedBackForm
from products.models import Dealer, Customer, FeedBack


def index(request):
    context ={}
    return  render(request, 'products/index.html', context)

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
    return render(request, 'feedback/feedback.html', context)