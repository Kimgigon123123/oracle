[����6-1] ��ձ޿����� �� ���� �޿��� �޴� ����� ��� �̸� �� ������ ��ȸ�Ѵ�

select employee_id, first_name, last_name
from employees
where salary <= (select avg(salary)
                    from employees);

[����6-2] ���޿��� ���� ���� ����� ���, �̸�, �� ������ ��ȸ�Ѵ�
select employee_id,first_name,last_name
from employees
where salary = (select max(salary)
                from employees);
                
[����6-3] ��� 108�� ����� �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ��ȸ�Ѵ�.

select employee_id, first_name, salary
from employees
where salary > (select salary
                from employees
                where employee_id = 108);



[�ڡڡڡڡڡڡڡڡڡڡ�]                
[����6-4] ���޿��� ���� ���� ����� ���, �̸�, ��, �������� ������ ��ȸ�Ѵ�.

select e.employee_id, e.first_name, e.last_name, j.job_title
from employees e left outer join jobs j
on e.job_id = j.job_id
where e.salary = (select max(salary)
                from employees);
                
�������� 6-1

1. �޿��� ���� ���� ����� ���, �̸�, �μ�, �޿��� ��ȸ�϶�

select employee_id, first_name, department_id, salary
from employees
where salary = (select min(salary)
                from employees);
                
2. �μ����� Marketing �� �μ��� ���� ��� ����� ���, �̸�, �μ��ڵ�, �����ڵ带 ��ȸ�ϴ� �������� �ۼ��϶�

select e.employee_id, e.first_name, e.department_id, e.job_id
from employees e join departments d
on e.department_id = d.department_id
where d.department_name = 'Marketing';

3. ȸ���� ���庸�� �� ���� �Ի��� ������� ���, �̸�, �Ի����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
��, ������ �׸� �����ϴ� �Ŵ����� ���� ����̴�.

select employee_id, first_name, hire_date
from employees
where hire_date < (select hire_date
                    from employees
                    where manager_id is null);
                    

[�ڡڡڡڡڡڡڡڡڡڡ�]
[����6-5] �ٹ���(��ġ�ڵ�)�� ����(UK)�� �μ��ڵ�, ��ġ�ڵ�, �μ��� ������ ��ȸ�Ѵ�.

SELECT department_id, location_id, department_name
from departments 
where location_id  in (select location_id
                        from locations
                        where COUNTRY_ID = 'UK');

[����6-6] 70�� �μ����� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� �޿� ������ ��ȸ�Ѵ�.
select employee_id, first_name, department_id, salary
from employees
where salary > (select salary
                from employees
                where department_id = 70)
order by salary;

[����6-10] 100�� �μ��� ����� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� �޿� ������������ ��ȸ�Ѵ�.
select employee_id, first_name, department_id,salary
from employees
where salary > ALL (select salary
                from employees
                where department_id = 100);
                
[����6-12] 30�� �μ��� ����� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� 
�޿������� ��ȸ�Ѵ�.

select employee_id, first_name, department_id, salary
from employees
where salary < ALL (SELECT salary
                from employees
                where department_id = 30);
                
[����6-14] 20�� �μ����� �޿��� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿���
�μ��ڵ� ��, �޿������� ��ȸ�Ѵ�.

select employee_id, first_name, department_id, salary
from employees
where salary in (select salary
               from employees
               where department_id= 20)
order by department_id,salary;

[����6-16] �μ����̺��� �μ��ڵ尡 10,20,30,40 �� �ش����� �ʴ� �μ��ڵ带 ��ȸ�Ѵ�.

SELECT department_id
from departments
where department_id not in (10,20,30,40);



[�ڡڡڡڡڡڡڡڡڡڡ�]
[����6-18] �Ŵ����� ���� ����� �Ŵ����� �ִ� �μ��ڵ�, �μ����� ��ȸ�ض�

select department_id, department_name
from departments
where (department_id,manager_id) in (select department_id,employee_id
                        from employees
                        where manager_id is null);

[�ڡڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡڡ�]
[�������� 6-2]
[�ڡڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡڡ�]
1. �μ���ġ�ڵ尡 1700�� �ش��ϴ� ��� ����� ���, �̸�, �μ��ڵ�, �����ڵ带
��ȸ�ϴ� �������� ���� �� ���������� ����Ͽ� �ۼ��ض�
select employee_id, first_name, department_id,job_id
from employees
where department_id in
(select department_id
from departments
where location_id = 1700);

[�ڡڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡڡ�]
2. �μ����� ���� �޿��� ���� �޴� ����� ���, �̸�, �μ���ȣ, �޿�, �����ڵ带 ��ȸ�ϴ� �������� ���� �÷� ���������� ����Ͽ�
�ۼ��Ѵ�.

select employee_id, first_name, department_id, salary, job_id
from employees
where (department_id,salary) in
(select department_id,max(salary)
from employees
group by department_id)
