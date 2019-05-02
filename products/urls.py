from django.urls import path
from . import views
urlpatterns = [
    path('index/', views.index, name='index'),
    path('create-feedback', views.create_feedback, name='create-feedback'),
    path('feedback', views.feedback, name="feedback"),
    path('profile', views.profile, name="profile")
]