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
                


