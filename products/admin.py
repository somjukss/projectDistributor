from django.contrib import admin

# Register your models here.
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User, Group
from django.forms import BaseInlineFormSet
from django.urls import reverse
from django.utils.html import format_html
from django.utils.safestring import mark_safe

from products.models import Dealer, Customer, FeedBack, Admin, Admin_Customer, ProductLot, Product, Manufactor, Order, \
    OrderDetail, Shipment, Product_DealerStock


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
    list_display = ['detail', 'status', 'link_to_customer']
    # fields = ['detail', 'status']
    readonly_fields = ['detail', 'admin', 'customer']
    def save_model(self, request, obj, form, change):
        if not obj.admin:
            obj.admin = request.user.admin
        if obj.status == 'read':
            obj.save()

    def link_to_customer(self, obj):
        link = reverse("admin:products_dealer_change", args=[obj.customer.user_id])
        return format_html('<a href="{}">{}</a>', link, obj.customer.user)
    link_to_customer.allow_tags = True
    link_to_customer.short_description = 'Customer Detail'

admin.site.register(FeedBack, FeedBackAdmin)

class Admin_CustomerInline(admin.StackedInline):
    model = Admin_Customer
    extra = 1
    readonly_fields = ['admin', 'result']
    fields = ['date', 'evidence', 'admin', 'result']
    verbose_name_plural = "อ่าน FeedBack แล้วมา Check เป็น blacklist"
class DealerAdmin(admin.ModelAdmin):
    list_display = ['dealer', 'address', 'phone', 'blacklist', 'discount', 'amount']
    readonly_fields = ['address', 'phone', 'user']
    inlines = [Admin_CustomerInline]

    def save_model(self, request, obj, form, change):
        group = Group.objects.get(name='blacklist')
        u = User.objects.get(pk=obj.customer_ptr_id)
        print(u)
        if obj.blacklist:
            u.groups.add(group)
        else:
            group.user_set.remove(u)
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.admin = request.user.admin
            instance.result = 'check'
            instance.save()
        formset.save_m2m()
admin.site.register(Dealer, DealerAdmin)
# class CustomerAdmin(admin.ModelAdmin):
#     fields = ['user', 'address', 'phone']
# admin.site.register(Customer, CustomerAdmin)

class ProductLotInline(admin.StackedInline):
    model = ProductLot
    extra = 1
class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'link_to_manufactor']
    inlines = [ProductLotInline]
    fields = ['name', 'describe', 'minimum_stock', 'quantity', 'price', 'img_url', 'manufactor']
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
    fields = ['name', 'location', 'phone']
admin.site.register(Manufactor, ManufactorAdmin)

class OrderDetailInline(admin.StackedInline):
    model = OrderDetail
    readonly_fields = ['detail', 'price', 'quantity', 'amount', 'product']
    extra = 0
class ShipmentInline(admin.StackedInline):
    model = Shipment
    readonly_fields = ['name', 'receive_date']
    fields = ['name', 'track_number', 'receive_date', 'status']
    extra = 0
class OrderAdmin(admin.ModelAdmin):
    list_display = ['id', 'date', 'cancel', 'link_to_customer', 'get_status']
    readonly_fields = ['date', 'detail', 'total_price1', 'total_price2', 'customer', 'admin']
    fieldsets = [  # แบ่งกลุ่มหน้า UI
        ("Order", {'fields': ['detail', 'date', 'total_price1', 'total_price2', 'customer']}),
        ("Admin check", {'fields': ['admin', 'cancel', 'cancel_date', 'reason']})
    ]
    inlines = [OrderDetailInline, ShipmentInline]
    def save_model(self, request, obj, form, change):
        dealer = Dealer.objects.filter(customer_ptr_id=obj.customer_id).all()[0]
        order_detail = OrderDetail.objects.filter(order_id=obj.id).all()
        stocks = Product_DealerStock.objects
        if not obj.admin:
            obj.admin = request.user.admin
        if obj.cancel == True:
            #decrease amount in dealer
            dealer.amount -= obj.total_price2
            dealer.save()
            #update stock of dealer
            for detail in order_detail:
                for stock in stocks.filter(dealer_stock=dealer.dealerstock).all():
                    if stock.product == detail.product:
                        stock.quantity -= detail.quantity
                        stock.save()
            obj.save()
    def get_status(self, obj):
        return Shipment.objects.filter(order=obj).all()[0].status
    get_status.short_description = 'Shipment-Status'
    def link_to_customer(self, obj):
        link = reverse("admin:products_dealer_change", args=[obj.customer.dealer.customer_ptr_id])
        return format_html('<a href="{}">{}</a>', link, obj.customer.user)
    link_to_customer.allow_tags = True
    link_to_customer.short_description = 'Customer Detail'
admin.site.register(Order, OrderAdmin)