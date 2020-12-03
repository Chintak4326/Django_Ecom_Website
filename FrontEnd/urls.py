from django.urls import path
from . import views


urlpatterns = [
    path('', views.index,name="index"),
    
    #Search the Products
    path('search',views.search,name="search"),

    #register
    path('register/', views.register,name="register"),
    
    #login
    path('logincustom/', views.logincustom,name="logincustom"),

    #logout
    path('logoutcustom/', views.logoutcustom,name="logoutcustom"),

    #Category wise Products
    path('shop/<str:id>',views.shop,name="shop"),
    path('shopdata/<str:id>',views.shopdata,name="shopdata"),

    #Price Filter
    path('price_filter',views.price_filter,name="price_filter"),

    #Category Dropdown
    path('category/',views.category,name="category"),

    #Side Menu Category
    path('categodata/',views.categodata,name="categodata"),
    
    #product Details
    path('product/<int:id>',views.product,name="product"),

    #Product Ajax
    path('price/',views.price,name="price"),
    path('stock/',views.stock,name="stock"),
    path('ram/',views.ram,name="ram"),
    path('rom/',views.rom,name="rom"),
    
    #Account
    path('account/',views.account,name="account"),
    path('changepass/',views.changepass,name="changepass"),
    path('forgot/',views.forgot,name="forgot"),
    path('update_account/',views.update_account,name="update_account"),
    path('add_address/',views.add_address,name="add_address"),
    path('devliery_address_update/<int:id>',views.devliery_address_update,name="devliery_address_update"),
    path('address_delete/<int:id>',views.address_delete,name="address_delete"),

    #Address Ajax
    path('city/',views.city,name="city"),
    path('state/',views.state,name="state"),
    path('dev_address/',views.dev_address,name="dev_address"),

    #Add To Cart
    path('cart/',views.cart,name="cart"),
    path('cartdata/',views.cartdata,name="cartdata"),
    path('cart_length/',views.cart_length,name="cart_length"),
    path('cart_page/',views.cart_page,name="cart_page"),
    path('addcart/',views.addcart,name="addcart"),
    path('quantity/',views.quantity,name="quantity"),
    path('cart_delete/<int:id>',views.cart_delete,name="cart_delete"),

    #Checkout
    path('checkout/',views.checkout,name="checkout"),
    path('address/',views.address,name="address"),

    #Place Order
    path('placeorder/',views.placeorder,name="placeorder"),
    
    #Thank You
    path('thankyou/',views.thankyou,name="thankyou"),
    
    #My Order Page
    path('myorder/',views.myorder,name="myorder"),

    #Place Order Products Details
    path('order_details/',views.order_details,name="order_details"),

    #Cancle Order before Delivered
    path('cancle_orders',views.cancle_orders,name="cancle_orders"),

    #Return Sales Products
    path('return_orders',views.return_orders,name="return_orders"),

    #Return Product Or not
    path('return_orders__msg',views.return_orders__msg,name="return_orders__msg"),

    #Sales Return Products Accroding to order wise
    path('sales_return_details',views.sales_return_details,name="sales_return_details"),
    
    #Add and Update Rating Product wise
    path('add_rating',views.add_rating,name="add_rating"),
    
    #Add and Update Feedback Product Wise
    path('add_feedback',views.add_feedback,name="add_feedback"),

    #Pdf Invoice
    path('invoice/<int:id>',views.invoice,name="invoice"),

    #About Us
    path('about',views.about,name="about"),
    
    #Contact_us
    path('contact_us/',views.contact_us,name="contact_us"),
       
    #Footer Part
    path('footer/',views.footer,name="footer"),
    
]

