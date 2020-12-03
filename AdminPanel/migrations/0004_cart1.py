# Generated by Django 3.0.6 on 2020-09-15 08:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('AdminPanel', '0003_develiery_address_customer1'),
    ]

    operations = [
        migrations.CreateModel(
            name='cart1',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qty', models.IntegerField()),
                ('product_attributes', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='AdminPanel.productAttributes1')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='AdminPanel.users')),
            ],
            options={
                'db_table': 'cart',
            },
        ),
    ]