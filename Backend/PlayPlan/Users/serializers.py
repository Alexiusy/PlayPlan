from rest_framework import serializers
from Users.models import Users

class UsersSerializer(serializers.ModelSerializer):
	class Meta:
		model = Users
		fields = ('nickname', 'gender', 'phone_number', 'email', 'birth', 'location', 'avatar', 'school', 'company', 'relationship_status', 'introduction', 'label')
