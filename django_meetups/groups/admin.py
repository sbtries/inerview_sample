from django.contrib import admin
from .models import Group, User, GroupMember

admin.site.register(Group)
admin.site.register(User)
admin.site.register(GroupMember)