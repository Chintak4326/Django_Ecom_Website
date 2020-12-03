from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth.models import User,auth
from django.contrib.auth.decorators import login_required
from django.contrib.auth import get_user_model
from AdminPanel.models import *
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa
from io import BytesIO
from django.urls import reverse
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from datetime import datetime, timedelta
import random
from django.utils.crypto import get_random_string
from AdminPanel.forms import *
from django.core.mail import EmailMessage #email
from django.core import mail
connection = mail.get_connection() 
connection.open() 

User=get_user_model()

def index(request):
	mobliesdata=productAttributes1.objects.raw('select p.*,a.* from product p,categories c,product_attributes a where p.category_id=c.id and a.product_id=p.id and p.category_id in (select id from categories where parent_id=(select id from categories where url="Moblies")) group by a.product_id')
	tabletdata=productAttributes1.objects.raw('select p.*,a.* from product p,categories c,product_attributes a where p.category_id=c.id and a.product_id=p.id and p.category_id in (select id from categories where parent_id=(select id from categories where url="teblets")) group by a.product_id')
	ipaddata=productAttributes1.objects.raw('select p.*,a.* from product p,categories c,product_attributes a where p.category_id=c.id and a.product_id=p.id and p.category_id in (select id from categories where parent_id=(select id from categories where url="ipads")) group by a.product_id')
	context={"mobliesdata":mobliesdata,"tabletdata":tabletdata,"ipaddata":ipaddata}
	return render(request,'FrontEnd/index.html',context)

#Search the Products
def search(request):
	if request.method=="GET":
		search=str(request.GET['id'])
		lowervalue=str(search.lower())
		# categorydata=categories1.objects.raw('select * FROM categories where parent_id in (select id from categories where parent_id=2) ORDER by parent_id asc limit 5')
		# productdata=product1.objects.filter(product_name__istartswith=search) | product1.objects.filter(product_name__istartswith=lowervalue)
		productdata=product1.objects.filter(Q(product_name__icontains=search) | Q(product_name__icontains=lowervalue))
		return render(request,'FrontEnd/search.html',{"productdata":productdata})

#Dropdown Category
def category(request):
	categoryData=categories1.objects.all().filter(parent_id = 2)
	subcategoryData=categories1.objects.raw('select * FROM categories where parent_id in (select id from categories where parent_id=2) ORDER by parent_id asc')
	context={"categoryData":categoryData,"subcategoryData":subcategoryData}
	return render(request,'FrontEnd/category.html',context)

#Side Menu Category
def categodata(request):
	categoryData=categories1.objects.all().filter(parent_id = 2)
	subcategoryData=categories1.objects.raw('select * FROM categories where parent_id in (select id from categories where parent_id=2) ORDER by parent_id asc')
	context={"categoryData":categoryData,"subcategoryData":subcategoryData}
	return render(request,'FrontEnd/catedata.html',context)

#User Registion
def register(request):
	if request.method=="POST":
		first_name=request.POST['first_name']
		#last_name=request.POST['last_name']
		email=request.POST['email']
		contact_no=request.POST['contact_no']
		password=request.POST['password']
		repassword=request.POST['repassword']

		if password==repassword:
			if users.objects.filter(email=email).exists():
				messages.error(request,'This Email is already exist !!')
				return redirect('register')
			else:
				customer_user=users(name=first_name,email=email,password=password,contact_no=contact_no,admin_flag=0)
				customer_user.save()
				messages.error(request,'user created')
				return redirect('logincustom')
		else:
			messages.error(request,'Password and Confirm password not match !!')
			return redirect('register')
	else:
		return render(request,'FrontEnd/register.html')

#User Login
def logincustom(request):
	if request.method=="POST":
		username=request.POST['username']
		password=request.POST['password']
		#customer_user = auth.authenticate(username=username,password=password,is_superuser=0)
		if users.objects.filter(email=username,password=password,admin_flag=0).exists():
			#auth.login(request,customer_user)
			custid=users.objects.get(email=username)
			request.session['username']=custid.id
			return redirect('/')
		else:
			messages.error(request,"Wrong Username and Password !!")
			return redirect('logincustom')
	else:
		return render(request,'FrontEnd/login.html')

#User Logout
def logoutcustom(request):
	if request.session.has_key('username'):
	    #auth.logout(request)
	    del request.session['username']
	    return redirect('/')
	else:
		return redirect('/')

