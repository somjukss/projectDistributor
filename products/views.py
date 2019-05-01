from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.shortcuts import render, redirect


# Create your views here.
from products.forms import RegisterForm
from products.models import Dealer, Customer


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
            context['usernae'] = username
            context['password'] = password
            context['error'] = "Wrong username or Password !"
    next_url = request.GET.get('next')
    if next_url:
        context['next_url'] = next_url
    return render(request, template_name="products/login.html", context=context)

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
            # print("SAVE USER")
            check = form.save(commit=False)
            check.user_id = u.id
            form.save()
            # print("FORM SAVE")
            return redirect('login')
    else:
        form = RegisterForm()
    context = {'form': form}
    return render(request, template_name="products/register.html", context=context)