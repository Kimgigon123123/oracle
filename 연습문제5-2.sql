[�������� 5-2]

--1. ����� 110,130,150�� �ش��ϴ� ����� ���, �̸� ,�μ����� ��ȸ�ϴ� �������� ANSI JOIN���� �ۼ��Ѵ�.
select e.employee_id, e.first_name, d.department_name
from employees e INNER join departments d
ON e.department_id=d.department_id
and e.employee_id In(110,130,150);

--2. ��� ����� ��� �̸� �μ��� �����ڵ� ���������� ��ȸ�Ͽ� ��������� �����ϴ� ������ �ۼ��Ѵ�.

select e.employee_id, e.first_name, 
d.department_name,
j.job_title
from employees e left outer join departments d
on e.department_id=d.department_id
left outer join jobs j
on e.job_id = j.job_id
order by 1;