#Category Wise Main Products
def shop(request,id):
	data=productAttributes1.objects.raw('select a.*,p.product_name,p.images from product p,product_attributes a WHERE p.id=a.product_id and p.category_id in (select id from categories where parent_id = (select id from categories where url=%s)) GROUP by a.product_id',[id])
	paginator = Paginator(data, 12)
	page = request.GET.get('page')
	try:
		data = paginator.page(page)
	except PageNotAnInteger:
		data = paginator.page(1)
	except EmptyPage:
		data = paginator.page(paginator.num_pages)
	context={"data":data}
	return render(request,'FrontEnd/shop.html',context)

#Category Wise Sub Products
def shopdata(request,id):
	data=productAttributes1.objects.raw('select a.*,p.product_name,p.images from product p,product_attributes a WHERE p.id=a.product_id and p.category_id in (select id from categories where url=%s) GROUP by a.product_id',[id])
	paginator = Paginator(data, 12)
	page = request.GET.get('page')
	try:
		data = paginator.page(page)
	except PageNotAnInteger:
		data = paginator.page(1)
	except EmptyPage:
		data = paginator.page(paginator.num_pages)
	context={"data":data}
	return render(request,'FrontEnd/shop.html',context)

#Price Filter
def price_filter(request):
	if request.method=="GET":
		minprice=int(request.GET['minprice'])
		maxprice=str(request.GET['maxprice'])
		proid=int(request.GET['id'])
		if maxprice=="50000+":
			prodata=productAttributes1.objects.raw('select p.*,a.*,c.* from product p,product_attributes a,categories c where a.product_id=p.id and p.category_id=c.id and a.price>=%d and c.id in (select id from categories where parent_id=(select id from categories where id=(select parent_id from categories where id=(select category_id from product where id=%d)))) GROUP by p.id'%(minprice,proid))
			paginator = Paginator(prodata, 12)
			page = request.GET.get('page')
			try:
				prodata = paginator.page(page)
			except PageNotAnInteger:
				prodata = paginator.page(1)
			except EmptyPage:
				prodata = paginator.page(paginator.num_pages)
			context={"data":prodata}
			return render(request,'FrontEnd/product_filter.html',context)
		else:
			maxprice=int(request.GET['maxprice'])
			prodata=productAttributes1.objects.raw('select p.*,a.*,c.* from product p,product_attributes a,categories c where a.product_id=p.id and p.category_id=c.id and a.price>=%d and a.price<=%d and c.id in (select id from categories where parent_id=(select id from categories where id=(select parent_id from categories where id=(select category_id from product where id=%d)))) GROUP by p.id'%(minprice,maxprice,proid))
			paginator = Paginator(prodata, 12)
			page = request.GET.get('page')
			try:
				prodata = paginator.page(page)
			except PageNotAnInteger:
				prodata = paginator.page(1)
			except EmptyPage:
				prodata = paginator.page(paginator.num_pages)
			context={"data":prodata}
			return render(request,'FrontEnd/product_filter.html',context)

