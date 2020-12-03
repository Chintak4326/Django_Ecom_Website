from django import forms
from AdminPanel.models import *

class companyForm(forms.ModelForm):
	class Meta:
		model=company1
		fields="__all__"

class stateForm(forms.ModelForm):
	class Meta:
		model=state1
		fields="__all__"

class cityForm(forms.ModelForm):
	class Meta:
		model=city1
		fields="__all__"

class areaForm(forms.ModelForm):
	class Meta:
		model=area1
		fields="__all__"

class employeeForm(forms.ModelForm):
	class Meta:
		model=employee1
		fields="__all__"

class categoryForm(forms.ModelForm):
	class Meta:
		model=categories1
		fields="__all__"

class productForm(forms.ModelForm):
	class Meta:
		model=product1
		fields="__all__"

class productAttributeForm(forms.ModelForm):
	class Meta:
		model=productAttributes1
		fields="__all__"

class productImageForm(forms.ModelForm):
	class Meta:
		model=productImage1
		fields="__all__"

class develieryAddressForm(forms.ModelForm):
	class Meta:
		model=develiery_address_customer1
		fields="__all__"

class cartForm(forms.ModelForm):
	class Meta:
		model=cart1
		fields="__all__"