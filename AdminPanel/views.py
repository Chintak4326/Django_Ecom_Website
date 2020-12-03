from django.shortcuts import render,redirect
from AdminPanel.forms import *
from AdminPanel.models import *
from django.contrib import messages
from django.contrib.auth.models import User,auth
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.contrib.sessions.models import Session
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa
from io import BytesIO
from datetime import datetime

def adminpanel(request):
    if request.session.has_key('name'):
        return redirect('Dashboard')
    else:   
        try:
            if request.method=="POST":
                username=request.POST['username']
                password=request.POST['password']
                if users.objects.filter(email=username,password=password,admin_flag=1).exists():
                    adminid=users.objects.get(email=username)
                    request.session['name']=adminid.name
                    return redirect('Dashboard')
                elif employee1.objects.filter(emp_email=username,emp_password=password).exists():
                    print("heello")
                    empid=employee1.objects.get(emp_email=username)
                    request.session['emp_name']=empid.id
                    return redirect('orders')
                else:
                    messages.error(request,'Wrong Username and Password !!!')
                    return redirect('adminpanel')
            else:
                return render(request, 'AdminPanel/login.html')
        except:
            return redirect('adminpanel')

def changepassword(request):
    if request.session.has_key('name'):
        if request.method=="POST":
            cpass=request.POST['cpwd']
            npass=request.POST['ncwd']
            nccpass=request.POST['nccwd']
            if npass!=nccpass:
                messages.error(request,'New Password and Confirm Password not same !!!')
            else:
                user=users.objects.get(name=request.session['name'])
                #check=user.check_password(cpass)
                if users.objects.filter(password=cpass,id=user.id).exists():
                    if npass!=cpass:
                        #user.set_password(npass)
                        user.password=npass
                        user.save()
                        messages.error(request,'Password Successfully Change !!!')
                    else:
                        messages.error(request,'Password not same as Current Password !!!')
                else:
                    messages.error(request,'Incorrect Current Password !!!')

        return render(request, 'AdminPanel/changepassword.html')
    else:   
        return redirect('adminpanel')

#def adminpanel(request):
#    if request.method=="POST":
#        username=request.POST['username']
#        password=request.POST['password']
#        print(username,password)
#        if login1.objects.filter(username=username,password=password,admin_flag=1).exists():
#            request.session['username']=username
#            return redirect('index')
#    return render(request, 'AdminPanel/login.html')


def index(request):
    if request.session.has_key('name'):
        proattrdata=productAttributes1.objects.filter(stock__lte=3)
        data=order1.objects.raw('select * from orders where order_status="Order Placed" and cancle_flag!=1 group by flag order by id')
        orderdata=len(data)
        salesdata=sales1.objects.raw('select * from orders o,sales s,sales_return sr where s.order_id=o.id and sr.sales_id!=s.id and s.sales_date=CURDATE() group by flag order by o.id')
        salescount=len(salesdata)
        salesreturncount=sales1.objects.raw('select * from orders o,sales s,sales_return sr where s.order_id=o.id and sr.sales_id=s.id and sr.sales_return_date=CURDATE() group by flag')
        salesreturncount=len(salesreturncount)
        return render(request, 'AdminPanel/index.html',{"proattrdata":proattrdata,"orderdata":orderdata,"salescount":salescount,"salesreturncount":salesreturncount})
    else:   
        return redirect('adminpanel')

def logout(request):
    #auth.logout(request)
    if request.session.has_key('name'):
        #request.session.flush()
        #Session.objects.filter(session_key=request.session.session_key).delete()
        del request.session['name']
        messages.error(request,'Logout Successfully !!!')
        return redirect('adminpanel')
    else:   
        return redirect('adminpanel')

#Company CRUD OPerations

def add_company(request):
    if request.session.has_key('name'):
        companyform=companyForm()
        if request.method=="POST":
            companyform=companyForm(request.POST)
            if companyform.is_valid():
                try:
                    companycheck=company1.objects.all().filter(address=request.POST['address']).count()
                    if companycheck>0:
                        messages.info(request,"Company already exists !!")
                    else:
                        companyform.save()
                        return redirect("company_show")
                except:
                    pass
            else:
                companyform=companyForm()

        return render(request, 'AdminPanel/add_company.html',{"form":companyform})
    else:   
        return redirect('adminpanel')

