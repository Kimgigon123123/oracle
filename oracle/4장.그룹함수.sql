--4��. �׷� �Լ�
--�׷����, �׷캰�� �����͸� ��ȸ
-- �μ��� �޿� �հ�, �޿� ��� ��ȸ�ϰ��� �Ҷ�/ �հ�,���,�ְ�,������ ������� ����� ���ϱ� ���� �Լ�

--4.1 DISTINCT
-- �ߺ��� ������ ����� ��ȯ�ϴ� �Լ�
--DISTINCT �÷���1, �÷���2, .... : ��� �÷��� (�ߺ�����) ����ȴ�.
-- NULL�� ���ŵ��� ����

[����4.1] ������� �Ҽӵ� �μ��� ����� ��ȸ�Ѵ�.
-- department ���̺� : 27�� �μ� (11�� �μ��� ����� �Ҽ�, ������ ??)

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT department_id, employee_id
FROM employees;

--�������� 4-1

SELECT distinct manager_id
FROM employees;

--4.2 COUNT() : ������ ���� ��� �����ϴ��� ������ ��� ��ȯ�ϴ� �Լ�
-- �����Ͱ� NULL �� ���� ���ܵȴ�.

[����4-3]
-- * : �ֽ��͸���ũ / ��� ��
-- �˻��ӵ��� ���̰� �ִٰ� �˷��� ����.
SELECT count(*), COUNT(employee_id),count(department_id),count(distinct department_id)
FROM employees;

--4.3 SUM() : ���� ������ �÷��� ��ü �հ踦 ����Ͽ� �� ����� ��ȯ�ϴ� �Լ�
SELECT TO_CHAR(SUM(salary),'L999,999') AS "�޿� ����",
        TO_CHAR(ROUND(SUM(salary) / COUNT(*),0),'9,999') AS "�޿� ���"
FROM employees;

--4.4 MAX() : ������ �÷����� ���� ū���� ��ȯ�ϴ� �Լ�, MIN() : ���� ���� ���� ��ȯ�ϴ� �Լ�
-- ��� ������ ������ ���! (���� ������ Į������ ����ϴ°� �ƴϴ�??)
SELECT MAX(salary) AS �ְ�޿�,
     MIN(salary) AS �����ݿ���
FROM employees;


[����4-6]
SELECT employee_id, first_name||' '||last_name AS name, job_id, salary
from employees
WHERE salary IN(24000,2100);

SELECT *
FROM job_history; --���/�����/�����/����(����)/�μ��ڵ�

SELECT *
from jobs; -- ����(����)/��������/�����޿�/�ְ�޿�


SELECT employee_id,first_name,MAX(hire_date),min(hire_date),max(commission_pct),min(commission_pct)
FROM employees
WHERE commission_pct IS NOT NULL;
--����

SELECT MAX(hire_date),MIN(hire_Date)
FROM employees;

--4.4 



--- ���ݱ��� �����ߴ� SQL ����

--SELECT
--FROM
--WHERE
----group by
--ORDER BY : ���� �������� �ۼ��Ѵ�

--4.3 GROUP BY �� (�׷��Լ�)
-- 1) Ư�� ������ ����Ͽ� ������ ���� �ϳ��� �׷����� ���� �� �ֵ�.
-- 2) �׷����� ������ �Ǵ� �÷��� �����Ѵ�.
-- �׷��Լ��� ����� �÷��� �Ϲ� �÷��� �Բ� SELECT���� �ۼ��� ���,
-- GROUP BY ���� �߰��ؼ� �׷����� ���� �÷��� ����ؾ� '����'�� �߻����� ����.
-- SELECT ��Ͽ� ���Ǵ� �׷� �Լ� �̿��� �÷��� �ݵ�� group by���� ����ؾ��Ѵ�!!!


[����4-8] �μ��� <--- (�μ��� ����) �޿� �Ѿ�, ��� �� ,��� �޿��� ��ȸ�Ѵ�.

SELECT department_id,SUM(salary) AS �޿��Ѿ�, count(*) AS �����, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
order by 1;

[����4-9]

SELECT department_id,job_id,SUM(salary) AS �޿��Ѿ�, count(*) AS �����, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id,job_id
order by 1;

SELECT department_id,TO_CHAR(SUM(salary),'999,999'),ROUND(AVG(salary)) AS ��ձ޿�
FROM employees
WHERE department_id=80
group by department_id;


-- HAVING
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING -- ���� ��ġ!! �׷���� ���� ��ġ!! (�׷��Լ� ������)
--ORDER BY -- �׻� ������!! 

[����4-11]
SELECT ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id = 80;

[����4-12]
SELECT department_id, COUNT(*)
from employees
WHERE department_id is NOT null
GROUP BY department_id
HAVING COUNT(*)<5;


--4.5 ROLLUP, CUBE
--4.5.1 ROLLUP : GROUP BY ���� ROLLUP �Լ��� ����� GROUP BY ������ ����� �Բ�,
--                  �ܰ躰 �Ұ�, �Ѱ�

[����4-13] �μ��� ������� �޿��հ�, �޿��Ѱ踦 ��ȸ�Ѵ�.

SELECT department_id,COunt(*),SUM(salary)
FROM employees
GROUP BY ROLLUP(department_id)
ORDER BY department_id;

SELECT department_id,COunt(*),SUM(salary)
FROM employees
GROUP BY CUBE(department_id)
ORDER BY department_id;

SELECT department_id,job_id,Count(*),SUM(salary)
FROM employees
GROUP BY ROLLUP(department_id,job_id)
ORDER BY department_id;

SELECT department_id,job_id,Count(*),SUM(salary)
FROM employees
GROUP BY cube(department_id,job_id)
ORDER BY department_id;

