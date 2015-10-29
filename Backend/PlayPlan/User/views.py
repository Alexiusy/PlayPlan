from User.models import User
from User.serializers import UserSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework import generics
from django.views.generic import ListView, TemplateView, View
from django.http import HttpResponse
from django.shortcuts import render_to_response


# Create your views here.
class UserListAPI(generics.ListCreateAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer

class UserDetailAPI(generics.RetrieveUpdateDestroyAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer


class UserList(View):

	def get(self, request, format = None):
		users = User.objects.all()
		return render_to_response('user_list.html', {'users': users})

	def post(self, request, format = None):
		pass