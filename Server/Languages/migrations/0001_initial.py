# Generated by Django 4.1.7 on 2023-03-02 06:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Aya', '0001_initial'),
        ('Sora', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Language',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=15, unique=True, verbose_name='Name')),
                ('native', models.CharField(max_length=15, unique=True, verbose_name='Native')),
                ('symbol', models.CharField(max_length=15, unique=True, verbose_name='Symbol Code')),
                ('emoji', models.CharField(max_length=1, verbose_name='Emoji')),
                ('rtl', models.BooleanField(default=False, verbose_name='Right To Left')),
            ],
            options={
                'verbose_name': 'Language',
                'verbose_name_plural': 'Languages',
            },
        ),
        migrations.CreateModel(
            name='AyaLanguage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('text', models.TextField(verbose_name='Text')),
                ('aya', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='AyaLanguages', to='Aya.aya', verbose_name='Aya')),
                ('language', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Aya', to='Languages.language', verbose_name='Language')),
                ('sora', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='SoraLanguages', to='Sora.sora', verbose_name='Sora')),
            ],
            options={
                'verbose_name': 'Aya Language',
                'verbose_name_plural': 'Aya Languages',
                'unique_together': {('language', 'aya')},
            },
        ),
    ]