#Product Details
def product(request,id):
	allratedata=rating1.objects.filter(product_id=id)
	totalrating=0
	for i in allratedata:
		totalrating=totalrating+int(i.level)
	totalusersgivenrate=rating1.objects.filter(product_id=id).count()
	if totalusersgivenrate>0:
		avg=totalrating/totalusersgivenrate
	else:
		avg=0
	
	totaluser1=0
	level1=rating1.objects.all().filter(product_id=id,level=1)
	totaluser1=len(level1)
	if totalusersgivenrate>0:
		prec1=(100*totaluser1)/totalusersgivenrate
	else:
		prec1=0
	
	totaluser2=0
	level2=rating1.objects.all().filter(product_id=id,level=2)
	totaluser2=len(level2)
	if totalusersgivenrate>0:
		prec2=(100*totaluser2)/totalusersgivenrate
	else:
		prec2=0
	
	totaluser3=0
	level3=rating1.objects.all().filter(product_id=id,level=3)
	totaluser3=len(level3)
	if totalusersgivenrate>0:
		prec3=(100*totaluser3)/totalusersgivenrate
	else:
		prec3=0
	
	totaluser4=0
	level4=rating1.objects.all().filter(product_id=id,level=4)
	totaluser4=len(level4)
	if totalusersgivenrate>0:
		prec4=(100*totaluser4)/totalusersgivenrate
	else:
		prec4=0
	

	totaluser5=0
	level5=rating1.objects.all().filter(product_id=id,level=5)
	totaluser5=len(level5)
	if totalusersgivenrate>0:
		prec5=(100*totaluser5)/totalusersgivenrate
	else:
		prec5=0
	
	productslider=productAttributes1.objects.raw('select p.*,a.*,c.* from product p,product_attributes a,categories c where a.product_id=p.id and p.category_id=c.id and p.id!=%d and c.id in (select id from categories where parent_id=(select id from categories where id=(select parent_id from categories where id=(select category_id from product where id=%d)))) GROUP by p.id'%(id,id))
	
	if request.session.has_key('username'):
		data=productAttributes1.objects.raw('SELECT a.*,p.* from product_attributes a,product p where a.product_id=p.id and a.product_id=%d group by a.product_id'%id)
		varient=productAttributes1.objects.all().filter(product_id = id)
		proimg=productImage1.objects.all().filter(product_id = id)
		cartdata=cart1.objects.raw('select c.*,p.id as "proid" from cart c,product p,product_attributes pa where c.product_attributes_id=pa.id and pa.product_id=p.id and c.user_id=%d'%request.session['username'])
		ratedatacheck=rating1.objects.filter(product_id=id,user_id=request.session['username']).count()
		feeddatacheck=feedback1.objects.filter(product_id=id,user_id=request.session['username']).count()
		customername=users.objects.get(id=request.session['username'])
		feedbackdata=feedback1.objects.raw('SELECT * FROM `feedback` where user_id!=%d and product_id=%d'%(request.session['username'],id))
		if ratedatacheck>0:
			ratedata=rating1.objects.get(product_id=id,user_id=request.session['username'])
			if feeddatacheck>0:
				feeddata=feedback1.objects.get(product_id=id,user_id=request.session['username'])
				context={"customername":customername,"data":data,"varient":varient,"proimg":proimg,"productslider":productslider,"cartdata":cartdata,"ratedata":ratedata,"feeddata":feeddata,"feedbackdata":feedbackdata,"avg":avg,"totalusersgivenrate":totalusersgivenrate,"totaluser1":totaluser1,"totaluser2":totaluser2,"totaluser3":totaluser3,"totaluser4":totaluser4,"totaluser5":totaluser5,"prec1":prec1,"prec2":prec2,"prec3":prec3,"prec4":prec4,"prec5":prec5}
			else:
				feeddata=""
				context={"customername":customername,"data":data,"varient":varient,"proimg":proimg,"productslider":productslider,"cartdata":cartdata,"ratedata":ratedata,"feeddata":feeddata,"feedbackdata":feedbackdata,"avg":avg,"totalusersgivenrate":totalusersgivenrate,"totaluser1":totaluser1,"totaluser2":totaluser2,"totaluser3":totaluser3,"totaluser4":totaluser4,"totaluser5":totaluser5,"prec1":prec1,"prec2":prec2,"prec3":prec3,"prec4":prec4,"prec5":prec5}
		else:
			ratedata=0
			feeddata=""
			context={"customername":customername,"data":data,"varient":varient,"proimg":proimg,"productslider":productslider,"cartdata":cartdata,"ratedata":ratedata,"feeddata":feeddata,"feedbackdata":feedbackdata,"avg":avg,"totalusersgivenrate":totalusersgivenrate,"totaluser1":totaluser1,"totaluser2":totaluser2,"totaluser3":totaluser3,"totaluser4":totaluser4,"totaluser5":totaluser5,"prec1":prec1,"prec2":prec2,"prec3":prec3,"prec4":prec4,"prec5":prec5}
		return render(request,'FrontEnd/product-page.html',context)
	else:
		data=productAttributes1.objects.raw('SELECT a.*,p.* from product_attributes a,product p where a.product_id=p.id and a.product_id=%d group by a.product_id'%id)
		varient=productAttributes1.objects.all().filter(product_id = id)
		proimg=productImage1.objects.all().filter(product_id = id)
		feedbackdata=feedback1.objects.filter(product_id=id)
		context={"data":data,"varient":varient,"proimg":proimg,"avg":avg,"totalusersgivenrate":totalusersgivenrate,"feedbackdata":feedbackdata,"productslider":productslider,"totaluser1":totaluser1,"totaluser2":totaluser2,"totaluser3":totaluser3,"totaluser4":totaluser4,"totaluser5":totaluser5,"prec1":prec1,"prec2":prec2,"prec3":prec3,"prec4":prec4,"prec5":prec5}
		return render(request,'FrontEnd/product-page.html',context)

#Getting Price Product Attriute Wise
def price(request):
	if request.method=="GET":
		cid=request.GET['id']
		data=productAttributes1.objects.get(id=cid)
		price=data.price
		return HttpResponse(price)

#Getting Stock Product Attriute Wise
def stock(request):
	if request.method=="GET":
		cid=request.GET['id']
		data=productAttributes1.objects.get(id=cid)
		stock=data.stock
		return HttpResponse(stock)

#Getting Ram Product Attriute Wise
def ram(request):
	if request.method=="GET":
		cid=request.GET['id']
		data=productAttributes1.objects.get(id=cid)
		ram=data.ram
		return HttpResponse(ram)

