from rest_framework.viewsets import ModelViewSet
# from rest_framework.permissions import IsAuthenticated, IsAdminUser 
from django.db.models import Q

from .models import Aya
from .Serializer import AyaSerializer 


class AyaViewSet(ModelViewSet):
    queryset = Aya.objects.all()
    serializer_class = AyaSerializer
    # permission_classes = [IsAuthenticated, IsAdminUser]

    def get_queryset(self):
        return Aya.objects.all().filter(soraid =self.request.query_params.get('sora_id'))
