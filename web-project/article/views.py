from article.models import Article, Comment, Tag
from django.core.context_processors import csrf
from django.http import HttpResponse
from django.shortcuts import redirect, render
from django.core import serializers
import json
from django.contrib.auth.decorators import login_required
from common.request import Pageable
from django.views.decorators.http import require_POST, require_GET
import util

## === Article ===
@require_GET
def showArticleList( request ):
    page = Pageable(request)
    articles = Article.objects.query(page, request)
    map(lambda a:a.setCommentNum(a.comment_set.count()), articles)
    tags = Tag.objects.raw('SELECT at.tag_id AS id, t.name AS name, COUNT(at.tag_id) AS articleNum FROM articles_tags AS at, tags AS t WHERE at.tag_id = t.id GROUP BY at.tag_id')
    return render( request, 'article-list.html' ,locals() )
@require_GET
def showArticle( request, aid ):
    article = Article.objects.get(id=aid)
    comments = article.comment_set.all()
    tags = article.tags.all()
    map(lambda t:t.setArticleNum(t.article_set.count()), tags)
    return render( request, "article.html" ,locals() )

def analysisArticle():
    pass
@login_required
@require_POST
def saveArticle( request ):
#     stags = request.POST['tags'].strip().lstrip().rstrip().split(',')
#     tagsJSON = json.loads( request.POST['tagJSON'] )
#     tags =  [Tag.objects.get_or_create(name = tag['name'])[0] for tag in stags]
#     article = Article.objects.save(request, rmlist = ['tagJSON'])
#     article.user = request.user
#     article.save()
#     print request
    print request.FILES
    print request.FILES.getlist('imgs')
    article = Article.createArticle( request.POST['title']
                              , request.POST['desc']
                              , request.POST['tags']
                              , request.POST['content']
                              , request.FILES.getlist('imgs') )
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
    return render( request, "editor.html" ,locals() )


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