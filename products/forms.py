from django import forms

from products.models import Customer, FeedBack, Product, Dealer


class RegisterForm(forms.ModelForm):
    username = forms.CharField(max_length=255)
    password = forms.CharField(max_length=255, widget=forms.PasswordInput)
    re_password = forms.CharField(max_length=255, widget=forms.PasswordInput)
    email = forms.EmailField()
    name = forms.CharField(max_length=255)
    surname = forms.CharField(max_length=255)
    class Meta:
        model = Customer
        # fields = '__all__'
        exclude = ['admin', 'blacklist', 'user']

class FeedBackForm(forms.ModelForm):
    status = forms.CharField(widget=forms.HiddenInput, required=False)
    class Meta:
        model = FeedBack
        fields = '__all__'
        # exclude = ['customer']

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        exclude = ['manufactor']
        # fields = '__all__'

class DealerForm(forms.ModelForm):
    username = forms.CharField(max_length=255)
    first_name = forms.CharField(max_length=255)
    last_name = forms.CharField(max_length=255)
    e_mail = forms.EmailField()
    class Meta:
        model = Dealer
        exclude = ['user', 'admin']