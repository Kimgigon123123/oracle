--1.

SELECT e.employee_id, e.first_name,
d.department_name
from employees e,departments d
where first_name Like '%v%'
and e.department_id=d.department_id;

--2.

SELECT e.employee_id,e.first_name,e.salary*e.commission_pct AS 커미션금액,
d.department_name
from employees e, departments d
where e.commission_pct is not null
and e.department_id=d.department_id(+);


--3.
SELECT d.department_id, d.department_name,
l.location_id,l.city,l.country_id,
c.country_name
from departments d, locations l, countries c
where d.location_id=l.location_id
and l.country_id=c.country_id
order by 1;

--4.

SELECT e.employee_id,e.first_name,e.job_id,
m.employee_id,m.first_name,m.job_id
from employees e, employees m
where e.manager_id=m.employee_id;

--5.
SELECT e.employee_id,e.first_name,
d.department_name,
l.city,l.street_address
from employees e,departments d,locations l
where e.department_id=d.department_id(+)
and d.location_id = l.location_id(+)
order by 1;

