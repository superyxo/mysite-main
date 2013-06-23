'''
Created on 2013-6-23

@author: ray
'''

from article.models import Article, Comment, Tag
from django.core.context_processors import csrf
from django.http import HttpResponse
from django.shortcuts import redirect, render
from django.core import serializers
from django.contrib.auth.decorators import login_required
from common.request import Pageable
from django.views.decorators.http import require_POST, require_GET
import util
from django.template.response import SimpleTemplateResponse as resp

## === Article ===
@require_GET
def showArticleList( request ):
    page = Pageable(request)
    articles = Article.objects.query(page, request)
    map(lambda a:a.setCommentNum(a.comment_set.count()), articles)
    tags = Tag.objects.raw('SELECT at.tag_id AS id, t.name AS name, COUNT(at.tag_id) AS articleNum FROM ms_articles_tags AS at, ms_tags AS t WHERE at.tag_id = t.id GROUP BY at.tag_id')
    return resp('article-list.html', locals())

@require_GET
def showArticle( request, aid ):
    article = Article.objects.get(id=aid)
    comments = article.comment_set.all()
    tags = article.tags.all()
    map(lambda t:t.setArticleNum(t.article_set.count()), tags)
    return render( request, "article.html" ,locals() )

@login_required
@require_POST
def saveArticle( request ):
    imgs = None
    if request.FILES.has_key('imgs'):
        imgs = request.FILES.getlist('imgs')
    article = Article.saveArticle(request.POST.get('id', None)
                              , request.POST['title']
                              , request.POST['desc']
                              , request.POST['tags']
                              , request.POST['content']
                              , imgs )
    return redirect('/article/' + str( article.id ))

@login_required
@require_GET
def removeArticle( request ):
    Article.objects.filter(**request.GET.dict()).delete()
    return redirect('/article/list')

@login_required
@require_GET
def editArticle( request ):
    try:
        article = Article.objects.get(id = request.GET['id'])
    except:
        article = None
    locals().update(csrf(request))
    return resp('editor.html', locals())


## === Comment ===
@require_POST
def saveComment( request ):
    u = util.get_or_create_usr(request.POST['email'], request.POST['usrname'])
    a = Article.objects.get(id = request.POST['articleId'])
    comment = Comment(content = request.POST['content'], user = u, article = a)
    comment.save()
    return redirect('/article/'+str(a.id)+'/#comment-'+str(comment.id))

@require_GET
def deleteComment( request ):
    comment = Comment.objects.get(id=request.GET['id'])
    articleId = comment.article.id
    comment.delete()
    return redirect('/article/'+articleId)


##=== Tag ===
@require_GET
def queryTags( request ):
    back = Tag.objects.query( request = request )
    return HttpResponse( serializers.serialize('json', back) )