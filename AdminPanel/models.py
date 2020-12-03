from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.
	
class customer(AbstractUser):
	contact_no=models.CharField(max_length=10,null=True)
	
	class Meta:
		db_table="auth_user"

class users(models.Model):
	name=models.CharField(max_length=255)
	email=models.EmailField(max_length=254)
	password=models.CharField(max_length=30)
	contact_no=models.CharField(max_length=20)
	admin_flag=models.BooleanField(default=False)

	class Meta:
		db_table="customer"


class state1(models.Model):
	name=models.CharField(max_length=255)
	
	class Meta:
		db_table="state"

class city1(models.Model):
	name=models.CharField(max_length=255)
	state= models.ForeignKey('state1',on_delete=models.CASCADE)
	
	class Meta:
		db_table="city"

class area1(models.Model):
	name=models.CharField(max_length=255)
	pincode=models.IntegerField()
	city= models.ForeignKey('city1',on_delete=models.CASCADE)
	
	class Meta:
		db_table="area"

class categories1(models.Model):
	name=models.CharField(max_length=255)
	parent = models.ForeignKey('self',blank=True, null=True ,related_name='children',on_delete=models.CASCADE)
	url=models.CharField(max_length=255, null=True)
	
	class Meta:
		db_table="categories"

#choices Options
status=((0,'NO'),(1,'YES'))

class product1(models.Model):
	product_name=models.CharField(max_length=255)
	model_name=models.CharField(max_length=255)
	model_code=models.CharField(max_length=255,null=True)
	images=models.ImageField(upload_to='images/',null=True)
	description=models.TextField(null=True)
	browser_type=models.CharField(max_length=255)
	touchscreen=models.IntegerField(choices=status,default=0)
	sim_type=models.CharField(max_length=255)
	hybrid_sim_slot=models.IntegerField(choices=status,default=0)
	otg_compatible=models.IntegerField(choices=status,default=0)
	display_size=models.CharField(max_length=250)
	resolution=models.CharField(max_length=255)
	resolution_type=models.CharField(max_length=255)
	other_display_features=models.TextField(null=True)
	operating_system=models.TextField(null=True)
	processor_type=models.CharField(max_length=500)
	processor_core=models.CharField(max_length=255)
	primary_clock_speed=models.CharField(max_length=255)
	secondary_clock_speed=models.CharField(max_length=255)
	operating_frequency=models.CharField(max_length=255,null=True)
	supported_memory_card_type=models.CharField(max_length=255)
	memory_card_slot_type=models.CharField(max_length=255)
	primary_camera_available=models.IntegerField(choices=status,default=0)
	primary_camera=models.CharField(max_length=255)
	primary_camera_features=models.TextField(null=True)
	secondary_camera_available=models.IntegerField(choices=status,default=0)
	secondary_camera=models.CharField(max_length=255)
	secondary_camera_features=models.TextField(null=True)
	flash=models.CharField(max_length=250)
	dual_camera_lens=models.CharField(max_length=255)
	network_type=models.CharField(max_length=255)
	supported_networks=models.CharField(max_length=255)
	internet_connectivity=models.CharField(max_length=255,null=True)
	gprs=models.IntegerField(choices=status,default=0)
	pre_installed_browser=models.CharField(max_length=255)
	blutooth_support=models.IntegerField(choices=status,default=0)
	blutooth_version=models.CharField(max_length=100)
	wifi=models.IntegerField(choices=status,default=0)
	wifi_version=models.CharField(max_length=255)
	usb_connectivity=models.IntegerField(choices=status,default=0)
	audio_jack=models.CharField(max_length=100)
	touchscreen_type=models.CharField(max_length=255)
	sim_size=models.CharField(max_length=100)
	sensors=models.TextField(null=True)
	other_features=models.TextField(null=True)
	gps_type=models.CharField(max_length=255)
	fm_radio=models.IntegerField(choices=status,default=0)
	music_player=models.IntegerField(choices=status,default=0)
	video_format=models.CharField(max_length=255,null=True)
	battery_capacity=models.CharField(max_length=255)
	width=models.CharField(max_length=100)
	height=models.CharField(max_length=100)
	depth=models.CharField(max_length=100)
	weight=models.CharField(max_length=100)
	warranty=models.TextField(null=True)
	category= models.ForeignKey('categories1',on_delete=models.CASCADE)
	
	class Meta:
		db_table="product"

