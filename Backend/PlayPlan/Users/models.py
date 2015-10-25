# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models


class Users(models.Model):
    realname = models.CharField(max_length=30, blank=True, null=True)
    nickname = models.CharField(max_length=30)
    identity = models.CharField(max_length=18, blank=True, null=True)
    phone_number = models.CharField(max_length=11, blank=True, null=True)
    email = models.CharField(max_length=40)
    location = models.CharField(max_length=50, blank=True, null=True)
    gender = models.CharField(max_length=6, blank=True, null=True)
    birth = models.DateField(blank=True, null=True)
    created = models.DateTimeField()
    avatar = models.CharField(max_length=100, blank=True, null=True)
    school = models.CharField(max_length=50, blank=True, null=True)
    company = models.CharField(max_length=50, blank=True, null=True)
    relationship_status = models.CharField(max_length=9, blank=True, null=True)
    introduction = models.CharField(max_length=100, blank=True, null=True)
    label = models.CharField(max_length=50, blank=True, null=True)
    user_id = models.CharField(primary_key=True, max_length=100)
    password = models.CharField(max_length=40)

    class Meta:
        managed = False
        db_table = 'Users'
