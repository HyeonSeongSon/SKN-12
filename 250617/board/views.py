from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from .models import Question, Answer
from django.core.paginator import Paginator

def index(request):
    page = request.GET.get('page',1) 
    questions = Question.objects.order_by('-create_at')
    paginator = Paginator(questions, 10) # paginator 객체 생성
    paginated_questions = paginator.get_page(page)

    return render(request, 'board/index.html', {'questions': paginated_questions})

def detail(request, question_id):
    question = get_object_or_404(Question, id=question_id)
    return render(request, 'board/detail.html', {'question': question})

def create_answer(request, question_id):
    question = get_object_or_404(Question, id=question_id)
    Answer(question=question, content=request.POST.get('content')).save() # POST 요청에서 content 필드의 값
    return redirect('board:question_detail', question_id=question.id)

def create_question(request):
    if request.method == 'POST':
        subject = request.POST.get('subject')
        content = request.POST.get('content')
        Question(subject=subject, content=content).save()  # 질문 생성
        return redirect('board:index')
    return render(request, 'board/create_question.html')  # 질문 생성 폼을 렌더링