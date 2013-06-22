from django.conf.urls import patterns, url

urlpatterns = patterns('',
    url(r'^save/$', 'image.views.saveImg'),
)