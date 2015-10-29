from rest_framework import serializers
from User.models import User

class UserSerializer(serializers.ModelSerializer):
	class Meta:
		model = User
		fields = ('nickname', 'gender', 'phone_number', 'email', 'birth', 'location', 'avatar', 'school', 'company', 'relationship_status', 'introduction', 'label')
