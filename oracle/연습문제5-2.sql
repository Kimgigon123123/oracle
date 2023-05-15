[연습문제 5-2]

--1. 사번이 110,130,150에 해당하는 사원의 사번, 이름 ,부서명을 조회하는 쿼리문을 ANSI JOIN으로 작성한다.
select e.employee_id, e.first_name, d.department_name
from employees e INNER join departments d
ON e.department_id=d.department_id
and e.employee_id In(110,130,150);

--2. 모든 사원의 사번 이름 부서명 업무코드 업무제목을 조회하여 사번순으로 정렬하는 쿼리를 작성한다.

select e.employee_id, e.first_name, 
d.department_name,
j.job_title
from employees e left outer join departments d
on e.department_id=d.department_id
left outer join jobs j
on e.job_id = j.job_id
order by 1;