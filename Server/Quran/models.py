from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

# Create your mofrom django.utils.text import slugify

class Quran(models.Model):

    class Meta:
        verbose_name= _("Quran")
        verbose_name_plural= _("Quran")



class BaseModel(models.Model):
    created_date= models.DateTimeField(
        auto_now_add=True,
        editable=False,
        verbose_name=_("Created Date"),
    )
    last_updated= models.DateTimeField(
        auto_now=True,
        editable=False,
        blank=True,
        null=True,
        verbose_name=_("Last Update"),
    )

    class Meta:
        abstract= True


class BaseModelName(models.Model):
    name= models.CharField(
        max_length= 100,
        primary_key= True,
        verbose_name= _("Name"),
    )

    @property
    def slug(self) -> str:
        return slugify(f"{self.name}")

    def __str__(self) -> str:
        return f"{self.name}"

    def __decode__(self) -> str:
        return f"{self.name}"
    
    # def get_absolute_url(self):
    #     return reverse("Vegetable:vegetable_detail", args=[self.slug])

    class Meta:
        abstract= True


class BaseModelNative(BaseModelName):
    native= models.CharField(
        max_length=20,
        unique=True,
        null=True,
        blank=True,
        verbose_name=_("Native"),
    )

    class Meta:
        abstract= True


