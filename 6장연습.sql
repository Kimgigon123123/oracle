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

3. 회사의 사장보다 더 먼저 입사한 사원들의 사번, 이름, 입사일을 조회하는 쿼리문을 작성한다.
단, 사장은 그를 관리하는 매니저가 없는 사원이다.

select employee_id, first_name, hire_date
from employees
where hire_date < (select hire_date
                    from employees
                    where manager_id is null);
                    

[★★★★★★★★★★★]
[예제6-5] 근무지(위치코드)가 영국(UK)인 부서코드, 위치코드, 부서명 정보를 조회한다.

SELECT department_id, location_id, department_name
from departments 
where location_id  in (select location_id
                        from locations
                        where COUNTRY_ID = 'UK');

[예제6-6] 70번 부서원의 급여보다 높은 급여를 받는 사원의 사번, 이름, 부서번호, 급여를 급여 순으로 조회한다.
select employee_id, first_name, department_id, salary
from employees
where salary > (select salary
                from employees
                where department_id = 70)
order by salary;

[예제6-10] 100번 부서원 모두의 급여보다 높은 급여를 받는 사원의 사번, 이름, 부서번호, 급여를 급여 오름차순으로 조회한다.
select employee_id, first_name, department_id,salary
from employees
where salary > ALL (select salary
                from employees
                where department_id = 100);
                
[예제6-12] 30번 부서원 모두의 급여보다 적은 급여를 받는 사원의 사번, 이름, 부서번호, 급여를 
급여순으로 조회한다.

select employee_id, first_name, department_id, salary
from employees
where salary < ALL (SELECT salary
                from employees
                where department_id = 30);
                
[예제6-14] 20번 부서원의 급여와 같은 급여를 받는 사원의 사번, 이름, 부서번호, 급여를
부서코드 순, 급여순으로 조회한다.

select employee_id, first_name, department_id, salary
from employees
where salary in (select salary
               from employees
               where department_id= 20)
order by department_id,salary;

[예제6-16] 부서테이블에서 부서코드가 10,20,30,40 에 해당하지 않는 부서코드를 조회한다.

SELECT department_id
from departments
where department_id not in (10,20,30,40);



[★★★★★★★★★★★]
[예제6-18] 매니저가 없는 사원이 매니저로 있는 부서코드, 부서명을 조회해라

select department_id, department_name
from departments
where (department_id,manager_id) in (select department_id,employee_id
                        from employees
                        where manager_id is null);

[★★★★★★★★★★★][★★★★★★★★★★★][★★★★★★★★★★★][★★★★★★★★★★★][★★★★★★★★★★★][★★★★★★★★★★★]
[연습문제 6-2]
[★★★★★★★★★★★][★★★★★★★★★★★][★★★★★★★★★★★]
1. 부서위치코드가 1700에 해당하는 모든 사원의 사번, 이름, 부서코드, 업무코드를
조회하는 쿼리문을 다중 행 서브쿼리를 사용하여 작성해라
select employee_id, first_name, department_id,job_id
from employees
where department_id in
(select department_id
from departments
where location_id = 1700);

[★★★★★★★★★★★][★★★★★★★★★★★][★★★★★★★★★★★]
2. 부서별로 가장 급여를 많이 받는 사원의 사번, 이름, 부서번호, 급여, 업무코드를 조회하는 쿼리문을 다중 컬럼 서브쿼리를 사용하여
작성한다.

select employee_id, first_name, department_id, salary, job_id
from employees
where (department_id,salary) in
(select department_id,max(salary)
from employees
group by department_id)
