from django.test import TestCase
import article
import re

class SimpleTest(TestCase):
    def change_content(self):
        content = '##abc.jpg##<p>blabla</p>'
        names = ['abc.jpg','abcbbc.jpg']
        print article.models.Article.changeContent(content, names)
        
    def string_empty(self):
        if '':
            print 'empty string is not false'
        else:
            print 'empty string is false'
            
    def test_re(self):
        back = '<div>hello</div><p>world</p><pre class="prettyjs linenum dsads">all</pre>'
        pattern = re.compile('<\/{0,}(div|pre|p|img)\s*((\S*=)".*"){0,}\/{0,}>')
#         match = pattern.match(back)
#         print match.group()
#         exp = re.compile('hello')
        print pattern.sub('', back)