def company_show(request):
    if request.session.has_key('name'):
        companydata=company1.objects.all()
        return render(request, 'AdminPanel/company_show.html',{"companydata":companydata})
    else:   
        return redirect('adminpanel')


def company_delete(request,id):
    if request.session.has_key('name'):
        companydel=company1.objects.get(id=id)
        companydel.delete()
        return redirect("company_show")
    else:   
        return redirect('adminpanel')

def company_edit(request,id):
    if request.session.has_key('name'):
        companyedit=company1.objects.get(id=id)
        return render(request, 'AdminPanel/company_edit.html',{'companyedit':companyedit})
    else:   
        return redirect('adminpanel')

def company_update(request,id):
    if request.session.has_key('name'):
        companyup=company1.objects.get(id=id)
        companyform=companyForm(request.POST,instance=companyup)
        if companyform.is_valid():
            companyform.save()
            return redirect("company_show")
        return render(request, 'AdminPanel/company_edit.html',{'form':companyform})
    else:   
        return redirect('adminpanel')

#Employee CRUD Operations
def add_employee(request):
    if request.session.has_key('name'):
        employeeform=employeeForm()
        if request.method=="POST":
            employeeform=employeeForm(request.POST)
            if employeeform.is_valid():
                try:
                    employeecheck=employee1.objects.all().filter(emp_name=request.POST['emp_name']).count()
                    if employeecheck>0:
                        messages.error(request, 'Employee already exist.')
                    else:
                        employeeform.save()
                        return redirect("employee_show")
                except:
                    pass
            else:
                employeeform=employeeForm()

        return render(request, 'AdminPanel/add_employee.html',{'form':employeeform})
    else:   
        return redirect('adminpanel')

def employee_show(request):
    if request.session.has_key('name'):
        employeeData=employee1.objects.all()
        return render(request, 'AdminPanel/employee_show.html',{'employeeData':employeeData})
    else:   
        return redirect('adminpanel')

def employee_delete(request,id):
    if request.session.has_key('name'):
        empdel=employee1.objects.get(id=id)
        empdel.delete()
        return redirect("employee_show")
    else:   
        return redirect('adminpanel')


def employee_edit(request,id):
    if request.session.has_key('name'):
        empedit=employee1.objects.get(id=id)
        return render(request, 'AdminPanel/employee_edit.html',{'empedit':empedit})
    else:   
        return redirect('adminpanel')

def employee_update(request,id):
    if request.session.has_key('name'):
        empup=employee1.objects.get(id=id)
        empform=employeeForm(request.POST,instance=empup)
        if empform.is_valid():
            empform.save()
            return redirect("employee_show")
        return render(request, 'AdminPanel/employee_edit.html',{'form':empform})
    else:   
        return redirect('adminpanel')
#State CRUD Operations

def add_state_form(request):
    if request.session.has_key('name'):
        stateform=stateForm()
        if request.method=="POST":
            stateform=stateForm(request.POST)
            if stateform.is_valid():
                try:
                    statecheck=state1.objects.all().filter(name=request.POST['name']).count()
                    if statecheck>0:
                        messages.error(request, 'State already exist.')
                    else:
                        stateform.save()
                        return redirect("add_state_show")
                except:
                    pass
            else:
                stateform=stateForm()

        return render(request, 'AdminPanel/add_state.html',{'form':stateform})
    else:   
        return redirect('adminpanel')


def add_state_form_show(request):
    if request.session.has_key('name'):
        stateData=state1.objects.all()
        return render(request, 'AdminPanel/add_state_show.html',{'stateData':stateData})
    else:   
        return redirect('adminpanel')

def add_state_form_delete(request,id):
    if request.session.has_key('name'):
        statedel=state1.objects.get(id=id)
        statedel.delete()
        return redirect("add_state_show")
    else:   
        return redirect('adminpanel')


def add_state_form_data_edit(request,id):
    if request.session.has_key('name'):
        statedit=state1.objects.get(id=id)
        return render(request, 'AdminPanel/add_state_edit.html',{'statedit':statedit})
    else:   
        return redirect('adminpanel')


