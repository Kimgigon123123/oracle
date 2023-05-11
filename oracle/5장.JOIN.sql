-- 5장. JOIN (연산)
-- 오라클 관계형 데이터베이스이다 ==> 관계: 테이블과 테이블이 맺는!
-- (Relation,릴레이션 - 데이터베이스 설계할때 테이블을 릴레이션이라고 함)
-- JOIN 여러 테이블을 연결하여 (HR: 7개, 업무: n

--5.1 Cartesian Product (Decart의 다른 말, Cartesian)
--JOIN 조건을 기술하지 않을 때 잘못된 결과가 발생하는데, 이걸 카테시안 곱(=합성곱)이라고 함.
-- 오류는 안남.

--SELECT 컬럼명1, 컬럼명2, ...
--FROM 테이블명1, 테이블명2, ...
--WHERE JOIN 조건(=비교)


[예제5-1]사원 테이블과 부서 테이블을 이용해 사원의 정보를 조회하고자 한다. 사번,성, 부서 이름을
조회하라!

--사번, 성 : employees (사원 정보 테이블 : 사번, 이름, 사원급여, 입사일, .. )
--부서이름 : departments (부서 정보 테이블 : 부서코드, 부서이름, 부서가 위치한 지역 코드)
-- 다른 테이블은 행을 나누어서 작성!! (가독성)
-- 두 테이블의 공통 컬럼 : department_id (manager_id : 부서 테이블의 식별자 x)

SELECT employee_id, last_name, -- 주된 내용
        department_name
FROM employees ,departments ;


--사원테이블 데이터/행 수 : 107
--부서테이블 데이터/행 수 : 27
--카테시안 곱 : 2889 rows ==> 107*27


desc employees;
desc departments;
----이름              널?       유형           
----------------- -------- ------------ 
--DEPARTMENT_ID   NOT NULL NUMBER(4)    
--DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
--MANAGER_ID               NUMBER(6)    
--LOCATION_ID              NUMBER(4)   


--5.2 EQUI JOIN

 -- 동등 연산자 (=)를 사용해 JOIN 연산(=동등 조인)
 -- 전체 사원은 107명, 조회된 결과 106건 <--> 1명의 누락!!
 
 SELECT e.employee_id, e.last_name, -- 주된 내용
        d.department_name
FROM employees e,departments d
WHERE e.department_id=d.department_id;

[예제5-4] (사원테이블, 업무테이블을 이용해) 사번,이름,업무코드,업무제목 정보를 조회한다.
DESC jobs;


SELECT e.employee_id,e.first_name||' '||e.last_name AS name,e.job_id,
        j.job_title
FROM employees e,jobs j
where e.job_id=j.job_id
order by 1;



[예제5-5] 사원 테이블,부서테이블,업무테이블을 이용해 사번,이름, 부서명, 업무제목을 조회한다.

SELEct e.employee_id,e.first_name||' '||e.last_name AS name,
d.department_name,
j.job_title
FROM employees e, departments d, jobs j
where e.department_id=d.department_id
AND e.job_id=j.job_id;


--5.3 NON-EQUI JOIN

--5.4 OUTER JOIN

--5.5 SELF JOIN

--5.6 ANSI JOIN / ANSI 협회에서 만든 표준 JOIN 식 (ORACLE 외에도 MYSQL, CUBRID, 기타 RDBMS 공통 JOIN)


--5.7 OUTER JOIN