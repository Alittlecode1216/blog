# coding: utf-8
"""
__project_ = 'blog'
__file_name__ = 'celery'
__author__ = 'admin'
__time__ = '2020-04-13 11:21'
__product_name = PyCharm
"""
from __future__ import absolute_import, unicode_literals
import os
from celery import Celery

# 设置django环境
os.environ.setdefault('DJANGO_SETTINGS_MODULE', '"blog.settings"')
app = Celery('blog')
#  使用CELERY_ 作为前缀，在settings中写配置
app.config_from_object('django.conf:settings', namespace='CELERY')
# 发现任务文件每个app下的task.py
app.autodiscover_tasks()