def add_state_form_data_update(request,id):
    if request.session.has_key('name'):
        stateup=state1.objects.get(id=id)
        stateform=stateForm(request.POST,instance=stateup)
        if stateform.is_valid():
            stateform.save()
            return redirect("add_state_show")
        return render(request, 'AdminPanel/add_state_edit.html',{'form':stateform})
    else:   
        return redirect('adminpanel')

#City CRUD OPerations

def add_city(request):
    if request.session.has_key('name'):
        cityform=cityForm()
        if request.method=="POST":
            cityform=cityForm(request.POST)
            if cityform.is_valid():
                try:
                    citycheck=city1.objects.all().filter(name=request.POST['name'],state_id=request.POST['state']).count()
                    if citycheck>0:
                        messages.error(request, 'City already exist.')
                    else:
                        cityform.save()
                        return redirect("city_show")
                except:
                    pass
            else:
                cityform=cityForm()

        statedata=state1.objects.all()
        return render(request, 'AdminPanel/add_city.html',{'statedata':statedata})
    else:   
        return redirect('adminpanel')


def city_show(request):
    if request.session.has_key('name'):
        citydata=city1.objects.raw('select c.*,s.name as "statename" from state s,city c where c.state_id=s.id')
        return render(request, 'AdminPanel/city_show.html',{'citydata':citydata})
    else:   
        return redirect('adminpanel')
        

def city_delete(request,id):
    if request.session.has_key('name'):
        citydel=city1.objects.get(id=id)
        citydel.delete()
        return redirect("city_show")
    else:   
        return redirect('adminpanel')


def city_edit(request,id):
    if request.session.has_key('name'):
        cityedit=city1.objects.get(id=id)
        statename=state1.objects.filter(id=cityedit.state_id)
        statedata=state1.objects.all()
        context={"cityedit":cityedit,"statename":statename,"statedata":statedata}
        return render(request, 'AdminPanel/city_edit.html',context)
    else:   
        return redirect('adminpanel')


def city_update(request,id):
    if request.session.has_key('name'):
        cityup=city1.objects.get(id=id)
        cityform=cityForm(request.POST,instance=cityup)
        if cityform.is_valid():
            cityform.save()
            return redirect("city_show")
        return render(request, 'AdminPanel/city_edit.html',{'form':cityform})
    else:   
        return redirect('adminpanel')

#Area CRUD OPerations

def add_area(request):
    if request.session.has_key('name'):
        if request.method=="POST":
            areaform=areaForm(request.POST)
            if areaform.is_valid():
                try:
                    areacheck=area1.objects.all().filter(pincode=request.POST['pincode'],city_id=request.POST['city']).count()
                    if areacheck>0:
                        messages.error(request, 'Area already exist.')
                    else:
                        areaform.save()
                        return redirect("area_show")
                except:
                    pass
            else:
                areaform=areaForm()

        citydata=city1.objects.raw('select c.*,s.name as "statename" from state s,city c where c.state_id=s.id')
        return render(request, 'AdminPanel/add_area.html',{"citydata":citydata})
    else:   
        return redirect('adminpanel')


def area_show(request):
    if request.session.has_key('name'):
        areadata=area1.objects.raw('select a.*,c.name as "cityname",s.name as "statename" from area a,state s,city c where a.city_id=c.id and c.state_id=s.id')
        return render(request, 'AdminPanel/area_show.html',{'areadata':areadata})
    else:   
        return redirect('adminpanel')


def area_delete(request,id):
    if request.session.has_key('name'):
        areadel=area1.objects.get(id=id)
        areadel.delete()
        return redirect("area_show")
    else:   
        return redirect('adminpanel')


def area_edit(request,id):
    if request.session.has_key('name'):
        areadata=area1.objects.get(id=id)
        predata=area1.objects.raw('select a.*,c.name as "cityname",s.name as "statename" from area a,state s,city c where a.city_id=c.id and c.state_id=s.id and a.id=%d'%id)
        citydata=city1.objects.raw('select c.*,s.name as "statename" from state s,city c where c.state_id=s.id')
        context={"areadata":areadata,"citydata":citydata,"predata":predata}
        return render(request, 'AdminPanel/area_edit.html',context)
    else:   
        return redirect('adminpanel')


