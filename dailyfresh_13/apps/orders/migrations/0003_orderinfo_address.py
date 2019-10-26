# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
        ('orders', '0002_auto_20171018_1711'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderinfo',
            name='address',
            field=models.ForeignKey(default='', to='users.Address', verbose_name='收获地址'),
            preserve_default=False,
        ),
    ]
