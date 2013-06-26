'''
Created on 2013-6-26

@author: zhangyang
'''

from common.models import BaseModel
from django.db import models


class Trend(BaseModel):
    class Meta:
        db_table = 'ms_trends'
        ordering = ['-create_at']
    
    path = models.URLField( null = True )  # img url
    target = models.URLField( null = True ) # link to certain page
    content = models.TextField( null = True, default = None ) # content