def area_update(request,id):
    if request.session.has_key('name'):
        areaup=area1.objects.get(id=id)
        areaform=areaForm(request.POST,instance=areaup)
        if areaform.is_valid():
            areaform.save()
            return redirect("area_show")
        return render(request, 'AdminPanel/area_edit.html',{'form':areaform})
    else:   
        return redirect('adminpanel')

#Category CRUD OPerations

def add_category_form(request):
    if request.session.has_key('name'):
        categoryform=categoryForm()
        if request.method=="POST":
            categoryform=categoryForm(request.POST)
            if categoryform.is_valid():
                try:
                    categorycheck=categories1.objects.all().filter(name=request.POST['name'],parent_id=request.POST['parent']).count()
                    if categorycheck>0:
                        messages.error(request, 'Category already exist.')
                    else:
                        categoryform.save()
                        return redirect("add_category_show")
                except:
                    pass
            else:
                categoryform=categoryForm()
            
        categoryData=categories1.objects.all().filter(parent_id=2)
        return render(request, 'AdminPanel/add_category.html',{'Data': categoryData})
    else:   
        return redirect('adminpanel')


def add_category_form_show(request):
    if request.session.has_key('name'):
        categoryData=categories1.objects.raw('select c1.id,c.name as "parentname",c1.name,c1.url from categories c,categories c1 where c1.parent_id=c.id ORDER BY `id` ASC')
        return render(request, 'AdminPanel/add_category_show.html',{'categoryData':categoryData})
    else:   
        return redirect('adminpanel')


def add_category_form_delete(request,id):
    if request.session.has_key('name'):
        categorydel=categories1.objects.get(id=id)
        categorydel.delete()
        return redirect("add_category_show")
    else:   
        return redirect('adminpanel')


def add_category_form_data_edit(request,id):
    if request.session.has_key('name'):
        categoryedit=categories1.objects.get(id=id)
        categoryparent=categories1.objects.all().filter(id=categoryedit.parent_id)
        categoryData=categories1.objects.all().filter(parent_id=2)
        context={"categoryedit":categoryedit,"categoryData":categoryData,"categoryparent":categoryparent}
        return render(request, 'AdminPanel/add_category_edit.html',context)
    else:   
        return redirect('adminpanel')


def add_category_form_data_update(request,id):
    if request.session.has_key('name'):
        categoryup=categories1.objects.get(id=id)
        categoryform=categoryForm(request.POST,instance=categoryup)
        if categoryform.is_valid():
            categoryform.save()
            return redirect("add_category_show")
        return render(request, 'AdminPanel/add_category_edit.html',{'form':categoryform})
    else:   
        return redirect('adminpanel')


#Product CRUD OPerations

def add_product_form(request):
    if request.session.has_key('name'):
        productform=productForm()
        if request.method=="POST":
            productform=productForm(request.POST,request.FILES)
            if productform.is_valid():
                try:
                    productcheck=product1.objects.all().filter(product_name=request.POST['product_name']).count()
                    if productcheck>0:
                        messages.error(request, 'Product already exist.')
                    else:
                        productform.save()
                        return redirect("product_show")
                except:
                    pass
            else:
                productform=productForm()

        categoryData=categories1.objects.all().filter(parent_id = 2)
        subcategoryData=categories1.objects.raw('select * FROM categories where parent_id in (select id from categories where parent_id=2) ORDER by parent_id asc')
        context={"categoryData":categoryData,"subcategoryData":subcategoryData}
        return render(request, 'AdminPanel/add_product.html',context)
    else:   
        return redirect('adminpanel')


def product_show(request):
    if request.session.has_key('name'):
        productData=product1.objects.raw('select p.*,c.name,c1.name as "parent" from product p,categories c1,categories c where p.category_id=c.id and c1.id=c.parent_id')
        return render(request, 'AdminPanel/product_show.html',{'data':productData})
    else:   
        return redirect('adminpanel')


def product_delete(request,id):
    if request.session.has_key('name'):
        productdel=product1.objects.get(id=id)
        productdel.delete()
        return redirect("product_show")
    else:   
        return redirect('adminpanel')


