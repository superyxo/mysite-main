from django.db import models
from common.mgr import BaseMgr

class BaseModel(models.Model):
    id = models.AutoField( primary_key = True )
    name = models.CharField( max_length = 32 , null = True )
    desc = models.CharField( max_length = 256 , null = True )
    create_at = models.DateTimeField( auto_now_add = True , auto_now = False )
    last_at = models.DateTimeField( auto_now = True )
    enabled = models.BooleanField( default = True )
    
    class Meta:
        abstract = True
        
    objects = BaseMgr()