#Getting Rom Product Attriute Wise
def rom(request):
	if request.method=="GET":
		cid=request.GET['id']
		data=productAttributes1.objects.get(id=cid)
		rom=data.rom
		return HttpResponse(rom)

#Geeting Product Wise Add To Cart Button
def addcart(request):
	if request.method=="GET":
		aid=request.GET['id']
		cartdata=cart1.objects.filter(product_attributes_id=aid,user_id=request.session['username']).count()
		if cartdata==1:
			return HttpResponse("Successfully")
		else:
			return HttpResponse("fali")

#User Details
def account(request):
	if request.session.has_key('username'):
		data=users.objects.get(id=request.session['username'])
		area_data=area1.objects.all()
		address=develiery_address_customer1.objects.all().filter(user_id=request.session['username']).order_by('-flag')
		context={"data":data,"area_data":area_data,"address":address}
		return render(request,'FrontEnd/account.html',context)
	else:
		return redirect('logincustom')

#Update Normal User Data
def update_account(request):
	if request.session.has_key('username'):
		if request.method=="POST":
			try:
				data=users.objects.get(id=request.session['username'])
				data.name=request.POST['name']
				data.contact_no=request.POST['contact_no']
				data.save()
				messages.info(request,'Data Successfully Change')
				return redirect('account')
			except:
				messages.info(request,'Data not Change')
		return redirect('account')
	else:
		return redirect('logincustom')

#Getting Ram Product Attriute Wise
def city(request):
	if request.method=="GET":
		cid=request.GET['id']
		area_data=area1.objects.get(id=cid)
		data=city1.objects.get(id=area_data.city_id)
		name=data.name
		return HttpResponse(name)

#Getting Ram Product Attriute Wise
def state(request):
	if request.method=="GET":
		cid=request.GET['id']
		area_data=area1.objects.get(id=cid)
		city_data=city1.objects.get(id=area_data.city_id)
		data=state1.objects.get(id=city_data.state_id)
		name=data.name
		return HttpResponse(name)

#Insert Shipping Address
def add_address(request):
	if request.session.has_key('username'):
		develieryAddressform=develieryAddressForm()
		if request.method=="POST":
			customer_customer_name=request.POST['customer_name']
			customer_address=request.POST['address']
			customer_landmark=request.POST['landmark']
			customer_email=request.POST['email']
			customer_contact_no=request.POST['contact_no']
			customer_area_id=request.POST['area']
			customer_user_id=request.session['username']
			flags=request.POST.get('flag')
			develieryAddressform=develieryAddressForm(request.POST)
			if develieryAddressform.is_valid():
				try:
					check=develiery_address_customer1.objects.filter(user_id=request.session['username']).count();
					if check > 0:
						addresscheck=develiery_address_customer1.objects.all().filter(address=request.POST['address'],landmark=request.POST['landmark']).count()
						if addresscheck>0:
							messages.info(request,"Devliery Address already exists !!")
							return redirect("account")
						else:
							if flags=="on":
								flagcheck=develiery_address_customer1.objects.get(flag=1,user_id=request.session['username'])
								flagcheck.flag=0
								flagcheck.save()
							develieryAddressform.save()
							messages.info(request,'Address Successfully Added to Account')
							return redirect("account")
					else:
						if flags=="on":
							develieryAddressform.save()
							messages.info(request,'Address Successfully Added to Account')
							return redirect("account")
						else:
							data=develiery_address_customer1(customer_name=customer_customer_name,address=customer_address,landmark=customer_landmark,email=customer_email,contact_no=customer_contact_no,flag=1,area_id=customer_area_id,user_id=customer_user_id)
							data.save()
							messages.info(request,'Address Successfully Added to Account')
							return redirect("account")
				except:
					pass
			else:
				develieryAddressform=develieryAddressForm()
		else:
			data=users.objects.get(id=request.session['username'])
			return render(request,'FrontEnd/account.html',{"data":data})
	else:
		return redirect('logincustom')

#Devliery Address Edit
def dev_address(request):
	if request.method=="GET":
		id=request.GET['id']
		dev_data=develiery_address_customer1.objects.get(id=id)
		area_data=area1.objects.all()
		return render(request,'FrontEnd/edit_data.html',{"dev_data":dev_data,"area_data":area_data})