def product_edit(request,id):
    if request.session.has_key('name'):
        productedit=product1.objects.get(id=id)
        subname=categories1.objects.all().filter(id=productedit.category_id)
        categoryData=categories1.objects.all().filter(parent_id=2)
        subcategoryData=categories1.objects.raw('select * FROM categories where parent_id in (select id from categories where parent_id=2) ORDER by parent_id asc')
        context={"productedit":productedit,"categoryData":categoryData,"subcategoryData":subcategoryData,"subname":subname}
        return render(request, 'AdminPanel/product_edit.html',context)
    else:   
        return redirect('adminpanel')


def product_image_delete(request,id):
    #productup=product1.objects.filter(id=id).update(images="")
    if request.session.has_key('name'):
        productup=product1.objects.get(id=id)
        productup.images=""
        productup.save()
        messages.error(request, 'Image Successfully deleted.')
        return redirect("product_edit",id=id)
    else:   
        return redirect('adminpanel')


def product_update(request,id):
    if request.session.has_key('name'):
        productup=product1.objects.get(id=id)
        productform=productForm(request.POST,request.FILES,instance=productup)
        if productform.is_valid():
            try:
    #            productcheck=product1.objects.all().filter(product_name=request.POST['product_name']).count()
    #            if productcheck>0:
    #                messages.error(request, 'Product already exist.')
    #                return redirect("product_edit",id=id)
    #            else:
                productform.save()
                return redirect("product_show")
            except:
                pass
        return render(request, 'AdminPanel/product_edit.html',{'form':productform})
    else:   
        return redirect('adminpanel')

#Product Images CRUD OPerations

def product_image(request,id):
    if request.session.has_key('name'):
        if request.method=="POST":
            files = request.FILES.getlist('url')
            for f in files:
                images=productImage1(url=f,product_id=id)
                images.save()
            return redirect("product_image",id=id)
        else:
            productimageform=productImageForm()

        imagedata=productImage1.objects.all().filter(product_id=id)
        return render(request, 'AdminPanel/add_image.html',{"imagedata":imagedata})
    else:   
        return redirect('adminpanel')


def image_delete(request,id):
    if request.session.has_key('name'):
        pid=productImage1.objects.get(id=id)
        productimgdel=productImage1.objects.get(id=id)
        productimgdel.delete()
        messages.info(request, 'Image Successfully deleted.')
        return redirect("product_image",id=pid.product_id)
    else:   
        return redirect('adminpanel')

#Product Attributes CRUD OPerations

def product_attribute(request,id):
    if request.session.has_key('name'):
        pdata=product1.objects.get(id=id)
        if request.method=="POST":
            ram=request.POST['ram']
            rom=request.POST['rom']
            color=request.POST['color']
            price=request.POST['price']
            stock=request.POST['stock']
            productcheck=productAttributes1.objects.all().filter(ram=ram,rom=rom,color=color,price=price).count()
            if productcheck>0:
                messages.error(request, 'Product already exist.')
                return redirect("product_attribute",id=id)
            else:
                productattributeform=productAttributes1(ram=ram,rom=rom,color=color,price=price,stock=stock,product_id=id)
                productattributeform.save()
                return redirect("product_attribute",id=id)
            
        attributedata=productAttributes1.objects.filter(product_id=id)
        context={"data":pdata,"attributedata":attributedata}
        return render(request, 'AdminPanel/product_attribute.html',context)
    else:   
        return redirect('adminpanel')
   

def attribute_delete(request,id):
    if request.session.has_key('name'):
        pid=productAttributes1.objects.get(id=id)
        attributedel=productAttributes1.objects.get(id=id)
        attributedel.delete()
        messages.info(request, 'Product Attribute Successfully deleted.')
        return redirect("product_attribute",id=pid.product_id)
    else:   
        return redirect('adminpanel')


def attribute_edit(request,id):
    if request.session.has_key('name'):
        attributedata=productAttributes1.objects.get(id=id)
        productdata=product1.objects.get(id=attributedata.product_id)
        context={"data":attributedata,"productdata":productdata}
        return render(request, 'AdminPanel/product_attribute_edit.html',context)
    else:   
        return redirect('adminpanel')


