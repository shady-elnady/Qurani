# Generated by Django 4.1.7 on 2023-03-02 06:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Qaria', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Audio',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(choices=[('0', ''), ('1', '')], max_length=50, verbose_name='Audio Type')),
                ('audio_url', models.CharField(max_length=100, unique=True, verbose_name='Audio URL')),
                ('qaria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Audios', to='Qaria.qaria', verbose_name='Qaria')),
            ],
            options={
                'verbose_name': 'Audio',
                'verbose_name_plural': 'Audios',
            },
        ),
    ]
