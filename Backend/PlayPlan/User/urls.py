from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from User import views

urlpatterns = [
    url(r'^api/users/$', views.UserListAPI.as_view()),
    url(r'^api/user/(?P<pk>[0-9]+)/$', views.UserDetailAPI.as_view()),

    url(r'^users/$', views.UserList.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)