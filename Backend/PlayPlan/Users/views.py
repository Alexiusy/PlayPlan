from Users.models import Users
from Users.serializers import UsersSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework import generics


# Create your views here.
class UserList(generics.ListCreateAPIView):
	queryset = Users.objects.all()
	serializer_class = UsersSerializer
	renderer_classes = (TemplateHTMLRenderer,)

	def get(self, request, *args, **kwargs):
		self.object = self.get_object()
		return Response({'user': self.object}, template_name='user_list,html')

class UserDetail(generics.RetrieveUpdateDestroyAPIView):
	queryset = Users.objects.all()
	serializer_class = UsersSerializer
