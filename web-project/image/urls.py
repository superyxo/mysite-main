'''
Created on 2013-6-26

@author: zhangyang
'''

from django.conf.urls import patterns, url

urlpatterns = patterns('',
    url(r'^save/$', 'image.views.saveImg'),
)