class productAttributes1(models.Model):
	ram=models.CharField(max_length=255)
	rom=models.CharField(max_length=255)
	color=models.CharField(max_length=255)
	price=models.IntegerField()
	stock=models.IntegerField()
	product= models.ForeignKey('product1',on_delete=models.CASCADE)

	class Meta:
		db_table="product_attributes"

class productImage1(models.Model):
	url=models.ImageField(upload_to='images/',null=True)
	product= models.ForeignKey('product1',on_delete=models.CASCADE)

	class Meta:
		db_table="product_image"

class company1(models.Model):
	company_name=models.CharField(max_length=255)
	address=models.CharField(max_length=25255)
	email=models.EmailField(max_length = 254) 
	contact_no=models.BigIntegerField()
	
	class Meta:
		db_table="company"

class develiery_address_customer1(models.Model):
	customer_name=models.CharField(max_length=255)
	address=models.CharField(max_length=255,null=True)
	landmark=models.CharField(max_length=255,null=True)
	email=models.EmailField(max_length = 254) 
	contact_no=models.CharField(max_length=20)
	flag=models.BooleanField(default=0)
	user=models.ForeignKey('users',on_delete=models.CASCADE)
	area=models.ForeignKey('area1',on_delete=models.CASCADE)
	
	class Meta:
		db_table="develiery_address"

class cart1(models.Model):
	qty=models.IntegerField()
	user=models.ForeignKey('users',on_delete=models.CASCADE)
	product_attributes=models.ForeignKey('productAttributes1',on_delete=models.CASCADE)
	
	class Meta:
		db_table="cart"

class order1(models.Model):
	customer_name=models.CharField(max_length=255)
	address=models.CharField(max_length=255,null=True)
	landmark=models.CharField(max_length=255,null=True)
	email=models.EmailField(max_length = 254) 
	contact_no=models.CharField(max_length=20)
	order_date=models.DateTimeField()
	amount=models.IntegerField(null=True)
	flag=models.IntegerField(null=True)
	qty=models.IntegerField(null=True)
	cancle_flag=models.BooleanField(default=0)
	order_status=models.CharField(max_length=200,null=True)
	area=models.ForeignKey('area1',on_delete=models.CASCADE)
	user=models.ForeignKey('users',on_delete=models.CASCADE,null=True)
	product_attributes=models.ForeignKey('productAttributes1',on_delete=models.CASCADE,null=True)
	develiery_address=models.ForeignKey('develiery_address_customer1',on_delete=models.CASCADE,null=True)
	employee=models.ForeignKey('employee1',on_delete=models.CASCADE,null=True)

	class Meta:
		db_table="orders"

class sales1(models.Model):
	sales_date=models.DateField()
	order=models.ForeignKey('order1',on_delete=models.CASCADE)
	
	class Meta:
		db_table="sales"

class salesReturn1(models.Model):
	reason=models.TextField(null=True)
	sales_return_date=models.DateField(null=True)
	product_attributes=models.ForeignKey('productAttributes1',on_delete=models.CASCADE)
	user=models.ForeignKey('users',on_delete=models.CASCADE,null=True)
	sales=models.ForeignKey('sales1',on_delete=models.CASCADE)

	class Meta:
		db_table="sales_return"

class feedback1(models.Model):
	title=models.TextField(null=True)
	feedback_date=models.DateField()
	user=models.ForeignKey('users',on_delete=models.CASCADE)
	product= models.ForeignKey('product1',null=True,on_delete=models.CASCADE)
	
	class Meta:
		db_table="feedback"

class rating1(models.Model):
	level=models.IntegerField()
	user=models.ForeignKey('users',on_delete=models.CASCADE)
	product= models.ForeignKey('product1',null=True,on_delete=models.CASCADE)
	
	class Meta:
		db_table="rating"

class employee1(models.Model):
	emp_name=models.CharField(max_length=255)
	emp_address=models.CharField(max_length=25255)
	emp_contact_no=models.BigIntegerField()
	emp_email=models.EmailField(max_length=254,null=True)
	emp_password=models.CharField(max_length=30,null=True)
	
	class Meta:
		db_table="employee"