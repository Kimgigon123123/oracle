4�� �׷��Լ�

4.1 DISTINCT

[����4-1] ������� �Ҽӵ� �μ��� ��ȸ�Ѵ�.
select distinct department_id
from employees;

[����4-2]
select distinct department_id,employee_id
from employees;

[�������� 4-1] ��� ���̺��� �� ȸ���� �Ŵ������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT distinct e1.manager_id,e2.first_name
FROM employees e1, employees e2
where e1.manager_id = e2.employee_id
order by 1;

4.2 �׷��Լ�
[��������4-2]
1.��� ���̺��� Ŀ�̼��� �޴� ����� ��� ������� �׼��� ��ȸ�ϴ� �������� �ۼ��Ѵ�
select count(commission_pct)
from employees;

2. ���� �ֱٿ� ���� ������ �Ի��Ų ��¥�� �������� �ֱ� �Ի����ڸ� ��ȸ�ϴ� �������� �ۼ��Ѵ�
select max(hire_date)
from employees;

3. 90�� �μ��� ��ձ޿����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
��, ��ձ޿����� �Ҽ� ��° �ڸ����� ǥ��ǵ����Ѵ�.

select round(avg(salary),2)
from employees
where department_id = 90;

4.3 group by ��
[����4-8] �μ��� �޿��Ѿ�, �����, ��� �޿��� ��ȸ�Ѵ�.
select department_id,sum(salary),count(employee_id),round(avg(salary))
from employees
group by department_id;

[����4-9] �μ���, ������ �޿��Ѿ� ��� �޿��� ��ȸ�Ѵ�
select department_id,job_id,sum(salary),round(avg(salary))
from employees
group by department_id,job_id;

[����4-10] 80�� �μ��� �޿��Ѿװ� ��ձ޿��� ��ȸ�Ѵ�.
select department_id,sum(salary),round(avg(salary))
from employees
where department_id=80
group by department_id;

4.4 HAVING ��
[����4-11] 80�� �μ��� ��ձ޿��� ��ȸ�Ѵ�.
select department_id,round(avg(salary))
from employees
group by department_id 
having department_id=80;

[����4-12] �μ��� �Ҽӵ� ������� 5�� ������ �μ��� �� �� �� ��ȸ�Ѵ�
select department_id,count(*)
from employees
where department_id is not null
group by department_id
having count(*)<=5;

[��������4-3]

1. ������̺��� �Ȱ���  �̸��� �� �̻��ִ� �̸��� �� �̸��� ��� ��������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.

select first_name,count(first_name)
from employees
group by first_name
having count(first_name) >=2;

2. �μ���ȣ, �� �μ��� �޿��Ѿװ� ��ձ޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
��, �μ� ��ձ޿��� 8000 �̻��� �μ��� ��ȸ�ϵ��� �Ѵ�.
select department_id,sum(salary),round(avg(salary))
from employees
group by department_id
having round(avg(salary))>=8000;

3. �⵵,�⵵���� �Ի��� ������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
��, �⵵�� 2014�� ���·� ǥ��ǵ����Ѵ�.

select to_char(hire_date,'yyyy'),count(to_char(hire_date,'yyyy'))
from employees
group by to_char(hire_date,'yyyy');

4.5 rollup�� cube
[����4-13] �μ��� ������� �޿��հ�, �Ѱ踦 ��ȸ�Ѵ�.
select department_id,count(*),sum(salary)
from employees
where department_id is not null
group by rollup(department_id)
order by department_id;

[����4-14] �μ� �� ������ ������� �޿��հ�, �μ��� �Ұ�, �Ѱ踦 ��ȸ�Ѵ�.
select department_id,job_id,count(*),sum(salary)
from employees
where department_id is not null
group by rollup(department_id,job_id)
order by department_id;

select job_id,department_id,count(job_id),sum(salary)
from employees
where job_id is not null
group by rollup(job_id,department_id)
order by job_id;