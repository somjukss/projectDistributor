from django import forms

from products.models import Dealer, Customer


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