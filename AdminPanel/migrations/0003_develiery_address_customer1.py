# Generated by Django 3.0.6 on 2020-09-12 08:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('AdminPanel', '0002_users'),
    ]

    operations = [
        migrations.CreateModel(
            name='develiery_address_customer1',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('customer_name', models.CharField(max_length=255)),
                ('address', models.CharField(max_length=255, null=True)),
                ('landmark', models.CharField(max_length=255, null=True)),
                ('email', models.EmailField(max_length=254)),
                ('contact_no', models.CharField(max_length=20)),
                ('flag', models.BooleanField(default=False)),
                ('area', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='AdminPanel.area1')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='AdminPanel.users')),
            ],
            options={
                'db_table': 'develiery_address',
            },
        ),
    ]
