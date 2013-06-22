from django.contrib.admin.models import User
from common.models import BaseModel
from django.db import models
       
class Tag( BaseModel ):
    class Meta:
        db_table = 'tags'

    bgcolor = models.CharField( max_length = 6, null = True )
    
    articleNum = 0;
    def setArticleNum(self, num):
        self.articleNum = num
        
    def __unicode__(self):
        return self.name
   
class Article( BaseModel ):
    class Meta:
        db_table = 'articles'
        ordering = ['-createAt']
    
    user = models.ForeignKey( User, null=True )    
    content = models.TextField( null=False )
    tags = models.ManyToManyField( Tag )
    
    commentNum = 0
    def setCommentNum(self, num):
        self.commentNum = num

class Comment( BaseModel ):
    class Meta:
        db_table = 'comments'
    
    content = models.TextField( null=False )
    user = models.ForeignKey( User, null=True )
    article = models.ForeignKey( Article, null=True )
    komment = models.OneToOneField( 'self', null=True )