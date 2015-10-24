from django.db import models

# Create your models here.
class User(models.Model):
    GENDER_CHOICES = (
        (u'M', u'Male'),
        (u'F', u'Female'),
    )
	realname = models.CharField(max_lengh=30)
    nickname = models.CharField(max_lengh=30)
    identity = models.CharField(max_lengh=18)
    gender = models.CharField(choices=GENDER_CHOICES)
	birth = models.DateField(auto_now_add=True)
    location = models.CharField(max_lengh=50)
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ('created',)
