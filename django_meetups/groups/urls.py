from django.contrib import admin
from django.urls import path, include
from django.views.generic.base import TemplateView
from .views import IndexView, UpdateView, NewGroup, DeleteGroup, UpdateGroup

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('group_info', UpdateView.as_view(), name='update'),
    path('delete_group/<int:id>', DeleteGroup.as_view(), name='delete_group'),
    path('update_group/<int:id>', UpdateGroup.as_view(), name='update_group'),
    path('new_group/', NewGroup.as_view(), name='new_group')
]