from django.contrib.auth.models import User
import json
import types
import sae



def get_or_create_usr(email, usrname):
    back = User.objects.get_or_create( email=email
                                          , username = usrname
                                          , defaults = {'password':'123456'} )
    return back[0]

def sae_save_file( f , storage_name , file_name = None ):
    from sae.storage import Bucket
    bucket = Bucket(storage_name)
    print bucket
    if file_name is None: 
        file_name = f._get_name()
    return bucket.put_object(file_name, f)