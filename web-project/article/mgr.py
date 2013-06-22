'''
Created on 2013-6-22

@author: ray
'''
from common.mgr import BaseMgr

class ArticleMgr(BaseMgr):
    
    def saveArticle(self, tags, content, summary, title, article):
        if article.id is None:
            pass
        else:
            pass