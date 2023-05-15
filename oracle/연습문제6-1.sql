--1. 급여가 가장 적은 사원의 사번,이름,부서,급여를 조회하는 쿼리문을 작성한다.

select e.employee_id,e.first_name,d.department_name,e.salary
from employees e, departments d
where salary = (select min(salary) from employees)
AND e.department_id = d.department_id;

--2. 부서명이 Marketing인 부서에 속한 모든 사원의 사번, 이름, 부서코드, 업무코드를 조회하는 쿼리문을 작성한다.

select employee_id,first_name,department_id,job_id
from employees
where department_id=(select department_id from departments where department_name='Marketing');

--3. 회사의 사장보다 더 먼저 입사한 사원들의 사번,이름,입사일을 조회하는 쿼리문을 작성한다.
-- 사장은 매니저가 없는 사원이다.

select employee_id,first_name,hire_date
from employees
where hire_date<(select hire_date from employees where manager_id is null)
order by hire_date desc;