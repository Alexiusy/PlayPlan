from User.models import User
from User.serializers import UserSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework import generics


# Create your views here.
class UserList(generics.ListCreateAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer
	renderer_classes = (TemplateHTMLRenderer, JSONRenderer,)

	def get(self, request, *args, **kwargs):
		self.objects = User.objects.all()
		return Response({'users': self.objects}, template_name = 'user_list.html')

class UserDetail(generics.RetrieveUpdateDestroyAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer
	renderer_classes = (TemplateHTMLRenderer, JSONRenderer,)

	def get(self, request, *args, **kwargs):
		self.object = self.get_object()
		return Response({'user': self.object}, template_name = 'user_list.html')
