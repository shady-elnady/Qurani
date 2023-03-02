from rest_framework.viewsets import ModelViewSet
# from rest_framework.permissions import IsAuthenticated, IsAdminUser 

from .models import Language, AyaLanguage
from .Serializer import LanguageSerializer, AyaLanguageSerializer


class LanguageViewSet(ModelViewSet):
    queryset = Language.objects.all()
    serializer_class = LanguageSerializer
    # permission_classes = [IsAuthenticated, IsAdminUser]

    

class AyaLanguageViewSet(ModelViewSet):
    queryset = AyaLanguage.objects.all()
    serializer_class = AyaLanguageSerializer
    # permission_classes = [IsAuthenticated, IsAdminUser]
