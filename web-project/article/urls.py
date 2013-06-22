from django.conf.urls import patterns, url

urlpatterns = patterns('',
    url(r'^save/$', 'article.views.saveArticle'),
    url(r'^list/$', 'article.views.showArticleList'),
    url(r'^([1-9]\d*)/$', 'article.views.showArticle'),
    url(r'^delete/$', 'article.views.removeArticle'),
    
    url(r'^comment/save/$','article.views.saveComment')
)