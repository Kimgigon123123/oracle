[��������3-3]

--1.
SELECT employee_id,first_name,salary,trunc(months_between(SYSDATE,hire_date)) AS "�ٹ�������"
FROM employees
WHERE department_id=30;

--2.
SELECT employee_id,first_name,TO_CHAR(salary,'9,999,999') AS salary
from employees
WHERE salary >= 12000
ORDER BY salary DESC;

--3.
SELECT employee_id,first_name,hire_date,TO_CHAR(hire_date,'DAY') AS "���� ���� ����"
--DAY -> �ݿ���, DY -> ��
FROM employees
WHERE hire_date < '2005-01-01'
ORDER BY hire_date desc;