from django.contrib import admin

# Register your models here.
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from django.forms import BaseInlineFormSet

from products.models import Dealer, Customer, FeedBack, Admin, Admin_Customer


class AdminInline(admin.StackedInline):
    model = Admin
    can_delete = False
    fk_name = 'user'
class CustomUserAdmin(UserAdmin):
    inlines = (AdminInline, )
    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super(CustomUserAdmin, self).get_inline_instances(request, obj)
admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)

class FeedBackAdmin(admin.ModelAdmin):
    list_display = ['detail', 'status', 'customer_id']
    # fields = ['detail', 'status']
    readonly_fields = ['detail', 'admin', 'customer']
    def save_model(self, request, obj, form, change):
        if not obj.admin:
            obj.admin = request.user.admin
        if obj.status == 'read':
            obj.save()

admin.site.register(FeedBack, FeedBackAdmin)

class Admin_CustomerInline(admin.StackedInline):
    model = Admin_Customer
    extra = 1
    readonly_fields = ['admin']
    fields = ['date', 'evidence']
class DealerAdmin(admin.ModelAdmin):
    list_display = ['address','phone', 'blacklist', 'discount', 'amount']
    readonly_fields = ['address', 'phone', 'user']
    inlines = [Admin_CustomerInline]
    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.admin = request.user.admin
            instance.result = 'check'
            instance.save()
        formset.save_m2m()
admin.site.register(Dealer, DealerAdmin)