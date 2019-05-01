from django.contrib import admin

# Register your models here.
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from products.models import Dealer, Customer, FeedBack, Admin

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
        print(request.user, "    id")
        print(obj.admin, "       obj")
        if not obj.admin:
            obj.admin = request.user.admin
        obj.save()

admin.site.register(FeedBack, FeedBackAdmin)
class DealerAdmin(admin.ModelAdmin):
    list_display = ['address','phone', 'blacklist', 'discount', 'amount']
admin.site.register(Dealer, DealerAdmin)