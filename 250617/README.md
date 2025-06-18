# 가상환경 생성
- git clone https://github.com/sknetworks20250226/django.git .
-  pip install django

- pyton manage.py migrate
- django-admin createsuperuser  --> id / psw 설정
- pyton manage.py runserver
- localhost:8000/admin  --> 테스트용 question 데이터 생성


# 마이그래이션

- 최초 migrate를 하게 되면 새로 추가되거나 기존 장고를  사용하기위한 데이터베이스의 기본 테이블 을 생성해준다 그리고 그 이후에 

- model이 새로 생성되거나 변경된경우 DB를 갱신해야 하는데.
- makemigration -> migrate 해서 반영을 한다
