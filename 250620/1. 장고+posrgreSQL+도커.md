# 1. 프로젝트 구조 설계
```
DOCKER
|- Dockerfile
|- docker-compose.yml
|- requirements.txt
|- 장고 프로젝트 폴더
```
# 2. Django 프로젝트 생성
```
docker-compose run web django-admin startproject config .
```
# 3. Django 데이터베이스 설정 변경
```
import os
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('DJANGO_DB_NAME', 'mydb'),
        'USER': os.environ.get('DJANGO_DB_USER', 'myuser'),
        'PASSWORD': os.environ.get('DJANGO_DB_PASSWORD', 'mypassword'),
        'HOST': os.environ.get('DJANGO_DB_HOST', 'db'),
        'PORT': os.environ.get('DJANGO_DB_PORT', '5432'),
    }
}
```
# 4. 마이그레이션 및 서버 실행
```
docker compose up --build

# 다른터미널에서 마이그래션을 적용
docker-compose run web python manage.py migrate
```

# 5 앱 생성 및 모델 작성
```
docker-compose run web python manage.py startapp items

class Item(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self) -> str:
        return self.name
```
# 6. 마이그레이션 및 superuser 생성
```
docker-compose run web python manage.py makemigrations
docker-compose run web python manage.py migrate
docker-compose run web python manage.py createsuperuser
```
# 7. CRUD views, urls, templates 작성
```
items/views.py   클래스뷰
config/urls.py  item의 urls을 참고하도록 include
items/urls.py   라우팅 정보
config/settings.py 'items' 앱 추가,  TEMPLATES 폴더 설정
config/templages/items/ 폴더에 HTML파일 작성
```
# 8. 마이그레이션 및 서버 실행
```
docker-compose run web python manage.py makemigrations
docker-compose run web python manage.py migrate
docker-compose up
```