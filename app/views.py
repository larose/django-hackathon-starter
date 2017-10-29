from django.shortcuts import render
from django.views.generic import TemplateView
from lazysignup.decorators import allow_lazy_user


# @allow_lazy_user
class HomeView(TemplateView):
    template_name = 'home.html'
