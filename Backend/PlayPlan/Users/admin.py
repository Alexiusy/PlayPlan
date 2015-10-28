from django.contrib import admin
from Users.models import Users

# Register your models here.

# @admin.register(Users)
class UserAdmin(admin.ModelAdmin):
	fields = ('nickname', 'gender', 'phone_number', 'email', 'birth', 'location', 'avatar', 'school', 'company', 'relationship_status', 'introduction', 'label')

admin.site.register(Users, UserAdmin)
