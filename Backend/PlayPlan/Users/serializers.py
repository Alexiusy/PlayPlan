from rest_framework import serializers
from Users.models import User

class UserSerializer(serializers.ModelSerializer):
	class Meta:
		models = User
		fields = ('realname', 'nickname', 'gender', 'birth', 'location')
