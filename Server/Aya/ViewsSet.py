from rest_framework.viewsets import ModelViewSet
# from rest_framework.permissions import IsAuthenticated, IsAdminUser 

from .models import Aya
from .Serializer import AyaSerializer 


class AyaViewSet(ModelViewSet):
    queryset = Aya.objects.all()
    serializer_class = AyaSerializer
    # permission_classes = [IsAuthenticated, IsAdminUser]
