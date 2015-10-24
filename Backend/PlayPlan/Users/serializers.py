from models import Users

class Users(serializer.ModelSerializer):
	class Meta:
		models = Users
		fields = []