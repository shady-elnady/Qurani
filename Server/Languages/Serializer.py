from rest_framework.serializers import HyperlinkedModelSerializer 

from .models import Language, AyaLanguage
from Aya.Serializer import AyaSerializer
# Serializers define the API representation.


class LanguageSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Language
        fields = [
            "url",
            "id",
            "name",
            "native",
            "symbol",
            "rtl",
            "emoji",
            "slug",
        ]


class AyaLanguageSerializer(HyperlinkedModelSerializer):
    aya = AyaSerializer(many= False)
    class Meta:
        model = AyaLanguage
        fields = [
            "url",
            "language",
            "aya",
            "text",
            "slug",
        ]
