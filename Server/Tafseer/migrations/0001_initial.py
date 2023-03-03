# Generated by Django 4.1.7 on 2023-03-02 06:57

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Tafseer',
            fields=[
                ('serial_no', models.AutoField(primary_key=True, serialize=False, verbose_name='Serial Nomber')),
                ('id', models.PositiveSmallIntegerField(verbose_name='ID')),
                ('title', models.CharField(max_length=50, verbose_name='Tilte')),
                ('info', models.CharField(max_length=50, verbose_name='Information')),
                ('type', models.CharField(choices=[('1', ''), ('2', ''), ('3', ''), ('4', '')], max_length=1, verbose_name='Type')),
                ('is_download', models.BooleanField(verbose_name='Is Download')),
            ],
            options={
                'verbose_name': 'Tafseer',
                'verbose_name_plural': 'Tafaseer',
            },
        ),
    ]
