from rest_framework.serializers import HyperlinkedModelSerializer 

from .models import Aya
from Sora.Serializer import SoraSerializer

# Serializers define the API representation.



class AyaSerializer(HyperlinkedModelSerializer):
    soraid = SoraSerializer(many= True)
    class Meta:
        model = Aya
        fields = [
            "url",
            "id",
            "soraid",
            "ayaid",
            "page",
            "quarter",
            "hezb",
            "joza",
            "sajda",
            "text",
            "uthmanitext",
            "searchtext",
            "quarterstart",
            "slug",
        ]
