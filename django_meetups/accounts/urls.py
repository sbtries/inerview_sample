from django.urls import path
from .views import SignUpView, AdminView

urlpatterns = [
    path('signup/', SignUpView.as_view(), name='signup'),
    path('admin/', AdminView.as_view(), name='admin'),
]