-- 안전모드 제거
SET SQL_SAFE_UPDATES = 0;

-- 조회 select
select * from world.city;
select * from world.city where Population > 10000000;

-- 생성 insert
insert into world.city values(null, 'abc','kor','seoul',50000000);
-- 업데이트 u
update world.city set name = 'cba' where id = 4080;
-- *  는 모든 컬럼을 출력한다
select * from world.city where id = 4080;
-- 삭제
delete from world.city where id = 4080;
select * from world.city where id = 4080;

-- 데이터베이스(스키마) 생성
create database if not exists student_db;
-- 실행될 데이터베이스 선택
use student_db;

-- db삭제
drop database student_db;

-- 학생테이블 생성
create table if not exists student_db.students(
    id int auto_increment primary key,
    name varchar(100) not null,
    age int not null,
    scores json
);

commit;
select * from students;

-- 조회
select
id,
name,
age
	from students
where name= '장보고' and age = 40
;


