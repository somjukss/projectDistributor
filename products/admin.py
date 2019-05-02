from django.contrib import admin

# Register your models here.
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from django.forms import BaseInlineFormSet
from django.urls import reverse
from django.utils.html import format_html
from django.utils.safestring import mark_safe

from products.models import Dealer, Customer, FeedBack, Admin, Admin_Customer, ProductLot, Product, Manufactor


class AdminInline(admin.StackedInline):
    model = Admin
    can_delete = False
    fk_name = 'user'
class CustomUserAdmin(UserAdmin):
    inlines = (AdminInline, )
    def get_inline_instances(self, request, obj=None):
        # if obj.customer.user.groups.filter(name='customer').exists():

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
    list_display = ['dealer', 'address', 'phone', 'blacklist', 'discount', 'amount']
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

class ProductLotInline(admin.StackedInline):
    model = ProductLot
    extra = 1
class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'link_to_manufactor']
    readonly_fields = ['manufactor', 'name', 'describe', 'quantity']
    inlines = [ProductLotInline]
    def save_related(self, request, form, formsets, change):
        super(ProductAdmin, self).save_related(request, form, formsets, change)
        product = form.instance
        for formset in formsets:
            instances = formset.save(commit=False)
            for instance in instances:
                new_quantity = instance.quantity
                product.quantity += new_quantity
                instance.save()
            formset.save_m2m()
        form.save_m2m()
        product.save()

    def link_to_manufactor(self, obj):
        link = reverse("admin:products_manufactor_change", args=[obj.manufactor.id])
        return format_html('<a href="{}">{}</a>', link, obj.manufactor.name)
    link_to_manufactor.allow_tags = True
    link_to_manufactor.short_description = 'View Manufactor Detail'

admin.site.register(Product, ProductAdmin)
class ManufactorAdmin(admin.ModelAdmin):
    readonly_fields = ['name', 'location', 'phone']
admin.site.register(Manufactor, ManufactorAdmin)