#Devliery Address Update
def devliery_address_update(request,id):
	if request.session.has_key('username'):
		devleryAddressUp=develiery_address_customer1.objects.get(id=id)
		flags=request.POST.get('flag')
		develiryform=develieryAddressForm(request.POST,instance=devleryAddressUp)
		if develiryform.is_valid():
			if flags=="on":
				flagcheck=develiery_address_customer1.objects.get(flag=1,user_id=request.session['username'])
				flagcheck.flag=0
				flagcheck.save()
				develiryform.save()
				messages.info(request,'Data Successfully Change')
			else:
				check=develiery_address_customer1.objects.filter(id=id,flag=1,user_id=request.session['username']).count()
				if check>0:
					flagcheck=develiery_address_customer1.objects.get(id=id,flag=1,user_id=request.session['username'])
					flagcheck.customer_name=request.POST['customer_name']
					flagcheck.address=request.POST['address']
					flagcheck.landmark=request.POST['landmark']
					flagcheck.email=request.POST['email']
					flagcheck.contact_no=request.POST['contact_no']
					flagcheck.flag=1
					flagcheck.area_id=request.POST['area']
					flagcheck.user_id=request.session['username']
					flagcheck.save()
					messages.info(request,'Can not change default address if change the default address than select another address as a default')
				else:
					flagcheck=develiery_address_customer1.objects.get(id=id,flag=0,user_id=request.session['username'])
					flagcheck.customer_name=request.POST['customer_name']
					flagcheck.address=request.POST['address']
					flagcheck.landmark=request.POST['landmark']
					flagcheck.email=request.POST['email']
					flagcheck.contact_no=request.POST['contact_no']
					flagcheck.flag=0
					flagcheck.area_id=request.POST['area']
					flagcheck.user_id=request.session['username']
					flagcheck.save()
					messages.info(request,'Data Successfully Change')
			return redirect("account")
	else:
		return redirect('logincustom')

#Devliery Address Delected
def address_delete(request,id):
	if request.session.has_key('username'):
		addressdel=develiery_address_customer1.objects.get(id=id)
		if addressdel.flag==int(1):
			data=develiery_address_customer1.objects.filter(~Q(id = addressdel.id),user_id=addressdel.user_id).first()
			data.flag=1
			data.save()
		addressdel.delete()
		messages.info(request,'Address Successfully Delected')
		return redirect("account")
	else:
		return redirect('logincustom')

#Add To Cart
def cart(request):
	if request.session.has_key('username'):
		if request.method=="GET":
			proid=request.GET['id']
			clientid=request.session['username']
			try:
				cartdata=cart1(qty=1,product_attributes_id=proid,user_id=clientid)
				cartdata.save()
			except Exception as e:
				raise e
			return HttpResponse("Success")
	else:
		return redirect('logincustom')

#Cart Details In Cart Slider
def cartdata(request):
	if request.session.has_key('username'):
		if request.method=="GET":
			cartdata=cart1.objects.raw('select c.*,pa.*,(c.qty*pa.price) as "price" from cart c,product_attributes pa where c.product_attributes_id=pa.id and c.user_id=%d'%request.session['username'])
			# cartdata=cart1.objects.raw('select c.* from cart c,product_attributes pa,orders o where c.product_attributes_id=pa.id and o.cart_id!=c.id and c.user_id=%d'%request.session['username'])
			return render(request,'FrontEnd/cart_details.html',{"cartdata":cartdata})
	else:
		return redirect('logincustom')

#Cart_Checkout
def cart_length(request):
	if request.session.has_key('username'):
		if request.method=="GET":
			cartdata=cart1.objects.filter(user_id=request.session['username']).count()
			# cartcheck=cart1.objects.raw('select c.*,pa.*,(c.qty*pa.price) as "price" from cart c,product_attributes pa where c.product_attributes_id=pa.id and c.user_id=%d'%request.session['username'])
			return HttpResponse(cartdata)
	else:
		return redirect('logincustom')

#Cart Item Deleted
def cart_delete(request,id):
	if request.session.has_key('username'):
		try:
			cartdel=cart1.objects.get(id=id)
			cartdel.delete()
			return redirect("cart_page")
		except Exception as e:
			raise e
	else:
		return redirect('logincustom')

#Update Cart Product quantity
def quantity(request):
	if request.method=="GET":
		id=request.GET['id']
		qtyupdate=int(request.GET['qtyupdate'])
		qtydata=cart1.objects.get(id=id)
		prodata=productAttributes1.objects.get(id=qtydata.product_attributes_id)
		if prodata.stock>=qtyupdate:
			qtydata.qty=qtyupdate
			qtydata.save()
			return HttpResponse("Success")
		elif prodata.stock==1:
			return HttpResponse("one")
		else:
			cartdel=cart1.objects.get(id=id)
			cartdel.delete()
			return HttpResponse("zero")

