from Users.models import User
from Users.serializers import UserSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics


# Create your views here.
class UserList(generics.ListCreateAPIView):
	query_set = User.objects.all()
	serializer_class = UserSerializer

class UserDetail(generics.RetrieveUpdateDestroyAPIView):
	query_set = User.objects.all()
	serializer_class = UserSerializer
