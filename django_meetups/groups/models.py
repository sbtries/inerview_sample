from django.db.models.fields import CharField
from accounts.models import CustomUser
from django.db import models

class User(models.Model):
    firstName = models.CharField(max_length=20)
    lastName = models.CharField(max_length=40)

    def __str__(self):
        return f"{self.lastName}, {self.firstName}"

class Group(models.Model):
    members = models.ManyToManyField(User, through='GroupMember')
    title = models.CharField(max_length=20)
    def __str__(self):
        return self.title

class GroupMember(models.Model):
    ROLES = (
        ('Organizer', 'Organizer'),
        ('Participant', 'Participant'),
        ('Presenter', 'Presenter')
    )
    group = models.ForeignKey(Group, on_delete=models.CASCADE, blank=True, related_name='member_group') 
    role = models.CharField(max_length=20, choices=ROLES, default='Participant')
    member = models.ForeignKey(User, on_delete=models.CASCADE, related_name='member_user')
    def __str__(self):
        return f"{self.group } | {self.role} | {self.member}"
