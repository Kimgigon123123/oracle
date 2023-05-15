--1. �޿��� ���� ���� ����� ���,�̸�,�μ�,�޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.

select e.employee_id,e.first_name,d.department_name,e.salary
from employees e, departments d
where salary = (select min(salary) from employees)
AND e.department_id = d.department_id;

--2. �μ����� Marketing�� �μ��� ���� ��� ����� ���, �̸�, �μ��ڵ�, �����ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.

select employee_id,first_name,department_id,job_id
from employees
where department_id=(select department_id from departments where department_name='Marketing');

--3. ȸ���� ���庸�� �� ���� �Ի��� ������� ���,�̸�,�Ի����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
-- ������ �Ŵ����� ���� ����̴�.

select employee_id,first_name,hire_date
from employees
where hire_date<(select hire_date from employees where manager_id is null)
order by hire_date desc;