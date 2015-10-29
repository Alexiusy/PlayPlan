from django import forms

class UserForm(forms.Form):
	docfile = forms.FileField(
        label='Select a file',
        help_text='max. 42 megabytes'
    )