from django.contrib import admin
from .models import Ouser


# Register your models here.
@admin.register(Ouser)
class OuserAdmin(admin.ModelAdmin):
    list_display = ('link', 'username', 'date_joined')

    list_display_links = ('username',)
