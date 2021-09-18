from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.shortcuts import render
from django.views.generic.base import View
from .forms import CustomUserCreationForm
from groups.models import Group, User, GroupMember
import csv

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
        file = request.POST['file']

        with open(file) as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            line_count = 0
            valid = True
            # data should be formatted: firstName, lastName, group, role
            # I'll allow for role to be empty, but other fields must be populated
            for row in csv_reader:
                # check for headers
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
                        new_user = User.objects.create(firstName = firstName, lastName = lastName)
                        
                        user_group_id = Group.objects.get(title=group).id
                        user_group = Group.objects.get(title=group)

                        new_user.save()

                        new_group_member = GroupMember.objects.create(group=user_group, member=new_user, role=role)
                    else: 
                        message = 'please submit a CSV with first names, last names, and groups'
                        return render(request, 'admin.html', {'message': message})
        return render(request, 'admin.html', {'message': 'thanks for submitting your file!'})
