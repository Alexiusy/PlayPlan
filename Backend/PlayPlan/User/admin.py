from django.contrib import admin
from .models import User

# Register your models here.

# @admin.register(Users)
class UserAdmin(admin.ModelAdmin):
	fields = ('nickname', 'gender', 'phone_number', 'email', 'birth', 'location', 'avatar', 'school', 'company', 'relationship_status', 'introduction', 'label')

admin.site.register(User, UserAdmin)
