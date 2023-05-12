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
 -- 누락된 데이터 행까지 포함해서 결과를 반영 ==> 제대로된 결과 (전체 사원기준) ==> OUTER JOIN 처리!
 
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

--where 조건절에 join 조건과 일반 조건을 함께 사용한다.
[예제5-6] 사번이 101번인 사원의 사번, 이름, 부서명, 업무제목 정보를 조회한다.

SELECT employee_id,last_name,
department_name,
job_title
from employees e,departments d,jobs j
where e.employee_id=101
and e.department_id = d.department_id
and e.job_id = j.job_id;



--5.3 NON-EQUI JOIN                      vs                     EQUI JOIN (개념상 INNER JOIN VS OUTER JOIN) 

--   NO~EQUI : 이외의 연산기호
--   비교연산자(>,>=,<,<=)
--   BETWEEN
--   IN

[예제5-7] 급여가 업무 상하한 범위 내에 있는 10번 부서원의 사번, 이름, 급여, 업무 제목을 조회한다.

select e.employee_id,e.first_name,e.salary,
j.job_title
from employees e, jobs j
where 
e.salary BETWEEN j.min_salary and j.max_salary
and department_id=10;





-- 급여의 최고, 최저선 : 상,하한 범위
-- 업무 상하한 범위 ??
-- 업무 ==> 업무 테이블 (JOBS)
desc jobs;

--5.4 OUTER JOIN : EQUI JOIN 쿼리문은 JOIN 하는 테이블간 공통으로 만족되는 값을
-- 가진 경우의 결과만을 반환한다. 하지만 ,outer조인은 만족되는 값이 없는 경우의 결과까지??
-- 반환한다.

--※ 만족되는 값이 없는 테이블 컬럼명에 (+) 기호를 표시한다.

[예제5-8] 모든 사원의 사번,이름,급여,부서코드, 부서명 정보를 조회한다.
-- department_id가 NULL인 사원 1명의 정보 누락되는 결과 : EQUI JOIN 연산
-- 사원 정보 : 사번, 이름, 급여, 부서코드 (employees)
-- 부서정보 : 부서명 (departments)
SELECT e.employee_id AS empno,e.first_name AS ename, e.salary AS esal,
    d.department_name AS dname
from employees e , departments d
where e.department_id = d.department_id(+)
ORDER BY 1;


[예제5-9] 모든 사원의 사번, 이름, 급여, 부서코드, 위치코드, 도시이름 정보를 조회한다.
SELECT e.employee_id,e.first_name,e.salary,
d.department_name,
l.location_id,l.city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id=l.location_id(+)
order by 1;


--5.5 SELF JOIN : 하나의 테이블을 두 번 명시하여, 동일한 테이블 두개로 부터 JOIN을 통해
-- 데이터를 조회한 결과를 반환한다.
-- 1) 실제로 테이블을 두개인게 더 나을까? (물리적으로 저장되는 공간 낭비)
-- 2) 두 번 명시 한다 (메모리상-속도 빠르죠!- 물리적으로 중복된 데이터 저장 하지 않고!! 서로다른,
-- 테이블이 존재하는 것처럼 JOIN 연산
-- ※ 테이블 관계 : 순환 참조 (재귀,Recursive)

[예제 5-10] 사원의 사번, 이름, 매니저의 사번, 매니저의 이름 정보를 조회한다.
--사원의 정보 : employees [사번 컬럼, 이름]
-- 매니저의 정보 : manager?? [사번 컬럼, 이름]
SELECT e.employee_id 사원사번,e.first_name 사원이름,
m.employee_id 매니저사번 ,m.first_name 매니저이름
from employees e,employees m
where e.manager_id=m.employee_id
order by 1;
--5.6 ANSI JOIN / ANSI 협회에서 만든 표준 JOIN 식 (ORACLE 외에도 MYSQL, CUBRID, 기타 RDBMS 공통 JOIN)
--오라클 DBMS가 아닌 다른 DBMS에서 공통저긍로 사용할 수 있는 표준 방식의 JOIN 연산
-- 모든 DBMS에서 .. RDBMS(Relational DBMS/관계형 DBMS)


--5.6.1 INNER JOIN <---> 오라클 JOIN에서 INNER JOIN은 사실, EQUI-JOIN!
-- FROM절에 INNER JOIN을 사용하고, JOIN 조건 (WHERE)은 ON 절에 명시한다.

[예제5-12] 사원의 사번, 이름, 부서코드, 부서명 정보를 조회한다.
-- 오라클 JOIN

SELECT e.employee_id,e.first_name,e.department_id,
d.department_name
from employees e INNER JOIN departments d  --1) FROM 절에 INNER JOIN을 사용 :, 대신!
ON e.department_id = d.department_id --2) JOIN 조건은 ON 절에 표시 : where 대신 ~ ON!
AND e.manager_id IS NOT NULL
ORDER BY 1; 


--ON절 대신 USING절을 사용할 수 있다.
-- 단, USING을 사용할때 컬럼명만 기술해야 한다 ==> 테이블의 별칭(Alias)을 생략!!
-- ※ 공통 컬럼 이름만 기술 ==> 테이블 별칭 생략!!!!!!!!!

SELECT e.employee_id,e.first_name,department_id, --2) SELECT절에 공통 컬럼도 테이블 별칭 제거
d.department_name
from employees e INNER JOIN departments d  
USING (department_id) --1) ON 대신 USING (공통컬럼명만)
--AND e.manager_id IS NOT NULL
ORDER BY 1; 

--5.7 OUTER JOIN