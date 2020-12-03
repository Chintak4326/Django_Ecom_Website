# Generated by Django 3.0.6 on 2020-12-01 04:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('AdminPanel', '0019_order1_develiery_address'),
    ]

    operations = [
        migrations.CreateModel(
            name='employee1',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('emp_name', models.CharField(max_length=255)),
                ('emp_address', models.CharField(max_length=25255)),
                ('emp_contact_no', models.BigIntegerField()),
            ],
            options={
                'db_table': 'employee',
            },
        ),
        migrations.AddField(
            model_name='order1',
            name='employee',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='AdminPanel.employee1'),
        ),
    ]