from rest_framework.serializers import HyperlinkedModelSerializer 
from rest_framework.reverse import reverse

from .models import Sora

# Serializers define the API representation.


class SoraSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Sora
        fields = "__all__"
