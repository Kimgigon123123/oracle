--사번, 이름, 부서코드, 부서명
select EMPLOYEE_ID, FIRST_NAME,manager_id, DEPARTMENT_ID from employees;

select department_name from departments;

select e.*,d.*
from employees E,departments d  -- 두 테이블의 관계를 식별할 수 있는 키값의 연결
where e.department_id = d.department_id(+);

select e.*,D.*
from employees e left outer join departments d on e.department_id=d.department_id; -- 이게 표준 (ANSI (미국표준))