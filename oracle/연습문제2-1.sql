--1. ����� 200�� ����� �̸��� �μ���ȣ�� ��ȸ�ϴ� �������� �ۼ��Ѵ�
SELECT last_name||' '||first_name AS NAME , department_id
FROM employees
WHERE employee_id=200;


--2. �޿��� 3000���� 1500 ���̿� ���Ե��� �ʴ� ����� ���, �̸�, �޿� ������ ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--(��, �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���ļ� ��ȸ�Ѵ�. ���� ��� �̸��� John�̰�, ���� Seo�̸� John Seo �� ��ȸ�ǵ����Ѵ�.)

SELECT employee_id,first_name||' '||last_name AS NAME ,salary
FROM employees
WHERE NOT salary  BETWEEN 3000 AND 15000;

--3. �μ���ȣ 30�� 60�� �Ҽӵ� ����� ���, �̸�, �μ���ȣ, �޿��� ��ȸ�ϴµ�, �̸��� ���ĺ� ������ �����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.

SELECT employee_id,first_name,department_id,salary
FROM employees
WHERE department_id IN(30,60)
ORDER BY first_name;

--4. �޿��� 3000���� 15000 ���� �̸鼭 �μ���ȣ 30 �Ǵ� 60�� �Ҽӵ� ����� ���, �̸�, �޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
-- (��, ��ȸ�Ǵ� �÷����� �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���� name ����,
-- �޿��� Monthly Salary�� ��ȸ�ǵ����Ѵ�.

SELECT employee_id,first_name||' '||last_name AS NAME, salary AS "Monthly Salary",department_id
FROM employees
WHERE (salary BETWEEN 3000 AND 15000) AND (department_id = 30 OR department_id=60);

--5. �Ҽӵ� �μ���ȣ�� ���� ����� ���, �̸�, ���� ID�� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name, job_id
FROM employees
WHERE department_id IS NULL;

--6.Ŀ�̼��� �޴� ����� ���, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϴµ�, Ŀ�̼��� ���� ������� ���� ��� ������ ����
-- �Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.

SELECT employee_id,first_name,salary,commission_pct
FROM employees
WHERE commission_pct is NOT null
ORDER BY commission_pct DESC;

-- 7. �̸��� ���� z�� ���Ե� ����� ����� �̸��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.

SELECT employee_id,first_name||' '||last_name AS name
FROM employees
--WHERE ���� Alias(��Ī, ���) ��� : X
WHERE first_name||' '||last_name LIKE '%z%';

