from django.conf.urls import url
from django.urls import path, include

from products.views import ProductListApiView, ProductRetrieveApiView
from . import views
urlpatterns = [
    path('index/', views.index, name='index'),
    path('api/index/', views.api_index, name='api-index'),
    path('create-feedback', views.create_feedback, name='create-feedback'),
    path('feedback', views.feedback, name="feedback"),
    path('profile', views.profile, name="profile"),
    path('order/<int:order_id>', views.orderDetail, name='order-detail'),
    path('aboutus', views.aboutus ,name='aboutus'),
    url(r'^products/$', ProductListApiView.as_view()),
    url(r'^products/(?P<product_id>\w+)/?$', ProductRetrieveApiView.as_view()),
]