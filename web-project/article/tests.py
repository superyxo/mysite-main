from django.test import TestCase
import article


class SimpleTest(TestCase):
    def change_content(self):
        content = '##abc.jpg##<p>blabla</p>'
        names = ['abc.jpg','abcbbc.jpg']
        print article.models.Article.changeContent(content, names)
        
    def test_string_empty(self):
        if '':
            print 'empty string is not false'
        else:
            print 'empty string is false'