# Generated by Django 3.0.6 on 2020-09-24 16:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('AdminPanel', '0016_order1_cancle_flag'),
    ]

    operations = [
        migrations.AddField(
            model_name='salesreturn1',
            name='sales_return_date',
            field=models.DateField(null=True),
        ),
        migrations.AddField(
            model_name='salesreturn1',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='AdminPanel.users'),
        ),
        migrations.DeleteModel(
            name='salesReturnDetails1',
        ),
    ]