def attribute_update(request,id):
    if request.session.has_key('name'):
        productattup=productAttributes1.objects.get(id=id)
        productattup.ram=request.POST['ram']
        productattup.rom=request.POST['rom']
        productattup.color=request.POST['color']
        productattup.price=request.POST['price']
        productattup.stock=request.POST['stock']
    #    productcheck=productAttributes1.objects.all().filter(ram=request.POST['ram'],rom=request.POST['rom'],color=request.POST["color"],price=request.POST['price']).count()
    #    if productcheck>0:
    #        messages.error(request, 'Product already exist.')
    #        return redirect("attribute_edit",id=id)
    #    else:
        productattup.save()
        return redirect("product_attribute",id=productattup.product_id)
    else:   
        return redirect('adminpanel')

#Order Page
def orders(request):
    if request.session.has_key('name'):
        data=order1.objects.raw('select * from orders where order_status!="Delivered" and cancle_flag!=1 group by flag order by id')
        return render(request,'AdminPanel/orders.html',{"data":data})
    elif request.session.has_key('emp_name'):
        data=order1.objects.raw('select * from orders where order_status!="Delivered" and cancle_flag!=1 and employee_id=%d group by flag order by id'%request.session['emp_name'])
        return render(request,'AdminPanel/orders.html',{"data":data})
    else:
        return redirect('adminpanel')

#Order Products Details
def order_details_admin(request):
    if request.method=="GET":
        try:
            cid=int(request.GET['id'])
            data=order1.objects.raw('select * from orders where flag=(select flag from orders where id=%d)'%cid)
            return render(request,'AdminPanel/my_order_details_page.html',{"data":data})
        except Exception as e:
            raise e

#Edit Order Status
def order_status_edit(request,id):
    if request.session.has_key('name') or request.session.has_key('emp_name'):
        data=order1.objects.get(id=id)
        empdata=employee1.objects.all()
        return render(request,'AdminPanel/update_orders.html',{"data":data,"empdata":empdata})
    else:
        return redirect('adminpanel')

#Order Status Update And Store Data if Order Status Is Delivered So Store Data in Sales Table 
def order_staus_update(request,id):
    if request.session.has_key('name') or request.session.has_key('emp_name'):
        if request.method=="POST":
            try:
                data=order1.objects.get(id=id)
                orderdata=order1.objects.filter(flag=data.flag)
                for i in orderdata:
                    i.order_status=request.POST['status']
                    i.employee_id=request.POST['employee']
                    i.save()
                    if i.order_status=="Delivered":
                        sales=sales1(sales_date=datetime.now(),order_id=i.id)
                        sales.save()
                messages.info(request,"Order Status Successfully Change")
                return redirect('orders')
            except Exception as e:
                return redirect("order_staus_update",id=id)
    else:
        return redirect('adminpanel')

#Cancle Order Table
def cancle_order(request):
    if request.session.has_key('name'):
        data=order1.objects.raw('select * from orders where cancle_flag=1 group by flag order by id')
        return render(request,'AdminPanel/cancle_orders.html',{"data":data})
    else:
        return redirect('adminpanel') 

#Sales Table
def sales(request):
    if request.session.has_key('name'):
        try:
            salesdata=sales1.objects.raw('select * from orders o,sales s where s.order_id=o.id and s.id not IN (select s.id from sales s,sales_return sr where sr.sales_id=s.id) group by o.flag order by o.id desc')
            return render(request,'AdminPanel/sales.html',{"salesdata":salesdata})
        except Exception as e:
            raise e
    else:
        return redirect('adminpanel')

#Sales Product
def order_details_sales(request):
    try:
        if request.method=="GET":
            sid=int(request.GET['id'])
            salesdata=sales1.objects.raw('select * from orders o,sales s where s.order_id=o.id and flag=(select flag from orders where id=%d)'%sid)
            return render(request,'AdminPanel/sales_products.html',{"salesdata":salesdata})
    except Exception as e:
        raise e

#Sales Return Details Table
def sales_return(request):
    if request.session.has_key('name'):
        try:
            salesdata=sales1.objects.raw('select * from orders o,sales s,sales_return sr where s.order_id=o.id and sr.sales_id=s.id group by flag order by o.id desc')
            return render(request,'AdminPanel/sales_return.html',{"salesdata":salesdata})
        except Exception as e:
            raise e
    else:
        return redirect('adminpanel')

