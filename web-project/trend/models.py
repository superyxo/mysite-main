import common
from django.db import models


class Trend(common.models.BaseModel):
    class Meta:
        db_table = 'ms_trends'
        ordering = ['-createAt']
    
    path = models.URLField( null = True )
    target = models.URLField( null = True )