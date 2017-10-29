from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User
from django.core import management


class Command(BaseCommand):
    def handle(self, *args, **options):
        if User.objects.filter(is_superuser=True).count() != 0:
            return

        management.call_command('createsuperuser')
