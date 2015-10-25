from Users.models import Users
from Users.serializers import UsersSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics


# Create your views here.
class UserList(generics.ListCreateAPIView):
	queryset = Users.objects.all()
	serializer_class = UsersSerializer

class UserDetail(generics.RetrieveUpdateDestroyAPIView):
	queryset = Users.objects.all()
	serializer_class = UsersSerializer
