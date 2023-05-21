[예제9-1] 3byte 숫자 id 컬럼과 20byte 문자 fname 컬럼으로 이루어진 tmp 테이블을 생성한다

create table tmp
(
id number(3),
fname varchar2(20)
);

[예제 9-4] 부서테이블 데이터를 복사하여 dept1 테이블을 생성한다.
create table dept1 AS
select * from departments;



[예제 9-5] 사원 테이블의 사번, 이름, 입사일 컬럼의 데이터를 복사하여 emp 20 테이블을 생성한다
CREATE TABLE emp20 AS
SELECT  employee_id, first_name, hire_date
FROM    employees
WHERE   department_id = 20;

[예제 9-6] 부서테이블을 데이터 없이 복사하여 dept2 테이블을 생성한다.

create table dept2 AS
select * from departments
where 1=2;

--컬럼 추가

alter table 테이블명
add ( 컬럼명1 데이터타입, 컬럼명2 데이터타입, ...);

[예제 9-7] emp20 테이블에 숫자타입 급여 컬럼과 문자타입 업무컬럼을 추가한다.

alter table emp20
add ( salary number, job_id varchar2(30));

select * from emp20;

-- 크기변경
alter table 테이블명
modify (컬럼명1 데이터타입, 컬럼명2 데이터타입, ...);

[예제 9-8] emp20 테이블의 급여 컬럼과 업무코드 컬럼의 데이터 사이즈를 변경한다.

alter table emp20
modify ( salary number(8,2), job_id varchar2(10));

desc emp20;

[예제9-9] emp20 테이블의 업무코드 컬럼을 삭제한다.
alter table emp20
drop column job_id;

select * from emp20;

[예제9-10] emp20 테이블을 삭제한다
drop table emp20;

--truncate table은 테이블 구조만 남겨두고 모든 행 데이터를 삭제한다.
[예제9-11]
truncate table dept1;

select * from dept1;