from django.db.models.fields import CharField
from accounts.models import CustomUser
from django.db import models

class User(models.Model):
    firstName = models.CharField(max_length=20)
    lastName = models.CharField(max_length=40)
    role = models.CharField(max_length=20, null=True, blank=True)

    def __str__(self):
        return f"{self.lastName}, {self.firstName}"

class Group(models.Model):
    member = models.ManyToManyField(User, related_name='group', null=True, blank=True)
    title = models.CharField(max_length=20)
    def __str__(self):
        return self.title