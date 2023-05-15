--6��. �������� (p.51)

--================��������������==============
--6.1 ���� �� ��������
--6.2 ���� �� ��������
--6.3 ���� �÷� ��������
--6.4 ��ȣ���� ��������
--6.5 ��Į�� ��������
--6.6 �ζ��� �� ��������
--===========================================
[���� 6-1] ��ձ޿����� �� ���� �޿��� �޴� ����� ������ ��ȸ�Ѵ�.
select employee_id, first_name, salary
from employees
where salary < (select avg(salary) from employees);

[����6-2] ���޿��� ���� ���� ����� ���, �̸�,�� ������ ��ȸ�Ѵ�

select employee_id, first_name, salary
from employees
where salary=(select max(salary) from employees);

[����6-3] ��� 108�� ����� �޿����� ������ �޿��� �޴� ����� ���, �̸�, �޿��� ��ȸ�Ѵ�.

select employee_id, first_name, salary
from employees
where salary > (select salary from employees where employee_id=108);

[���� 6-4] ���޿��� ���� ���� ����� ���, �̸�, ��, �������� ������ ��ȸ�Ѵ�.

select e.employee_id,e.first_name,
j.job_title
from employees e,jobs j
where e.job_id = j.job_id
and salary = (select max(salary) from employees);


--6.2 ���� �� �������� (p.53)
--���� �� ������ (IN,NOT,ANY(=SOME),ALL,EXISTS)
--6.2.1 IN ������ 
-- OR ������ ��� --> ����
--6.2.1 NOT ������
--6.2.1 ANY ������
--6.2.1 ALL ������
--6.2.1 EXISTS ������

[����6-5] �ٹ���(��ġ�ڵ�)�� ����(UK)�� �μ��ڵ�, ��ġ�ڵ�, �μ��� ������ ��ȸ�Ѵ�.

select location_id
from locations
where country_id='UK';
--���� ���� ������ ������ ������ �������� �Ұ�!

SELECT d.department_id, d.location_id, d.department_name
from departments d
where d.location_id IN (select location_id from locations where country_id='UK');

[����6-6] 70�� �μ����� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� �޿������� ��ȸ�Ѵ�.

SELECT employee_id,first_name,department_id,salary
from employees
where salary > (select salary from employees where department_id=70)
order by salary;

[����6-8] 10�� �μ����� �޿����� ���� �޿��� �޴� ����� ��� �̸� �μ���ȣ �޿��� �޿������� ��ȸ�Ѵ�.

select employee_id, last_name, department_id, salary
from employees
where salary < (select salary from employees where department_id=10)
order by salary;

[����6-10] 100�� �μ��� ����� �޿����� ���� �޿��� �޴� ����� ��� �̸� �μ���ȣ �޿��� �޿� ������������ ��ȸ�Ѵ�

select employee_id, first_name, department_id,salary
from employees
where salary > ALL (select salary from employees where department_id=100);

[����6-14] 20�� �μ����� �޿��� ���� �޿��� �޴� ����� ���,�̸�,�μ���ȣ,�޿��� �μ��ڵ� ��, �޿������� ��ȸ�Ѵ�.

SELECT employee_id, first_name, department_id,salary
from employees
where salary in (select salary from employees where department_id=20)
order by department_id,salary;

[����6-16] �μ����̺��� �μ��ڵ尡 10,20,30,40�� �ش����� �ʴ� �μ��ڵ带 ��ȸ�Ѵ�.

select department_id
from departments
where department_id not in (10,20,30,40);