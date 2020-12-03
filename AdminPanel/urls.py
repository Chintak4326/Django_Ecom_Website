from django.urls import path
from . import views

urlpatterns = [
    path('', views.adminpanel,name="adminpanel"),

    #index
    path('Dashboard/', views.index,name="Dashboard"),
    path('logout/', views.logout,name="logout"),

    path('changepassword/', views.changepassword,name="changepassword"),

    #Company
    path('add_company/',views.add_company,name="add_company"),
    path('company_show/',views.company_show,name="company_show"),
    path('company_delete/<int:id>',views.company_delete,name="company_delete"),
    path('company_edit/<int:id>',views.company_edit,name="company_edit"),
    path('company_update/<int:id>',views.company_update,name="company_update"),
    
    #State
    path('add_state/',views.add_state_form,name="add_state"),
    path('add_state_show/',views.add_state_form_show,name="add_state_show"),
    path('add_state_delete/<int:id>',views.add_state_form_delete,name="add_state_delete"),
    path('add_state_from_edit/<int:id>',views.add_state_form_data_edit,name="add_state_from_edit"),
    path('add_state_from_update/<int:id>',views.add_state_form_data_update,name="add_state_from_update"),

    #City
    path('add_city/',views.add_city,name="add_city"),
    path('city_show/',views.city_show,name="city_show"),
    path('city_delete/<int:id>',views.city_delete,name="city_delete"),
    path('city_edit/<int:id>',views.city_edit,name="city_edit"),
    path('city_update/<int:id>',views.city_update,name="city_update"),

    #Area
    path('add_area/',views.add_area,name="add_area"),
    path('area_show/',views.area_show,name="area_show"),
    path('area_delete/<int:id>',views.area_delete,name="area_delete"),
    path('area_edit/<int:id>',views.area_edit,name="area_edit"),
    path('area_update/<int:id>',views.area_update,name="area_update"),
    
    #EMployee
    path('add_employee/',views.add_employee,name="add_employee"),
    path('employee_show/',views.employee_show,name="employee_show"),
    path('employee_delete/<int:id>',views.employee_delete,name="employee_delete"),
    path('employee_edit/<int:id>',views.employee_edit,name="employee_edit"),
    path('employee_update/<int:id>',views.employee_update,name="employee_update"),
    
    #Category
    path('add_category/',views.add_category_form,name="add_category"),
    path('add_category_show/',views.add_category_form_show,name="add_category_show"),
    path('add_category_delete/<int:id>',views.add_category_form_delete,name="add_category_delete"),
    path('add_category_from_edit/<int:id>',views.add_category_form_data_edit,name="add_category_from_edit"),
    path('add_category_from_update/<int:id>',views.add_category_form_data_update,name="add_category_from_update"),

    #Product
    path('add_product/',views.add_product_form,name="add_product"),
    path('product_show/',views.product_show,name="product_show"),
    path('product_delete/<int:id>',views.product_delete,name="product_delete"),
    path('product_edit/<int:id>',views.product_edit,name="product_edit"),
    path('product_image_delete/<int:id>',views.product_image_delete,name="product_image_delete"),
    path('product_update/<int:id>',views.product_update,name="product_update"),
    
    #Product Images
    path('product_image/<int:id>',views.product_image,name="product_image"),
    path('image_delete/<int:id>',views.image_delete,name="image_delete"),
    
    #Product Attributes
    path('product_attribute/<int:id>',views.product_attribute,name="product_attribute"),
    path('attribute_delete/<int:id>',views.attribute_delete,name="attribute_delete"),
    path('attribute_edit/<int:id>',views.attribute_edit,name="attribute_edit"),
    path('attribute_update/<int:id>',views.attribute_update,name="attribute_update"),

    #Orders Update
    path('orders',views.orders,name="orders"),

    #Oreders Product Details
    path('order_details_admin',views.order_details_admin,name="order_details_admin"),

    #Order Status edit
    path('order_status_edit/<int:id>',views.order_status_edit,name="order_status_edit"),
    path('order_staus_update/<int:id>',views.order_staus_update,name="order_staus_update"),

    #Cancle Order Products
    path('cancle_order',views.cancle_order,name="cancle_order"),

    #Sales
    path('sales',views.sales,name="sales"),

    #Sales Return PRoducts
    path('sales_return',views.sales_return,name="sales_return"),

    #Sales Products
    path('order_details_sales',views.order_details_sales,name="order_details_sales"),

    #Sales Reports
    path('sales_report',views.sales_report,name="sales_report"),
    path('custom_sales_report',views.custom_sales_report,name="custom_sales_report"),
    path('custom_sales_product_report',views.custom_sales_product_report,name="custom_sales_product_report"),
    
    #Sales Reports
    path('sales_return_report',views.sales_return_report,name="sales_return_report"),
    path('custom_sales_return_report',views.custom_sales_return_report,name="custom_sales_return_report"),
    path('custom_sales_product_return_report',views.custom_sales_product_return_report,name="custom_sales_product_return_report"),
    
]

