[예제5-1]
select employee_id,last_name,department_name
from employees,departments;

[예제5-2] 사번,이름,부서명 정보를 조회한다.
select e.department_id,e.employee_id,e.first_name,d.department_name
from employees e,departments d
where e.department_id=d.department_id;

[예제5-3] 사번,이름,부서코드,부서명을 조회하세요
select e.employee_id,e.first_name,e.department_id,d.department_name
from employees e , departments d
where e.department_id = d.department_id;

[예제5-4] 사번,이름,업무코드,업무제목 정보를 조회하세요
select e.employee_id,e.first_name,e.job_id,
j.job_title
from employees e , jobs j
where e.job_id = j.job_id;

[예제5-5] 사번 이름 부서명 업무제목을 조회한다.
select e.employee_id,e.first_name,d.department_name,j.job_title
from employees e, departments d , jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;

[예제5-6] 사번이 101번인 사원의 사번, 이름, 부서명, 업무제목 정보를 조회한다.
select e.employee_id,e.first_name,d.department_name,j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
and e.employee_id=101;

[예제5-7] 급여가 업무 상하한 범위 내에 있는 10번 부서원의 사번, 이름, 급여,업무 제목을 조회하세요
select e.employee_id,e.first_name,e.salary,j.job_title
from employees e, jobs j
where e.salary between j.min_salary and j.max_salary
and e.department_id=10;

[예제5-10] 사원의 사번, 이름, 매니저 사번, 매니저 이름 정보를 조회한다.
select e1.employee_id, e1.first_name, e2.employee_id, e2.first_name
from employees e1, employees e2;
--where e1.manager_id = e2.employee_id
--order by e1.employee_id;

[예제5-11] 매니저가 없는 사원의 사번, 이름, 업무이름을 조회한다
select e.employee_id, e.first_name, j.job_title
from employees e , jobs j
where e.manager_id is null
and e.job_id = j.job_id;

[연습문제5-1]
1.이름에 소문자v가 포함된 모든 사원의 사번, 이름, 부서명을 조회하는 쿼리문을 작성한다.

select e.employee_id, e.first_name, d.department_name
from employees e , departments d
where first_name like '%v%'
and e.department_id = d.department_id;

2.커미션을 받는 사원의 사번, 이름, 급여, 커미션 금액, 부서명을 조회하는 쿼리문을 작성한다.
단, 커미션 금액은 월급여에 대한 커미션 금액을 나타낸다.

select e.employee_id,e.first_name,e.salary,e.salary*e.commission_pct AS 커미션금액,
d.department_name
from employees e , departments d
where e.department_id = d.department_id(+)
and commission_pct is not null;

3. 각 부서의 부서코드 , 부서명, 위치코드, 도시명, 국가코드, 국가명을 조회하는 쿼리문을 작성한다.

select d.department_id, d.department_name,l.city, c.country_id, c.country_name
from departments d, countries c, locations l
where d.location_id = l.location_id
and l.country_id=c.country_id;

[★★★★★★★★★★★]
4. 사원의 사번,이름, 업무코드, 매니저의 사번, 매니저의 이름, 매니저 업무코드를 조회하여
사원의 사번 순서로 정렬하는 쿼리문을 작성해라 --★

select e.employee_id,e.first_name,e.job_id,m.employee_id,m.first_name,m.job_id
from employees e , employees m
where e.manager_id = m.employee_id;

5. 모든 사원의 사번, 이름, 부서명, 도시, 주소정보를 조회하여 사번순으로 정렬하는
쿼리문을 작성한다

select e.employee_id, e.first_name, d.department_name, l.city, l.street_address
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
order by 1;

5.6 ANSI JOIN

[예제5-12] 사원의 사번, 이름, 부서코드, 부서명 정보를 조회해라 (ANSI JOIN 이용)
select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id;

[★★★★★★★★★★★]
[예제5-13] 조인조건에 사용하는 컬럼명이 같은 경우 ON 대신 using을 사용할수 있고
using을 사용 할때는 컬럼명만 기술해야한다.

select e.employee_id, e.first_name, department_id, d.department_name
from employees e inner join departments d
using (department_id);

[예제5-14] 20번 부서원의 사번, 이름, 부서코드, 부서명을 조회해라

select e.employee_id,e.first_name,department_id,d.department_name
from employees e inner join departments d
using (department_id)
where department_id=20;

[예제5-15] 사원의 사번, 이름, 부서코드 , 부서명, 위치코드, 도시 정보를 조회한다.

select e.employee_id, e.first_name, e.department_id, d.department_name, l.location_id, l.city
from employees e inner join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

[예제5-16] 사원의 사번, 이름, 부서코드, 부서명 정보를 조회한다.
select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

연습문제 5-2
1.사번이 110 130 150 에 해당하는 사원의 사번, 이름, 부서명을 조회하는 쿼리문을 ANSI JOIN 형식으로 작성한다.
select e.employee_id, e.first_name, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
where e.employee_id in (110, 130, 150);

2.모든 사원의 사번,이름,부서명,업무코드,업무제목을 조회하여 사번 순으로 정렬하는 쿼리문을 작성한다.
select e.employee_id, e.first_name, d.department_name, j.job_id, j.job_title
from employees e left outer join departments d
on e.department_id=d.department_id
join jobs j
on e.job_id = j.job_id
order by e.employee_id

