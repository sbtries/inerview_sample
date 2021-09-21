from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.shortcuts import render
from django.views.generic.base import View
from .forms import CustomUserCreationForm
from groups.models import Group, User, GroupMember
import csv
import io

class SignUpView(CreateView):
    form_class = CustomUserCreationForm
    success_url = reverse_lazy('login')
    template_name = 'registration/signup.html'

#view for admin only: displays csv input if authenticated, others: links to login/register. 
class AdminView(View):
    template_name = 'admin.html'

    def get(self, request, *args, **kwargs):
        return render(request, 'admin.html')

    def post(self, request, *args, **kwargs):
        line_count = 0
        file = request.FILES['file']
        data_set = file.read().decode('UTF-8')
        io_string = io.StringIO(data_set)
        valid = True
        for row in csv.reader(io_string, delimiter=',', quotechar="|"):
            if line_count == 0:
                line_count += 1
            else:
                # check if group exists
                if Group.objects.filter(title = row[2]).exists():
                    pass
                else:
                # create new group 
                    newGroup = Group(title = row[2])
                    newGroup.save()

                # exception checking for missing fields:
                try: 
                    firstName = row[0]
                except IndexError:
                    valid = False
                try: 
                    lastName = row[1]
                except IndexError:
                    valid = False
                try:
                    group = row[2]
                except IndexError:
                    valid = False
                try: 
                    role = row[3]
                except IndexError:
                    role = 'Participant'
                    
                #create/save data:
                if valid == True:
                    if not User.objects.filter(firstName=firstName, lastName=lastName).exists():
                        new_user = User.objects.create(firstName = firstName, lastName = lastName)
                    else: 
                        new_user= User.objects.filter(firstName=firstName, lastName=lastName).first()
                    user_group_id = Group.objects.get(title=group).id
                    user_group = Group.objects.get(title=group)
                    new_user.save()

                    #check if member already exists & update role
                    if GroupMember.objects.filter(member = new_user.id, group = user_group_id).exists():
                        member = GroupMember.objects.filter(member = new_user.id, group = user_group_id)
                        member.role = role
                    else: 
                        GroupMember.objects.create(member = new_user, group = user_group, role=role) 

                else: 
                    message = 'please submit a CSV with first names, last names, and groups'
                    return render(request, 'admin.html', {'message': message})
        return render(request, 'admin.html', {'message': 'thanks for submitting your file!'})
