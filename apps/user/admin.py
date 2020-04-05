from django.contrib import admin
from .models import Ouser


# Register your models here.

class OuserAdmin(Ouser):
    list_display = ('link', 'username', 'date_joined')


admin.site.register(Ouser)
