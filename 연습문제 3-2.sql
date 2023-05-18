--�������� 3-2

--1. ������̺��� �̸�(first_name)�� A�� �����ϴ� ��� ����� �̸��� �̸��� ���̴� ��ȸ�Ѵ�

SELECT first_name, length(first_name) AS "�̸��� ����"
FROM employees
WHERE first_name Like 'A%';



--2. 80�� �μ����� �̸��� �޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�
--(��, �޿��� 15�� ����, ���ʿ� $ ��ȣ�� ä���� ���·� ǥ���Ѵ�)
SELECT first_name||' '||last_name AS name, LPAD(salary,length(salary)+1,'$') AS salary
FROM employees
WHERE department_id=80;



--3. 60�� �μ�, 80�� �μ�, 100�� �μ��� �Ҽӵ� ����� ���, �̸�, ��ȭ��ȣ, ��ȭ��ȣ�� ������ȣ�� ��ȸ�Ѵ�
--(��, ������ȣ�� Local Number��� ǥ���ϰ�, ������ȣ 515.124.4169���� 515�� ������ȣ�̴�)

SELECT employee_id, first_name||' '||last_name AS name, phone_number, substr(phone_number,1,3) AS "Local Number"
from employees
where department_id IN(60,80,100);