#Sales Report
def sales_report(request):
    if request.session.has_key('name'):
        orderdata=order1.objects.raw('select *,s.sales_date,(o.qty*pa.price) as "total" from orders o,sales s,product_attributes pa where s.order_id=o.id and o.product_attributes_id=pa.id and s.id not IN (select s.id from sales s,sales_return sr where sr.sales_id=s.id) order by o.id desc')
        data={"data":orderdata}
        template=get_template("AdminPanel/sales_product_repport.html")
        data_p=template.render(data)
        response=BytesIO()
        pdfPage=pisa.pisaDocument(BytesIO(data_p.encode("UTF-8")),response)
        if not pdfPage.err:
            return HttpResponse(response.getvalue(),content_type="application/pdf")
        else:
            return HttpResponse("Error Generating PDF")
    else:
        return redirect('adminpanel')

#Custom Sales Report Page
def custom_sales_report(request):
    if request.session.has_key('name'):
        try:
            return render(request,'AdminPanel/sales_report.html')
        except Exception as e:
            raise e
    else:
        return redirect('adminpanel')

#Custom Sales Report Created
def custom_sales_product_report(request):
    if request.session.has_key('name'):
        try:
            if request.method=="POST":
                sdate=request.POST['sdate']
                edate=request.POST['edate']
                orderdata=order1.objects.raw('select *,s.sales_date,(o.qty*pa.price) as "total" from orders o,sales s,product_attributes pa where s.order_id=o.id and o.product_attributes_id=pa.id and s.sales_date>="{0}" and s.sales_date<="{1}" and s.id not IN (select s.id from sales s,sales_return sr where sr.sales_id=s.id) order by o.id desc'.format(sdate,edate))
                data={"data":orderdata}
                template=get_template("AdminPanel/custom_sales_report.html")
                data_p=template.render(data)
                response=BytesIO()
                pdfPage=pisa.pisaDocument(BytesIO(data_p.encode("UTF-8")),response)
                if not pdfPage.err:
                    return HttpResponse(response.getvalue(),content_type="application/pdf")
                else:
                    return HttpResponse("Error Generating PDF")
        except Exception as e:
            raise e
    else:
        return redirect('adminpanel')

#Sales Return Report Created
def sales_return_report(request):
    if request.session.has_key('name'):
        try:
            returnorderdata=order1.objects.raw('select *,(o.qty*pa.price) as "total" from orders o,sales s,sales_return sr,product_attributes pa where s.order_id=o.id and sr.sales_id=s.id and o.product_attributes_id=pa.id order by o.id desc')
            data={"data":returnorderdata}
            template=get_template("AdminPanel/sales_product_return_report.html")
            data_p=template.render(data)
            response=BytesIO()
            pdfPage=pisa.pisaDocument(BytesIO(data_p.encode("UTF-8")),response)
            if not pdfPage.err:
                return HttpResponse(response.getvalue(),content_type="application/pdf")
            else:
                return HttpResponse("Error Generating PDF")
        except Exception as e:
            raise e
    else:
        return redirect('adminpanel')

#Custom Sales Return Report Page
def custom_sales_return_report(request):
    if request.session.has_key('name'):
        try:
            return render(request,'AdminPanel/sales_return_report.html')
        except Exception as e:
            raise e
    else:
        return redirect('adminpanel')

#Custom Sales Return Report Created
def custom_sales_product_return_report(request):
    if request.session.has_key('name'):
        try:
            if request.method=="POST":
                sdate=request.POST['sdate']
                edate=request.POST['edate']
                salesreturnorderdata=order1.objects.raw('select *,sr.sales_return_date,(o.qty*pa.price) as "total" from orders o,sales s,product_attributes pa,sales_return sr where s.order_id=o.id and o.product_attributes_id=pa.id and sr.sales_return_date>="{0}" and sr.sales_return_date<="{1}" and sr.sales_id=s.id order by o.id desc'.format(sdate,edate))
                data={"data":salesreturnorderdata}
                template=get_template("AdminPanel/custom_sales_return_report.html")
                data_p=template.render(data)
                response=BytesIO()
                pdfPage=pisa.pisaDocument(BytesIO(data_p.encode("UTF-8")),response)
                if not pdfPage.err:
                    return HttpResponse(response.getvalue(),content_type="application/pdf")
                else:
                    return HttpResponse("Error Generating PDF")
        except Exception as e:
            raise e
    else:
        return redirect('adminpanel')