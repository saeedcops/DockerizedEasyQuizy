# Generated by Django 3.1.5 on 2021-03-11 16:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0010_auto_20210311_1629'),
    ]

    operations = [
        migrations.AlterField(
            model_name='question',
            name='question',
            field=models.CharField(max_length=455, unique=True),
        ),
    ]