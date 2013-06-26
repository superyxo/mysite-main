#coding=utf-8
'''
Created on 2013-6-26

@author: zhangyang
'''

from django.contrib.admin.models import User
from common.models import BaseModel
from django.db import models
import util
import re
from mysite.settings import STO_MEDIA
from django.dispatch.dispatcher import receiver
from django.db.models.signals import post_save
from django.template.base import Template
from django.template.context import Context
from image.models import Image

class Tag( BaseModel ):
    class Meta:
        db_table = 'ms_tags'
    
    articleNum = 0
    
    def setArticleNum(self, num):
        self.articleNum = num
        
    def __unicode__(self):
        return self.name
   
class Article( BaseModel ):
    class Meta:
        db_table = 'ms_articles'
        ordering = ['-create_at']
    
    user = models.ForeignKey( User, null=True )    
    content = models.TextField( null = False )
    tags = models.ManyToManyField( Tag )
    imgs = models.ManyToManyField( Image )
    
    comment_num = 0
    temp_tags = [] # for signal
    temp_imgs = [] # for signal
    
    def setCommentNum(self, num):
        self.comment_num = num
    
    def simpleContent(self):
        pattern = re.compile('<\/{0,}(div|br|pre|p|img)\s*((\S*=)".*"){0,}\s*\/{0,}>')
        return pattern.sub('', self.content)[0:200]
    
    @classmethod
    def saveArticle(cls, articleId, title, summary, tags, content, imgs = None):
        stags = tags.strip().lstrip().rstrip().split(',')
        tags =  [Tag.objects.get_or_create(name = tag)[0] for tag in stags]
        
        kwarg = {'name':title, 'desc':summary, 'content': content}
        if articleId:
            article = cls.objects.get(id = articleId)
            article.name = title
            article.tags = tags
            article.desc = summary
            article.content = content
        else:
            article = cls(**kwarg)
        
        if imgs is not None:
            for img in imgs:
                names = article.saveFile(img, None)
                article.content = article.changeContent(article.content.strip().lstrip().rstrip(), names)
        
        if articleId: ## update article
            pass
        else: ## create article
            article.temp_tags = tags
            article.save()
            article.tags = article.temp_tags
        
        article.imgs.add(*article.temp_imgs)
        article.save()
        
        return article
    
    def saveFile(self, img, newname):
        if newname is None:
            newname = img._get_name()
        util.sae_save_file(img, 'media', newname)
        self.temp_imgs.append( Image.objects.create(path = newname) )
        return [img._get_name(), newname]
    
    def changeContent(self, content, names):
        find = '##' + names[0] + '##'
        path = STO_MEDIA + '' + names[1]
        will = '<img src="' + path + '" />'
        return content.replace(find, will)
        
        
class Comment( BaseModel ):
    class Meta:
        db_table = 'ms_comments'
    
    content = models.TextField( null=False )
    user = models.ForeignKey( User, null=True )
    article = models.ForeignKey( Article, null=True )
    komment = models.ForeignKey( 'self', null=True, related_name = 'comment_id' )
    root_komment = models.ForeignKey( 'self', null=True, related_name = 'root_comment_id' )
    
    def getComments(self):
        return Comment.objects.filter(root_komment_id = self.id)

#========== Signal Definition ==========
from trend.models import Trend

@receiver(post_save, sender = Article)
def post_save_article(sender, **kwargs):
    if kwargs['created']:
        aTplStringMap = util.get_config_map('trend_tpl.ini', 'article')
        article = kwargs['instance']
        tags = article.temp_tags
        imgs = article.temp_imgs
        
        desc = None
        if len(tags): 
            desc = Template(aTplStringMap['desc']).render(Context({'tags' : tags}))
        
        path = None
        if len(imgs):
            path = imgs[0].path
        
        Trend.objects.create(name = 'article created'
                             , content = Template(aTplStringMap['content']).render(Context({'article':article}))
                             , desc = desc
                             , path = path)

@receiver(post_save, sender = Comment)
def post_save_comment(sender, **kwargs):
    comment = kwargs['instance']
    if kwargs['created'] and comment.article:
        tplStringMap = util.get_config_map('trend_tpl.ini', 'comment')
        content = Template(tplStringMap['content']).render(Context({'feed' : comment}))
        desc = Template(tplStringMap['desc']).render(Context({'feed' : comment}))
        Trend.objects.create(name = 'feed created', content = content, desc = desc)      