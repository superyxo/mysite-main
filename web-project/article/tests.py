from django.test import TestCase
import article


class SimpleTest(TestCase):
    def test_change_content(self):
        content = '##abc.jpg##<p>blabla</p>'
        names = ['abc.jpg','abcbbc.jpg']
        print article.models.Article.changeContent(content, names)