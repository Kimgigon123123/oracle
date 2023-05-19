[예제6-1] 평균급여보다 더 적은 급여를 받는 사원의 사번 이름 성 정보를 조회한다

select employee_id, first_name, last_name
from employees
where salary <= (select avg(salary)
                    from employees);

[예제6-2] 월급여가 가장 많은 사원의 사번, 이름, 성 정보를 조회한다
select employee_id,first_name,last_name
from employees
where salary = (select max(salary)
                from employees);
                
[예제6-3] 사번 108번 사원의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 조회한다.

select employee_id, first_name, salary
from employees
where salary > (select salary
                from employees
                where employee_id = 108);



[★★★★★★★★★★★]                
[예제6-4] 월급여가 가장 많은 사원의 사번, 이름, 성, 업무제목 정보를 조회한다.

select e.employee_id, e.first_name, e.last_name, j.job_title
from employees e left outer join jobs j
on e.job_id = j.job_id
where e.salary = (select max(salary)
                from employees);
                
연습문제 6-1

1. 급여가 가장 적은 사원의 사번, 이름, 부서, 급여를 조회하라

select employee_id, first_name, department_id, salary
from employees
where salary = (select min(salary)
                from employees);
                
2. 부서명이 Marketing 인 부서에 속한 모든 사원의 사번, 이름, 부서코드, 업무코드를 조회하는 쿼리문을 작성하라

select e.employee_id, e.first_name, e.department_id, e.job_id
from employees e join departments d
on e.department_id = d.department_id
where d.department_name = 'Marketing';
                


