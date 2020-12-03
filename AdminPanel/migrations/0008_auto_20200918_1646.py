# Generated by Django 3.0.6 on 2020-09-18 11:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('AdminPanel', '0007_auto_20200918_1627'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order1',
            name='cart',
        ),
        migrations.AddField(
            model_name='order1',
            name='amount',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='order1',
            name='product_attributes',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='AdminPanel.productAttributes1'),
        ),
    ]