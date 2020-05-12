#delete method
from django.db.models import Model

from Test_App.models import Chance


def delete():
    instance = Chance()
    object = instance.objects.first()
    object.delete()

delete()


