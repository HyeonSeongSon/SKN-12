from django.db import models

# Create your models here.
class Question(models.Model):
    subject = models.CharField(max_length=200) # 질문 제목
    content = models.TextField() # 질문내용
    create_at = models.DateTimeField(auto_now_add=True) # 생성시간
    update_at = models.DateTimeField(auto_now=True) # 수정시간

    def __str__(self):
        return self.subject # 객체를 문자열로 표현할 때 제목을 반환
    
class Answer(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE) # 질문과의 관계설정 
    content = models.TextField() # 답변내용
    create_at = models.DateTimeField(auto_now_add=True) # 생성시간
    update_at = models.DateTimeField(auto_now=True) # 수정시간

    def __str__(self):
        return f"Answer to {self.question.subject}"