from django.shortcuts import render
from .models import Post
from django.contrib.auth.decorators import login_required, user_passes_test


def is_in_group(user):
    return user.groups.filter(name='admin').exists()

@login_required
@user_passes_test(is_in_group)
def admin_view(request):
    # 관리자 전용 뷰 로직
    return render(request, 'myapp/admin.html')

@login_required
def user_view(request):
    # 일반 사용자 전용 뷰 로직
    return render(request, 'myapp/user.html')

# Create your views here.
def post_list(request):
    posts = Post.objects.all()
    return render(request, 'myapp/post_list.html', {'posts': posts})