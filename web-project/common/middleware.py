'''
Created on 2013-6-23

@author: ray
'''
from django.template.response import TemplateResponse
from django.http import HttpResponse
from django.template import loader
from django.template.context import RequestContext
class CommonMiddleware(object):
#     def process_template_response(self, request, response):
#         return TemplateResponse(request, template = "temp/comming.html")
    
    def process_response(self, request, response):
        c = RequestContext(request, {})
        t = loader.get_template("temp/comming.html")
        return HttpResponse(t.render(c))