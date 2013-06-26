'''
Created on 2013-6-23

@author: ray
'''

from django.conf.urls import patterns, url, include
from django.views.generic.simple import direct_to_template as direct
from mysite import settings

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT, 'show_indexes':True}),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT, 'show_indexes':True}),
    
#    url(r'^$', direct, {'template':'home.html'}),
    url(r'^$', 'trend.views.home'),
    
    url(r'^about/$', direct, {'template':'about.html'}),
#     url(r'^contact/$', direct, {'template':'contact.html'}),
#     url(r'^accounts/login/$', 'django.contrib.auth.views.login', {'template_name': 'login.html'}),
#     url(r'^design/$', direct, {'template':'imgs.html'}),
    
    url(r'^article/', include('article.urls')),
#     url(r'^img/', include('image.urls')),
    
    url(r'^editor/', 'article.views.editArticle'),
    ##url(r'^upload/', direct, {'template':'upload.html'}),
    
    url(r'^tag/query', 'article.views.queryTags'),
    
    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
        
