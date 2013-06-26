'''
Created on 2013-6-26

@author: zhangyang
'''

from django.db import models
from common.models import BaseModel

# Create your models here.
class Image(BaseModel):
    class Meta:
        db_table = 'ms_images'
        ordering = ['-create_at']
        
    path = models.URLField(null = False)