# Generated by Django 4.1.7 on 2023-03-02 06:57

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Qaria',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, unique=True, verbose_name='Name')),
                ('native', models.CharField(max_length=50, unique=True, verbose_name='Native')),
            ],
            options={
                'verbose_name': 'Qaria',
                'verbose_name_plural': 'Quraa',
            },
        ),
    ]
