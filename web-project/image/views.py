# Create your views here.
from image.models import Image
from common.request import Pageable
from django.shortcuts import redirect, render
from django.views.decorators.http import require_GET, require_POST
from django.contrib.auth.decorators import login_required

@require_GET
def queryImgs(request):
    pagin = Pageable(request, 4, 1)
    imgs = fill_list( Image.objects.query(pagin, request), 9 )
    return render( request, 'home.html', locals() )
@require_POST
@login_required
def saveImg(request):
    img = request.FILES['img']
    url = sae_save_file(img , u'media')    
    Image.objects.save(request, {'path':url})
    return redirect('/')
@require_GET
@login_required
def removeImg(request):
    Image.objects.filter(**request.GET.dict()).delete()
    return redirect('/')



def sae_save_file( f , storage_name , file_name = None ):
    from sae import storage
    s = storage.Client()
    obj = storage.Object(f.read())
    return s.put(storage_name , f._get_name() , obj)

def save_file(f, path = ''):
    filename = f._get_name()
    fd = open('%s/%s' % ('D:\Storage', str(path) + str(filename)), 'wb')
    for chunk in f.chunks():
        fd.write(chunk)
    fd.close()
    
def fill_list( _list , count ):
    back = []
    length = len(_list)
    if length < count:
        for item in _list : back.append(item)
        for i in range( length , count ):
            back.insert(i, '')
    return back