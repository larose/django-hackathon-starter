from django.conf.urls import url
from . import views
from lazysignup.decorators import allow_lazy_user
from lazysignup.views import convert

urlpatterns = [
    url(r'^$', allow_lazy_user(views.HomeView.as_view()), name='home'),
    url(r'^convert$',
        convert, {'template_name': 'convert.html'},
        name='lazysignup_convert'),
]
