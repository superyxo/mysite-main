from django.contrib.auth.models import User
import json
import types

def get_or_create_usr(email, usrname):
    back = User.objects.get_or_create( email=email
                                          , username = usrname
                                          , defaults = {'password':'123456'} )
    return back[0]

MEDIA_SAE_ROOT = 'http://rayzy1991-media.stor.sinaapp.com'
DEMO_SAE_ROOT = 'http://rayzy1991-demo.stor.sinaapp.com'