#Cart Page
def cart_page(request):
	if request.session.has_key('username'):
		try:
			datanew=cart1.objects.raw('select c.*,pa.*,(c.qty*pa.price) as "price" from cart c,product_attributes pa where c.product_attributes_id=pa.id and c.user_id=%d'%request.session['username'])
			amount=0
			for i in datanew:
				amount=int(amount)+int(i.price)
			if amount>0:
				totalamount=int(amount)
			else:
				totalamount=int(0)
			return render(request,'FrontEnd/cart.html',{"cart_display":datanew,"amount":amount,"totalamount":totalamount})
		except Exception as e:
			raise e
	else:
		return redirect('logincustom')

#Checkout Page
def checkout(request):
	address=develiery_address_customer1.objects.all().filter(user_id=request.session['username']).order_by('-flag')
	datanew=cart1.objects.raw('select c.*,pa.*,(c.qty*pa.price) as "price" from cart c,product_attributes pa where c.product_attributes_id=pa.id and c.user_id=%d'%request.session['username'])
	amount=0
	for i in datanew:
		amount=int(amount)+int(i.price)
	if amount>0:
		totalamount=int(amount)
	else:
		totalamount=int(0)
	area_data=area1.objects.all()
	context={"address":address,"amount":amount,"totalamount":totalamount,"area_data":area_data}
	return render(request,'FrontEnd/checkout.html',context)

#Getting Address As a Biling Address
def address(request):
	if request.method=="GET":
		try:
			aid=request.GET['id']
			dev_data=develiery_address_customer1.objects.get(id=aid)
			area_data=area1.objects.all()
			return render(request,'FrontEnd/default_address.html',{"dev_data":dev_data,"area_data":area_data})
		except Exception as e:
			raise e
		
#Place Order
def placeorder(request):
	if request.session.has_key('username'):
		if request.method=="GET":
			try:
				custid=request.session['username']
				id=request.GET['id']
				flag=request.GET['check']
				number = random.randint(0, 10000)
				cartdata=cart1.objects.raw('select c.*,c.id as "cid",c.product_attributes_id as "paid",c.qty as "cqty" from cart c,product_attributes pa where c.product_attributes_id=pa.id and c.user_id=%d'%custid)
				if flag=="0":
					name=request.GET['name']
					email=request.GET['email']
					contact=request.GET['contact']
					area=request.GET['area']
					address=request.GET['address']
					landmark=request.GET['landmark']
					price=request.GET['price']
					for i in cartdata:
						ordersave=order1(customer_name=name,address=address,landmark=landmark,email=email,contact_no=contact,order_date=datetime.now(),area_id=area,amount=price,product_attributes_id=i.paid,user_id=custid,order_status="Order Placed",flag=number,qty=i.qty,develiery_address_id=id)
						ordersave.save()
						proattrdata=productAttributes1.objects.get(id=int(i.paid))
						proattrdata.stock=int(proattrdata.stock)-int(i.cqty)
						proattrdata.save()
						cartdel=cart1.objects.get(id=int(i.cid))
						cartdel.delete()
					return HttpResponse('Success')
				else:
					price=request.GET['price']
					dev_data=develiery_address_customer1.objects.get(id=int(id))
					for i in cartdata:
						ordersave=order1(customer_name=dev_data.customer_name,address=dev_data.address,landmark=dev_data.landmark,email=dev_data.email,contact_no=dev_data.contact_no,order_date=datetime.now(),area_id=dev_data.area_id,amount=price,product_attributes_id=i.paid,user_id=custid,order_status="Order Placed",flag=number,qty=i.qty,develiery_address_id=id)
						ordersave.save()
						proattrdata=productAttributes1.objects.get(id=int(i.paid))
						proattrdata.stock=int(proattrdata.stock)-int(i.cqty)
						proattrdata.save()
						cartdel=cart1.objects.get(id=int(i.cid))
						cartdel.delete()
					return HttpResponse('Success')
			except Exception as e:
				raise e
	else:
		return redirect('logincustom')

#Thank You Page
def thankyou(request):
	if request.session.has_key('username'):
		return render(request,'FrontEnd/thank_you.html')
	else:
		return redirect('logincustom')

#My Order Page
def myorder(request):
	if request.session.has_key('username'):
		# data=order1.objects.all().group_by('flag')
		data=order1.objects.raw('select * from orders where user_id=%d group by flag order by id desc'%request.session['username'])
		returndata=sales1.objects.raw('select s.*,DATE_ADD(s.sales_date, INTERVAL 10 DAY) as "newdate" from orders o,sales s where user_id=%d and s.order_id=o.id group by flag order by id desc'%request.session['username'])
		paginator = Paginator(data, 6)
		page = request.GET.get('page')
		try:
			data = paginator.page(page)
		except PageNotAnInteger:
			data = paginator.page(1)
		except EmptyPage:
			data = paginator.page(paginator.num_pages)
		return render(request,'FrontEnd/my_order.html',{"data":data,"returndata":returndata})
	else:
		return redirect('logincustom')

