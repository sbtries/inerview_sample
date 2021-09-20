# Rails Meetups: 
* rails s
* create user & login: http://localhost:3000/home/admin 
* import csv at root, http://localhost:3000/
* groups index at http://localhost:3000/groups
* groups show at http://localhost:3000/groups/:id


# Django Meetups:

## Run project:
* (create shell or env of your choice)
* ``` pip install Django==3.2.7 ``` 
* ``` python manage.py makemigrations ```
* ``` python manage.py migrate ```
* ``` python manage.py runserver ```

## use project:
* default views are for unauthenticated user (no CRUD functionality)
* admin page & csv upload at http://localhost:8000/accounts/admin/ (or click link in footer)
* register & login to access file upload & CRUD functionality
    * use meetup.csv as sample data
    * show: http://localhost:8000/
    * index: http://localhost:8000/group_info
