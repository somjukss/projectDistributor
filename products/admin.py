from django.contrib import admin

# Register your models here.
from products.models import Dealer, Customer, FeedBack


class FeedBackAdmin(admin.ModelAdmin):
    list_display = ['detail', 'status', 'customer_id']
admin.site.register(FeedBack, FeedBackAdmin)
class DealerAdmin(admin.ModelAdmin):
    list_display = ['address','phone', 'blacklist', 'discount', 'amount']
admin.site.register(Dealer, DealerAdmin)