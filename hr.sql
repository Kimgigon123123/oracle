--���, �̸�, �μ��ڵ�, �μ���
select EMPLOYEE_ID, FIRST_NAME,manager_id, DEPARTMENT_ID from employees;

select department_name from departments;

select e.*,d.*
from employees E,departments d  -- �� ���̺��� ���踦 �ĺ��� �� �ִ� Ű���� ����
where e.department_id = d.department_id(+);

select e.*,D.*
from employees e left outer join departments d on e.department_id=d.department_id; -- �̰� ǥ�� (ANSI (�̱�ǥ��))