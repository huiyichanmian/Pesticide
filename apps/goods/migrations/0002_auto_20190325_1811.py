# Generated by Django 2.0.6 on 2019-03-25 10:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='goodstype',
            table='goods_type',
        ),
        migrations.AlterModelTable(
            name='indextypegoodsbanner',
            table='index_type_goods',
        ),
    ]
