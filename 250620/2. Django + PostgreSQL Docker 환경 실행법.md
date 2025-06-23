# Django + PostgreSQL Docker 환경 실행법

## 1. 준비물
- Docker, Docker Compose 설치

## 2. 실행 방법

```sh
# 1. 저장소 클론 또는 압축 해제
git clone https://github.com/sknetworks20250226/docker.git .

# 2. 컨테이너 빌드 및 실행
docker-compose up --build

# DB가 완전히 뜬 후에 실행(2번실행)
docker-compose up --build
# 3. (최초 1회) 마이그레이션
docker-compose run web python manage.py migrate

# 4. (선택) 관리자 계정 생성
docker-compose run web python manage.py createsuperuser

# 5. 브라우저에서 접속
http://localhost:8000/items/
```
```

---