from rest_framework import serializers
from Users.models import Users

class UserSerializer(serializers.ModelSerializer):
	class Meta:
		models = User
		fields = ('name', 'serializer', 'birth')