#Place Order Products Details Product Wise
def order_details(request):
	if request.method=="GET":
		try:
			cid=int(request.GET['id'])
			data=order1.objects.raw('select * from orders where flag=(select flag from orders where id=%d and user_id=%d) order by id'%(cid,request.session['username']))
			# salesreturndata=salesReturn1.objects.raw('select o.* from orders o,sales s,sales_return sr where sr.sales_id=s.id and s.order_id=o.id and o.user_id=%d and o.flag=(select flag from orders where id=%d)'%(request.session['username'],cid))
			# print(salesreturndata.sales_id)
			# salesdata=sales1.objects.filter(id=salesreturndata.sales_id)
			# return HttpResponse("Success")
			return render(request,'FrontEnd/my_order_details.html',{"data":data})
		except Exception as e:
			raise e

# Cancle Order Before Delivered
def cancle_orders(request):
	try:
		if request.method=="GET":
			oid=int(request.GET['id'])
			data=order1.objects.get(id=oid)
			orderdata=order1.objects.filter(flag=data.flag)
			for i in orderdata:
				i.cancle_flag=1
				i.save()
				attrdata=productAttributes1.objects.get(id=i.product_attributes_id)
				attrdata.stock=int(attrdata.stock)+int(i.qty)
				attrdata.save()
			return HttpResponse("Success")
	except Exception as e:
		raise e

#Return Product Or not
def return_orders__msg(request):
	try:
		if request.method=="GET":
			oid=int(request.GET['id'])
			data=salesReturn1.objects.raw('select * from sales_return sr,sales s,orders o where sr.sales_id=s.id and s.order_id=o.id and o.id=%d and sr.user_id=%d'%(oid,request.session['username']))
			return HttpResponse(len(data))
	except Exception as e:
		raise e

#Add and Update Rating Product wise
def add_rating(request):
	if request.session.has_key('username'):
		if request.method=="GET":
			pid=int(request.GET['id'])
			level=int(request.GET['level'])
			checkdata=rating1.objects.raw('select p.id from sales s,orders o,product_attributes pa,product p where s.order_id=o.id and o.product_attributes_id=pa.id and pa.product_id=p.id and o.user_id=%d and p.id=%d'%(request.session['username'],pid))
			if len(checkdata)>0:
				ratedatacheck=rating1.objects.filter(product_id=pid,user_id=request.session['username']).count()
				if ratedatacheck>0:
					ratedata=rating1.objects.get(product_id=pid,user_id=request.session['username'])
					ratedataup=rating1.objects.filter(id=ratedata.id).update(level=level)
				else:
					ratedataup=rating1(level=level,user_id=request.session['username'],product_id=pid)
					ratedataup.save()
				return HttpResponse("Success")
			else:
				return HttpResponse("Fail")
	else:	
		return redirect('logincustom')

#Return Sales Products
def return_orders(request):
	try:
		if request.method=="GET":
			oid=int(request.GET['id'])
			reason=request.GET['reason']
			salesdata=sales1.objects.get(order_id=oid)
			orderdata=order1.objects.get(id=oid)
			salesreturn=salesReturn1(reason=reason,product_attributes_id=orderdata.product_attributes_id,sales_id=salesdata.id,sales_return_date=datetime.now(),user_id=request.session['username'])
			salesreturn.save()
			proattrdata=productAttributes1.objects.get(id=orderdata.product_attributes_id)
			proattrdata.stock=int(proattrdata.stock)+int(orderdata.qty)
			proattrdata.save()
			return HttpResponse("Success")
	except Exception as e:
		raise e

#Sales Return Products Accroding to order wise
def sales_return_details(request):
	try:
		if request.method=="GET":
			oid=int(request.GET['id'])
			salesreturndata=salesReturn1.objects.raw('select sr.* from orders o,sales s,sales_return sr where sr.sales_id=s.id and s.order_id=o.id and sr.user_id=%d and o.flag=(select flag from orders where id=%d)'%(request.session['username'],oid))
			return render(request,'FrontEnd/sales_return_details.html',{"salesreturndata":salesreturndata})
	except Exception as e:
		raise e

