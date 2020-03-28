from django.contrib import admin
from .models import *


# Register your models here.

class OuserAdmin(Ouser):
    list_display = ('link', )
