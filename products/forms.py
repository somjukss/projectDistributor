import datetime

from django import forms

from products.models import Customer, FeedBack, Product, Dealer, Order, OrderDetail


class RegisterForm(forms.ModelForm):
    username = forms.CharField(max_length=255)
    password = forms.CharField(max_length=255, widget=forms.PasswordInput)
    re_password = forms.CharField(max_length=255, widget=forms.PasswordInput)
    email = forms.EmailField()
    name = forms.CharField(max_length=255)
    surname = forms.CharField(max_length=255)
    address =forms.CharField(widget=forms.Textarea)
    class Meta:
        model = Customer
        # fields = '__all__'
        exclude = ['admin', 'blacklist', 'user']
    def clean_address(self):
        data = self.cleaned_data['address']
        data = data.replace('\n', ' ')
        data = data.replace('<br>', ' ')
        return data
    def clean_password(self):
        data = self.cleaned_data['password']
        if len(data) > 8:
            pass
        else:
            raise forms.ValidationError("รหัสผ่านต้องมีตัวอักษรมากกว่า 8 ตัวอักษร")
        return data
    def clean_phone(self):
        data = self.cleaned_data['phone']
        if len(data) != 10:
            raise forms.ValidationError("เบอร์โทรศัพท์ไม่ถูกต้อง")
        return data
    def clean(self):
        cleaned_data = super().clean()
        new = cleaned_data.get('password')
        re = cleaned_data.get('re_password')
        if new != re:
            raise forms.ValidationError('"รหัสผ่าน" และ "ยืนยันรหัสผ่าน" ต้องเหมือนกัน')

class FeedBackForm(forms.ModelForm):
    status = forms.CharField(widget=forms.HiddenInput, required=False)
    class Meta:
        model = FeedBack
        # fields = '__all__'
        exclude = ['customer']

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

class OrderForm(forms.ModelForm):
    class Meta:
        model = Order
        exclude = ['admin', 'reason', 'cancel_date', 'customer']
class OrderDetailForm(forms.ModelForm):
    class Meta:
        model = OrderDetail
        fields = '__all__'