#Add and Update Feedback Product wise
def add_feedback(request):
	if request.session.has_key('username'):
		if request.method=="GET":
			pid=int(request.GET['id'])
			feedback=request.GET['feedback']
			checkdata=feedback1.objects.raw('select p.id from sales s,orders o,product_attributes pa,product p where s.order_id=o.id and o.product_attributes_id=pa.id and pa.product_id=p.id and o.user_id=%d and p.id=%d'%(request.session['username'],pid))
			if len(checkdata)>0:
				feedbackdatacheck=feedback1.objects.filter(product_id=pid,user_id=request.session['username']).count()
				if feedbackdatacheck>0:
					feedbackdata=feedback1.objects.get(product_id=pid,user_id=request.session['username'])
					feedbackdataup=feedback1.objects.filter(id=feedbackdata.id).update(title=feedback,feedback_date=datetime.now())
				else:
					feedbackdataup=feedback1(title=feedback,feedback_date=datetime.now(),user_id=request.session['username'],product_id=pid)
					feedbackdataup.save()
				return HttpResponse("Success")
			else:
				return HttpResponse("Fail")
	else:
		return redirect('logincustom')

#Change user Password
def changepass(request):
	if request.session.has_key('username'):
		if request.method=="POST":
			cpass=request.POST['cpass']
			npass=request.POST['npass']
			nccpass=request.POST['ncpass']
			if npass!=nccpass:
				messages.error(request,"New Password and Confirm Password not same !!!")
			else:
				if users.objects.filter(password=cpass,id=request.session['username']).exists():
					if npass!=cpass:
						user=users.objects.get(id=request.session['username'])
						user.password=npass
						user.save()
						messages.info(request,"Password Successfully Change !!!")
						return redirect('account')
				else:
					messages.error(request,"Incorrect Current Password !!!")
		return render(request,'FrontEnd/account.html')
	else:
		return redirect('logincustom')

#Forgot User Password
def forgot(request):
	if request.method=="POST":
		username=request.POST['email']
		try:
			user_email=users.objects.get(email=username,admin_flag=0)
			if user_email is not None:
				userpass=users.objects.get(id=user_email.id)
				#print(userpass)
				otp = get_random_string(length=12)
				#otp=random.randint(000000,999999)
				#print('otp is=>',otp)
				email1 = mail.EmailMessage(
				  	'A to Z ELECTRONIC',
				    'YOUR NEW PASSWORD: '+ str(otp)+ ",\nUSING THIS PASSWORD TO LOGIN OUR SITE",
				    'mrdarshanpatel1010@gmail.com',
				    [username],
				   	connection=connection,
					)
				email1.send()
				userpass.password=otp
				userpass.save()
				messages.info(request,"Your New Password Send your email. Please check your email !")
		except:
			messages.info(request,"Account does not exist !")
		
	return render(request,'FrontEnd/forgot.html')

#Contact US Page
def contact_us(request):
	if request.method=="POST":
		name=request.POST['name']
		email=request.POST['email']
		subject=request.POST['subject']
		messages=request.POST['message']
		email1 = mail.EmailMessage(
		  	'ENQUIRY FROM A to Z ELECTRONIC',
		    'DEAR CUSTOMER !'+ ",\nYOUR ENQUIRY DETAILS AS BELOW "+ ",\nNAME :- "+ str(name)+ ",\nEMAIL :- "+str(email)+",\nSUBJECT :- "+str(subject)+",\nMESSAGE :- "+str(messages),
		    'mrdarshanpatel1010@gmail.com',
		    [email],
		   	connection=connection,
			)
		email1.send()
	company=company1.objects.get()
	return render(request,'FrontEnd/contact.html',{"data":company})

#Footer Part
def footer(request):
	company=company1.objects.get()
	return render(request,'FrontEnd/footer_company.html',{"data":company})

#Generated Invoice
def invoice(request,id):
	if request.session.has_key('username'):
		orderdata=order1.objects.raw('select *,(o.qty*pa.price) as "total" from orders o,product_attributes pa where o.product_attributes_id=pa.id and o.flag=(select flag from orders where id=%d and user_id=%d) order by o.id'%(id,request.session['username']))
		companydata=company1.objects.get()
		data={"data":orderdata,"companydata":companydata}
		template=get_template("FrontEnd/invoice.html")
		data_p=template.render(data)
		response=BytesIO()
		pdfPage=pisa.pisaDocument(BytesIO(data_p.encode("UTF-8")),response)
		if not pdfPage.err:
			return HttpResponse(response.getvalue(),content_type="application/pdf")
		else:
			return HttpResponse("Error Generating PDF")
	else:
		return redirect('logincustom')

#About Us Page
def about(request):
	company=company1.objects.get()
	return render(request,'FrontEnd/about.html',{"data":company})