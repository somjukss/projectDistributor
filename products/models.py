from django.db import models

# Create your models here.
class Manufactor(models.Model):
    name = models.CharField(max_length=255)
    location = models.CharField(max_length=255)
    phone = models.CharField(max_length=10)

class Product(models.Model):
    name = models.CharField(max_length=255)
    describe = models.TextField()
    minimum_stock = models.IntegerField()
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=8, decimal_places=2)
    #fk
    manufactor = models.ForeignKey(Manufactor, on_delete=models.PROTECT)





