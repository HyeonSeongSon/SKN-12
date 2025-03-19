-- 안전모드 제거
SET SQL_SAFE_UPDATES = 0;

-- 데이터 베이스 삭제
drop database if exists student_db2;

-- 데이터 베이스 생성
create database if not exists student_db2;
-- 테이블 생성(학생)
-- pk(id), name, age, kor, eng, math
create table if not exists student_db2.students(
	id int auto_increment primary key,
    name varchar(100) not null,
    age int not null,
    kor int,
    eng int,
    math int
);

-- 데이터를 랜덤하게 생성
-- insert into student_db2.students(name,age,kor,eng,math)
select
	concat(
		ELT(floor(1+rand()*5), '김','이','박','양','김'),
        ELT(floor(1+rand()*5), 'students현수','주현','동현','현호','재성')
    ) as name,
    floor(20+rand()*10) as age,
    floor(60+rand()*41) as kor,
    floor(60+rand()*41) as eng,
    floor(60+rand()*4) as math
    ;



-- 테이블 생성확인을 위한 조회
select *from student_db2.students;

commit;

-- ELT(n, str1,str2,str3 ...) 
-- n: 1부터 시작하는 정수인덱스
-- str1, str2... 선택가능한 문자열 목록
-- 반환값 : n에 해당하는 위치의 문자열,
-- 용도 : 랜덤데이터 생성
select 1+rand()*5;   -- 여기서 rand 0~5사이의 임의 정수 반환 => +1이라 1과 5사이로 변경 




-- 파이썬을 이용해서 1000명의 임의의 데이터 생성
-- sql 기본쿼리
-- 조회 상위 10명:
select * from student_db2.students limit 10;

-- 나이순 정렬 오름차순
select * from student_db2.students order by age asc; 
select * from student_db2.students order by age;   

-- 나이순 정렬 내림차순
select * from student_db2.students order by age desc;

-- 국어 점수가 90점 이상 이고 오름차순으로 정렬   
select * from student_db2.students where kor >= 90 order by kor desc;

-- 이름에 '김'이 포함된
select * from student_db2.students where name like '김%';  -- 김%(김xx), %김(xx김), %김%(xx김xx)

-- 특징 나이대 22<= age <= 25
select * from student_db2.students where age between 22 and 24;

-- 데이터 수정
-- 나이가 25인 학생의 수학 점수를 95로 일괄 변경
select * from student_db2.students;
update student_db2.students
set math =90
	where age =25;
-- where id in select (id from students_db2.students where age=25;)
-- select * from student_db.students where id in (select id from sutdnet.students)
 
 -- 국어 점수가 80미만인 학생은 점수를 전부 80으로 조정
 update student_db2.students
 set kor =80
	where kor <80;

-- 데이터 삭제
-- 나이가 20인 학생은 삭제
delete from student_db2.students where age < 25;
select * from student_db2.students where age < 25;

-- 영어점수가 75미만 삭제
delete from student_db2.students where eng < 75;
select * from student_db2.students where eng < 75;

-- 집계함수
select 
	count(*) total_students 
		from student_db2.students; 

select
id as '아이디',
name as '이름'
from student_db2.students;

-- 과목별 평균 avg
select
	round(avg(kor), 2) avg_kor,
    round(avg(eng), 2) avg_eng,
    round(avg(math), 2) avg_math
		from student_db2.students;
        
-- group by
-- 나이별로
-- select list is not in GROUP BY clause and ....
-- 조회대상에 그룹바이 항목만 존재하거나 또 다른 컬럼은 집계함수로 표현
select 
	age, count(age) count_age
		from student_db2.students
		group by age;

-- 과목별 최대/최소 점수
select
	max(kor), max(eng), max(math)
		from student_db2.students;
        
-- 문자열 함수
-- upper, lower, length
select id, length(name), name from student_db2.students;
select length('한');
select round(length('한') / 3) name_len;

-- 이름중에서 성만 추출 substring(name,1,1)
select substr('동해물과',1,2) ;
select substr(name,1,1) last_name from student_db2.students;

-- 성별 별로 그룹바이
select *
from(   
	-- 서브 쿼리 시작
	select
		substr(name,1,1) last_name,
		count(substr(name,1,1)) last_name_count
	from student_db2.students 
    group by substr(name,1,1)
    -- 서브 쿼리 끝
) as T  -- 명칭을 줘야함 
order by T.last_name_count desc limit 3;

-- 연결 concat
select
concat('이름: ',name, ' 나이: ',age) info
from student_db2.students;

-- 수학 함수
-- 학생별 총정
select name, (kor+eng+math) as total_score
from student_db2.students
order by total_score desc;

-- 학생별 평균 점수를 소수 2자리에서 반올림하고 내림차순으로 정렬
select name, round((kor+eng+math)/3,2) as avg_score
from student_db2.students
order by avg_score desc;

-- 조건함수
select min(age) min_age,
max(age) max_age
from student_db2.students;

-- 21살 이하면 청소년 그렇지 않고 24이하면 청년 그외는 성인
select
	name,age,
    case
		when age <= 21 then  '청소년'
        when age <= 24 then '청년'
        else '성인'
	end as age_group
from student_db2.students;

-- if (조건, 'True 일 때 실행할 수식이나 값', 'False일 때 싱행 할 수식이나 값' )
select
	name,age,
    if(age<=21, '청소년', if(age<=24,'청년','성인'))
from student_db2.students;

-- 평균점수(소수점 둘째자리에서 반올림)가 >= 90 '우수'
-- 평균점수(소수점 둘째자리에서 반올림)가 >= 80 '보통'
-- 나머지 미흡
select
	name,age,
    round((kor+eng+math) / 3, 2) as avg_score,
        if(round((kor+eng+math) / 3, 2) >=90, '우수', 
			if(round((kor+eng+math) / 3, 2) >= 80, '보통','미흡'))
    from student_db2.students;
select
	name,age,
    case
		when round((kor+eng+math)/3,2) >= 90 then '우수'
        when round((kor+eng+math)/3,2) >= 80 then '보통'
        else '미흡'
	end as ranking
from student_db2.students;

-- kor 과목별로 상위 5명 출력
select *
    from student_db2.students where kor 
    order by kor desc, name 
    limit 5;

-- group by 여러개 group by age,name
select
age,name,count(*) as cnt
from student_db2.students
group by age, name;

-- 집계함수사용시 경에 따라서 null이 나올수 있음
select
age,
avg(coalesce(kor,0)) avg_kor  -- 값이 없으면 0으로 처리
from student_db2.students
group by age;  -- group by 안쓰면 오류발생

-- 필터링 HAVING
-- 국어 평균이 수학평균보다 높거나 또는 age별 학생수가 5명 이상인 데이터만 필터링
select
	age,
    avg(coalesce(kor,0)) as avg_kor,
    avg(coalesce(math,0)) as avg_math
from student_db2.students
group by age
having avg_kor > avg_math or count(*)>5;

-- 학생들 중에 전체 평균 미만인 학생들 출력