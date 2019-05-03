from django.db import models

# Create your models here.
class Admin(models.Model):
    phone = models.CharField(max_length=10)
    #fk
    user = models.OneToOneField('auth.User', on_delete=models.CASCADE, primary_key=True)
    def __str__(self):
        return self.user.username
class Customer(models.Model):
    address = models.TextField()
    phone = models.CharField(max_length=10)
    blacklist = models.BooleanField(default=False)
    # DEALER = 'dealer'
    # choice = (
    #     (DEALER, 'dealer')
    # )
    # type = models.CharField(max_length=6, choices=choice)
    #fk
    user = models.OneToOneField('auth.User', on_delete=models.CASCADE, primary_key=True)
    admin = models.ManyToManyField(Admin, through='Admin_Customer')
    def __str__(self):
        return self.user.username
class Admin_Customer(models.Model):
    admin = models.ForeignKey(Admin, models.CASCADE, null=True, blank=True)
    customer = models.ForeignKey(Customer, models.CASCADE)
    CHECK = 'check'
    UNCHECK = 'uncheck'
    choices = (
        (CHECK, 'check'),
        (UNCHECK, 'uncheck')
    )
    result = models.CharField(max_length=7, choices=choices, default='uncheck')
    date = models.DateField()
    evidence = models.TextField()
class Dealer(Customer):
    discount = models.DecimalField(max_digits=8, decimal_places=2)
    amount = models.DecimalField(max_digits=8, decimal_places=2)
    def __str__(self):
        return self.user.first_name + " " + self.user.last_name
class Manufactor(models.Model):
    name = models.CharField(max_length=255)
    location = models.CharField(max_length=255)
    phone = models.CharField(max_length=10)
    def __str__(self):
        return self.name
class Product(models.Model):
    name = models.CharField(max_length=255)
    describe = models.TextField()
    minimum_stock = models.IntegerField()
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=8, decimal_places=2)
    img_url = models.TextField()
    #fk
    manufactor = models.ForeignKey(Manufactor, on_delete=models.PROTECT)
    def __str__(self):
        return self.name

class DealerStock(models.Model):
    dealer = models.OneToOneField(Dealer, on_delete=models.CASCADE)
    product = models.ManyToManyField(Product, through='Product_DealerStock')


class Product_DealerStock(models.Model):
    product = models.ForeignKey(Product, models.CASCADE)
    dealer_stock = models.ForeignKey(DealerStock, models.CASCADE)
    quantity = models.IntegerField()

class ProductLot(models.Model):
    mfd = models.DateField()
    exp_date = models.DateField()
    quantity = models.IntegerField()
    #fk
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
class Order(models.Model):
    date = models.DateField()
    detail = models.TextField()
    total_price1 = models.DecimalField(max_digits=8, decimal_places=2)
    total_price2 = models.DecimalField(max_digits=8, decimal_places=2)
    #fk
    admin = models.ForeignKey(Admin, on_delete=models.CASCADE, null=True, blank=True)
    reason = models.CharField(max_length=255, null=True, blank=True)
    cancel_date = models.DateField(null=True, blank=True)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)

class OrderDetail(models.Model):
    detail = models.TextField()
    price = models.DecimalField(max_digits=8, decimal_places=2)
    quantity = models.IntegerField()
    amount = models.DecimalField(max_digits=8, decimal_places=2)
    #fk
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.PROTECT)


class FeedBack(models.Model):
    READ = 'read'
    UNREAD = 'unread'
    choices = (
        (READ, 'read'),
        (UNREAD, 'unread')
    )
    status = models.CharField(max_length=6, choices=choices, default='unread')
    detail = models.TextField()
    #fk
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=True, null=True)
    admin = models.ForeignKey(Admin, on_delete=models.CASCADE, blank=True, null=True)

class Shipment(models.Model):
    track_number = models.CharField(max_length=20, primary_key=True)
    name = models.CharField(max_length=255)
    receive_date = models.DateField()
    ARRIVEDATDESTINATIONSTATION = 'Arrivedatdestinationstation'
    ARRIVEATHUB = 'ArrivedatHub'
    SHIPMENTPICKUP = 'Shipmentpickedup'
    choices = (
        (ARRIVEDATDESTINATIONSTATION, 'Arrived at destination station'),
        (ARRIVEATHUB,  'Arrived at Hub'),
        (SHIPMENTPICKUP, 'Shipment picked up')
    )
    status = models.CharField(max_length=30, choices=choices)
    #fk
    order = models.ForeignKey(Order, models.CASCADE)
