--7�� set ������(p.63)

-- 5�� join����. ���̺�(�� Į��)�� ���η� �����ϴ� ����
-- 7�� set ������. ���̺�(�� ������/��)�� ���η� �����ϴ� ����

--7.1 UNION : ������
-- ���տ��� �����տ� �ش��ϴ� ������, �ߺ��� ������ ���� ����� ��ȯ
[����7-1]
SELECT 1,3,4,5,7,8,'A' AS first -- ��ȸ�Ǵ� �÷����� ù��° �������� �÷����� ���ȴ�.
FROM dual
UNION 
select 2,4,5,6,8,null,'B' AS second
from dual
union
select 1,3,4,5,7,8,'A' As third
from dual;


[����7-2]
select department_id code,department_name name
from departments
union 
select location_id,city
from locations;

--7.2 UNION ALL : ������
SELECT 1,3,4,5,7,8,'A' AS first -- ��ȸ�Ǵ� �÷����� ù��° �������� �÷����� ���ȴ�.
FROM dual
UNION all
select 2,4,5,6,8,null,'B' AS second
from dual
union all
select 1,3,4,5,7,8,'A' As third
from dual;

--7.3 INTERSECT : ������
SELECT 1,3,4,5,7,8,'A' AS first -- ��ȸ�Ǵ� �÷����� ù��° �������� �÷����� ���ȴ�.
FROM dual
intersect
select 1,3,4,5,7,8,'A' As third
from dual;

[���� 7-7]

select first_name
from employees
where department_id =80
intersect
select first_name
from employees
where department_id =50;
--7.4 MINUS : ������
-- ���տ��� �����տ� �ش��ϴ� ������.

[����7-9] 80���μ����� �̸����� 50�� �μ����� �̸��� �����Ѵ�.
--�����ϰ� 80�� �μ����� �����ϴ� �μ����� �̸�
--���� : Peter ,John (intersect ������)
select first_name
from employees
where department_id=80
minus
select first_name
from employees
where department_id=50;

[�������� 7-1]

SELECT e.employee_id AS EMP, e.first_name AS NAME,
d.department_name AS DEPT, m.manager_id, e.salary
from employees e, departments d, employees m
where e.department_id=d.department_id
and e.employee_id=m.manager_id
