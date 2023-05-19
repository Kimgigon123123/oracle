[����5-1]
select employee_id,last_name,department_name
from employees,departments;

[����5-2] ���,�̸�,�μ��� ������ ��ȸ�Ѵ�.
select e.department_id,e.employee_id,e.first_name,d.department_name
from employees e,departments d
where e.department_id=d.department_id;

[����5-3] ���,�̸�,�μ��ڵ�,�μ����� ��ȸ�ϼ���
select e.employee_id,e.first_name,e.department_id,d.department_name
from employees e , departments d
where e.department_id = d.department_id;

[����5-4] ���,�̸�,�����ڵ�,�������� ������ ��ȸ�ϼ���
select e.employee_id,e.first_name,e.job_id,
j.job_title
from employees e , jobs j
where e.job_id = j.job_id;

[����5-5] ��� �̸� �μ��� ���������� ��ȸ�Ѵ�.
select e.employee_id,e.first_name,d.department_name,j.job_title
from employees e, departments d , jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;

[����5-6] ����� 101���� ����� ���, �̸�, �μ���, �������� ������ ��ȸ�Ѵ�.
select e.employee_id,e.first_name,d.department_name,j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
and e.employee_id=101;

[����5-7] �޿��� ���� ������ ���� ���� �ִ� 10�� �μ����� ���, �̸�, �޿�,���� ������ ��ȸ�ϼ���
select e.employee_id,e.first_name,e.salary,j.job_title
from employees e, jobs j
where e.salary between j.min_salary and j.max_salary
and e.department_id=10;

[����5-10] ����� ���, �̸�, �Ŵ��� ���, �Ŵ��� �̸� ������ ��ȸ�Ѵ�.
select e1.employee_id, e1.first_name, e2.employee_id, e2.first_name
from employees e1, employees e2;
--where e1.manager_id = e2.employee_id
--order by e1.employee_id;

[����5-11] �Ŵ����� ���� ����� ���, �̸�, �����̸��� ��ȸ�Ѵ�
select e.employee_id, e.first_name, j.job_title
from employees e , jobs j
where e.manager_id is null
and e.job_id = j.job_id;

[��������5-1]
1.�̸��� �ҹ���v�� ���Ե� ��� ����� ���, �̸�, �μ����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.

select e.employee_id, e.first_name, d.department_name
from employees e , departments d
where first_name like '%v%'
and e.department_id = d.department_id;

2.Ŀ�̼��� �޴� ����� ���, �̸�, �޿�, Ŀ�̼� �ݾ�, �μ����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
��, Ŀ�̼� �ݾ��� ���޿��� ���� Ŀ�̼� �ݾ��� ��Ÿ����.

select e.employee_id,e.first_name,e.salary,e.salary*e.commission_pct AS Ŀ�̼Ǳݾ�,
d.department_name
from employees e , departments d
where e.department_id = d.department_id(+)
and commission_pct is not null;

3. �� �μ��� �μ��ڵ� , �μ���, ��ġ�ڵ�, ���ø�, �����ڵ�, �������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.

select d.department_id, d.department_name,l.city, c.country_id, c.country_name
from departments d, countries c, locations l
where d.location_id = l.location_id
and l.country_id=c.country_id;

[�ڡڡڡڡڡڡڡڡڡڡ�]
4. ����� ���,�̸�, �����ڵ�, �Ŵ����� ���, �Ŵ����� �̸�, �Ŵ��� �����ڵ带 ��ȸ�Ͽ�
����� ��� ������ �����ϴ� �������� �ۼ��ض� --��

select e.employee_id,e.first_name,e.job_id,m.employee_id,m.first_name,m.job_id
from employees e , employees m
where e.manager_id = m.employee_id;

5. ��� ����� ���, �̸�, �μ���, ����, �ּ������� ��ȸ�Ͽ� ��������� �����ϴ�
�������� �ۼ��Ѵ�

select e.employee_id, e.first_name, d.department_name, l.city, l.street_address
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
order by 1;

5.6 ANSI JOIN

[����5-12] ����� ���, �̸�, �μ��ڵ�, �μ��� ������ ��ȸ�ض� (ANSI JOIN �̿�)
select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id;

[�ڡڡڡڡڡڡڡڡڡڡ�]
[����5-13] �������ǿ� ����ϴ� �÷����� ���� ��� ON ��� using�� ����Ҽ� �ְ�
using�� ��� �Ҷ��� �÷��� ����ؾ��Ѵ�.

select e.employee_id, e.first_name, department_id, d.department_name
from employees e inner join departments d
using (department_id);

[����5-14] 20�� �μ����� ���, �̸�, �μ��ڵ�, �μ����� ��ȸ�ض�

select e.employee_id,e.first_name,department_id,d.department_name
from employees e inner join departments d
using (department_id)
where department_id=20;

[����5-15] ����� ���, �̸�, �μ��ڵ� , �μ���, ��ġ�ڵ�, ���� ������ ��ȸ�Ѵ�.

select e.employee_id, e.first_name, e.department_id, d.department_name, l.location_id, l.city
from employees e inner join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

[����5-16] ����� ���, �̸�, �μ��ڵ�, �μ��� ������ ��ȸ�Ѵ�.
select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

�������� 5-2
1.����� 110 130 150 �� �ش��ϴ� ����� ���, �̸�, �μ����� ��ȸ�ϴ� �������� ANSI JOIN �������� �ۼ��Ѵ�.
select e.employee_id, e.first_name, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
where e.employee_id in (110, 130, 150);

2.��� ����� ���,�̸�,�μ���,�����ڵ�,���������� ��ȸ�Ͽ� ��� ������ �����ϴ� �������� �ۼ��Ѵ�.
select e.employee_id, e.first_name, d.department_name, j.job_id, j.job_title
from employees e left outer join departments d
on e.department_id=d.department_id
join jobs j
on e.job_id = j.job_id
order by e.employee_id

