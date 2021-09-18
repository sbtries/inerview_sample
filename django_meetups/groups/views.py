from django.shortcuts import redirect, render
from django.views.generic.list import ListView
from .models import User, Group, GroupMember
from django.views.generic.base import View

# show: displays Users and their roles
class IndexView(ListView):
    model = GroupMember
    template_name = 'index.html'
    context_object_name = 'groupmembers'

#index: should display the organizer(s)
class UpdateView(View):
    def get(self, request):
        groups = Group.objects.all()
        users = User.objects.all()
        members = GroupMember.objects.all()
        return render(request, 'update.html', {'groups': groups, 'users': users, 'members':members})

    def post(self, request):
        groups = Group.objects.all()
        return render(request, 'update.html', {'groups': groups})

#CREATE
class NewGroup(View):
    def get(self, request):
        users = User.objects.all()
        return render(request, 'newgroup.html', {'users': users})
    def post(self, request):
        new_group = Group.objects.create(title=request.POST['title'])
        user = User.objects.get(id=request.POST['Leader'])
        print(user)
        print(new_group)
        leader = GroupMember.objects.create(member=user, group=new_group, role='Organizer')
        new_group.save()
        return redirect('update')

#UPDATE
class UpdateGroup(View):
    def post(self, request, id):
        group = Group.objects.get(id = id)
        if request.POST['type'] == 'add':
            member = request.POST['member']
            group.member.add(request.POST['member'])
            group.save()
        if request.POST['type'] == 'remove':
            member = request.POST['member']
            group.member.remove(request.POST['member'])
        return redirect('update')

#DELETE
class DeleteGroup(View):
    def get(self, request, id):
        group = Group.objects.get(id = id)
        group.delete()
        return redirect('update')

