'''
Created on 2013-6-26

@author: zhangyang
'''

import common
from django.db import models


class Trend(common.models.BaseModel):
    class Meta:
        db_table = 'ms_trends'
        ordering = ['-create_at']
    
    path = models.URLField( null = True )
    target = models.URLField( null = True )