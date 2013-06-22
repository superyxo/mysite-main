from django.db import models
from common.models import BaseModel

# Create your models here.
class Image(BaseModel):
    class Meta:
        db_table = 'images'
        ordering = ['-createAt']
    
    IMG_TYPE = (
                (u'IMG', u'image type'),
                (u'POST', u'article'),
                (u'DEMO', u'demo type'),
                (u'ICON', u'icon type')
    )
        
    path = models.URLField(null = False)
    target = models.URLField(null = True)
    type = models.CharField(max_length = 4, choices = IMG_TYPE)