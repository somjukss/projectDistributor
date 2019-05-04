# Generated by Django 2.1.7 on 2019-05-04 08:15

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0009_alter_user_last_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Admin',
            fields=[
                ('phone', models.CharField(max_length=10)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Admin_Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('result', models.CharField(choices=[('check', 'check'), ('uncheck', 'uncheck')], default='uncheck', max_length=7)),
                ('date', models.DateField()),
                ('evidence', models.TextField()),
                ('admin', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='products.Admin')),
            ],
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('address', models.TextField()),
                ('phone', models.CharField(max_length=10)),
                ('blacklist', models.BooleanField(default=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='DealerStock',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='FeedBack',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(choices=[('read', 'read'), ('unread', 'unread')], default='unread', max_length=6)),
                ('detail', models.TextField()),
                ('admin', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='products.Admin')),
            ],
        ),
        migrations.CreateModel(
            name='Manufactor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('location', models.CharField(max_length=255)),
                ('phone', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('detail', models.TextField()),
                ('total_price1', models.DecimalField(decimal_places=2, max_digits=8)),
                ('total_price2', models.DecimalField(decimal_places=2, max_digits=8)),
                ('reason', models.CharField(blank=True, max_length=255, null=True)),
                ('cancel_date', models.DateField(blank=True, null=True)),
                ('admin', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='products.Admin')),
            ],
        ),
        migrations.CreateModel(
            name='OrderDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('detail', models.TextField()),
                ('price', models.DecimalField(decimal_places=2, max_digits=8)),
                ('quantity', models.IntegerField()),
                ('amount', models.DecimalField(decimal_places=2, max_digits=8)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Order')),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('describe', models.TextField()),
                ('minimum_stock', models.IntegerField()),
                ('quantity', models.IntegerField()),
                ('price', models.DecimalField(decimal_places=2, max_digits=8)),
                ('img_url', models.TextField()),
                ('manufactor', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='products.Manufactor')),
            ],
        ),
        migrations.CreateModel(
            name='Product_DealerStock',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField()),
                ('dealer_stock', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.DealerStock')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Product')),
            ],
        ),
        migrations.CreateModel(
            name='ProductLot',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mfd', models.DateField()),
                ('exp_date', models.DateField()),
                ('quantity', models.IntegerField()),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='products.Product')),
            ],
        ),
        migrations.CreateModel(
            name='Shipment',
            fields=[
                ('track_number', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('receive_date', models.DateField()),
                ('status', models.CharField(choices=[('Arrivedatdestinationstation', 'Arrived at destination station'), ('ArrivedatHub', 'Arrived at Hub'), ('Shipmentpickedup', 'Shipment picked up')], max_length=30)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Order')),
            ],
        ),
        migrations.CreateModel(
            name='Dealer',
            fields=[
                ('customer_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='products.Customer')),
                ('discount', models.DecimalField(decimal_places=2, max_digits=8)),
                ('amount', models.DecimalField(decimal_places=2, max_digits=8)),
            ],
            bases=('products.customer',),
        ),
        migrations.AddField(
            model_name='orderdetail',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='products.Product'),
        ),
        migrations.AddField(
            model_name='order',
            name='customer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Customer'),
        ),
        migrations.AddField(
            model_name='feedback',
            name='customer',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='products.Customer'),
        ),
        migrations.AddField(
            model_name='dealerstock',
            name='product',
            field=models.ManyToManyField(through='products.Product_DealerStock', to='products.Product'),
        ),
        migrations.AddField(
            model_name='customer',
            name='admin',
            field=models.ManyToManyField(through='products.Admin_Customer', to='products.Admin'),
        ),
        migrations.AddField(
            model_name='admin_customer',
            name='customer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Customer'),
        ),
        migrations.AddField(
            model_name='dealerstock',
            name='dealer',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='products.Dealer'),
        ),
    ]
