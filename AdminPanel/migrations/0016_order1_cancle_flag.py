# Generated by Django 3.0.6 on 2020-09-24 06:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('AdminPanel', '0015_order1_qty'),
    ]

    operations = [
        migrations.AddField(
            model_name='order1',
            name='cancle_flag',
            field=models.BooleanField(default=0),
        ),
    ]
