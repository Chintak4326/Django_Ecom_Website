# Generated by Django 3.0.6 on 2020-09-20 11:01

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('AdminPanel', '0011_order1_order_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='develiery_address_customer1',
            name='order_status',
        ),
    ]
