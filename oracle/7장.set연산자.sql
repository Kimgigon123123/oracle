--7장 set 연산자(p.63)

-- 5장 join연산. 테이블(의 칼럼)을 가로로 연결하는 연산
-- 7장 set 연산자. 테이블(의 데이터/행)을 세로로 연결하는 연산

--7.1 UNION : 합집합
-- 집합에서 합집합에 해당하는 연산자, 중복을 제거한 행의 결과를 반환
[예제7-1]
SELECT 1,3,4,5,7,8,'A' AS first -- 조회되는 컬럼명은 첫번째 쿼리문의 컬럼명이 사용된다.
FROM dual
UNION 
select 2,4,5,6,8,null,'B' AS second
from dual
union
select 1,3,4,5,7,8,'A' As third
from dual;


[예제7-2]
select department_id code,department_name name
from departments
union 
select location_id,city
from locations;

--7.2 UNION ALL : 합집합
SELECT 1,3,4,5,7,8,'A' AS first -- 조회되는 컬럼명은 첫번째 쿼리문의 컬럼명이 사용된다.
FROM dual
UNION all
select 2,4,5,6,8,null,'B' AS second
from dual
union all
select 1,3,4,5,7,8,'A' As third
from dual;

--7.3 INTERSECT : 교집합
SELECT 1,3,4,5,7,8,'A' AS first -- 조회되는 컬럼명은 첫번째 쿼리문의 컬럼명이 사용된다.
FROM dual
intersect
select 1,3,4,5,7,8,'A' As third
from dual;

[예제 7-7]

select first_name
from employees
where department_id =80
intersect
select first_name
from employees
where department_id =50;
--7.4 MINUS : 차집합
-- 집합에서 차집합에 해당하는 연산자.

[예제7-9] 80번부서원의 이름에서 50번 부서원의 이름을 제외한다.
--순수하게 80번 부서에만 존재하는 부서원의 이름
--공통 : Peter ,John (intersect 연산결과)
select first_name
from employees
where department_id=80
minus
select first_name
from employees
where department_id=50;

[연습문제 7-1]

SELECT e.employee_id AS EMP, e.first_name AS NAME,
d.department_name AS DEPT, m.manager_id, e.salary
from employees e, departments d, employees m
where e.department_id=d.department_id
and e.employee_id=m.manager_id
