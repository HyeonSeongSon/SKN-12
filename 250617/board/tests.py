from django.test import TestCase
from . import models
class Make100(TestCase):
    def test_make_100(self):
        for i in range(100):
            models.Question( 
                subject=f'질문 {i}',
                content=f'질문 내용 : {i}').save()
            # 데이터 베이스에 저장된 Question 객체의 개수 확인