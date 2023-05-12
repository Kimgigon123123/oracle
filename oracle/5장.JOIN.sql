-- 5��. JOIN (����)
-- ����Ŭ ������ �����ͺ��̽��̴� ==> ����: ���̺�� ���̺��� �δ�!
-- (Relation,�����̼� - �����ͺ��̽� �����Ҷ� ���̺��� �����̼��̶�� ��)
-- JOIN ���� ���̺��� �����Ͽ� (HR: 7��, ����: n

--5.1 Cartesian Product (Decart�� �ٸ� ��, Cartesian)
--JOIN ������ ������� ���� �� �߸��� ����� �߻��ϴµ�, �̰� ī�׽þ� ��(=�ռ���)�̶�� ��.
-- ������ �ȳ�.

--SELECT �÷���1, �÷���2, ...
--FROM ���̺��1, ���̺��2, ...
--WHERE JOIN ����(=��)


[����5-1]��� ���̺�� �μ� ���̺��� �̿��� ����� ������ ��ȸ�ϰ��� �Ѵ�. ���,��, �μ� �̸���
��ȸ�϶�!

--���, �� : employees (��� ���� ���̺� : ���, �̸�, ����޿�, �Ի���, .. )
--�μ��̸� : departments (�μ� ���� ���̺� : �μ��ڵ�, �μ��̸�, �μ��� ��ġ�� ���� �ڵ�)
-- �ٸ� ���̺��� ���� ����� �ۼ�!! (������)
-- �� ���̺��� ���� �÷� : department_id (manager_id : �μ� ���̺��� �ĺ��� x)

SELECT employee_id, last_name, -- �ֵ� ����
        department_name
FROM employees ,departments ;


--������̺� ������/�� �� : 107
--�μ����̺� ������/�� �� : 27
--ī�׽þ� �� : 2889 rows ==> 107*27


desc employees;
desc departments;
----�̸�              ��?       ����           
----------------- -------- ------------ 
--DEPARTMENT_ID   NOT NULL NUMBER(4)    
--DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
--MANAGER_ID               NUMBER(6)    
--LOCATION_ID              NUMBER(4)   


--5.2 EQUI JOIN

 -- ���� ������ (=)�� ����� JOIN ����(=���� ����)
 -- ��ü ����� 107��, ��ȸ�� ��� 106�� <--> 1���� ����!!
 -- ������ ������ ����� �����ؼ� ����� �ݿ� ==> ����ε� ��� (��ü �������) ==> OUTER JOIN ó��!
 
 SELECT e.employee_id, e.last_name, -- �ֵ� ����
        d.department_name
FROM employees e,departments d
WHERE e.department_id=d.department_id;

[����5-4] (������̺�, �������̺��� �̿���) ���,�̸�,�����ڵ�,�������� ������ ��ȸ�Ѵ�.
DESC jobs;


SELECT e.employee_id,e.first_name||' '||e.last_name AS name,e.job_id,
        j.job_title
FROM employees e,jobs j
where e.job_id=j.job_id
order by 1;



[����5-5] ��� ���̺�,�μ����̺�,�������̺��� �̿��� ���,�̸�, �μ���, ���������� ��ȸ�Ѵ�.

SELEct e.employee_id,e.first_name||' '||e.last_name AS name,
d.department_name,
j.job_title
FROM employees e, departments d, jobs j
where e.department_id=d.department_id
AND e.job_id=j.job_id;

--where �������� join ���ǰ� �Ϲ� ������ �Բ� ����Ѵ�.
[����5-6] ����� 101���� ����� ���, �̸�, �μ���, �������� ������ ��ȸ�Ѵ�.

SELECT employee_id,last_name,
department_name,
job_title
from employees e,departments d,jobs j
where e.employee_id=101
and e.department_id = d.department_id
and e.job_id = j.job_id;



--5.3 NON-EQUI JOIN                      vs                     EQUI JOIN (����� INNER JOIN VS OUTER JOIN) 

--   NO~EQUI : �̿��� �����ȣ
--   �񱳿�����(>,>=,<,<=)
--   BETWEEN
--   IN

[����5-7] �޿��� ���� ������ ���� ���� �ִ� 10�� �μ����� ���, �̸�, �޿�, ���� ������ ��ȸ�Ѵ�.

select e.employee_id,e.first_name,e.salary,
j.job_title
from employees e, jobs j
where 
e.salary BETWEEN j.min_salary and j.max_salary
and department_id=10;





-- �޿��� �ְ�, ������ : ��,���� ����
-- ���� ������ ���� ??
-- ���� ==> ���� ���̺� (JOBS)
desc jobs;

--5.4 OUTER JOIN : EQUI JOIN �������� JOIN �ϴ� ���̺� �������� �����Ǵ� ����
-- ���� ����� ������� ��ȯ�Ѵ�. ������ ,outer������ �����Ǵ� ���� ���� ����� �������??
-- ��ȯ�Ѵ�.

--�� �����Ǵ� ���� ���� ���̺� �÷��� (+) ��ȣ�� ǥ���Ѵ�.

[����5-8] ��� ����� ���,�̸�,�޿�,�μ��ڵ�, �μ��� ������ ��ȸ�Ѵ�.
-- department_id�� NULL�� ��� 1���� ���� �����Ǵ� ��� : EQUI JOIN ����
-- ��� ���� : ���, �̸�, �޿�, �μ��ڵ� (employees)
-- �μ����� : �μ��� (departments)
SELECT e.employee_id AS empno,e.first_name AS ename, e.salary AS esal,
    d.department_name AS dname
from employees e , departments d
where e.department_id = d.department_id(+)
ORDER BY 1;


[����5-9] ��� ����� ���, �̸�, �޿�, �μ��ڵ�, ��ġ�ڵ�, �����̸� ������ ��ȸ�Ѵ�.
SELECT e.employee_id,e.first_name,e.salary,
d.department_name,
l.location_id,l.city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id=l.location_id(+)
order by 1;


--5.5 SELF JOIN : �ϳ��� ���̺��� �� �� ����Ͽ�, ������ ���̺� �ΰ��� ���� JOIN�� ����
-- �����͸� ��ȸ�� ����� ��ȯ�Ѵ�.
-- 1) ������ ���̺��� �ΰ��ΰ� �� ������? (���������� ����Ǵ� ���� ����)
-- 2) �� �� ��� �Ѵ� (�޸𸮻�-�ӵ� ������!- ���������� �ߺ��� ������ ���� ���� �ʰ�!! ���δٸ�,
-- ���̺��� �����ϴ� ��ó�� JOIN ����
-- �� ���̺� ���� : ��ȯ ���� (���,Recursive)

[���� 5-10] ����� ���, �̸�, �Ŵ����� ���, �Ŵ����� �̸� ������ ��ȸ�Ѵ�.
--����� ���� : employees [��� �÷�, �̸�]
-- �Ŵ����� ���� : manager?? [��� �÷�, �̸�]
SELECT e.employee_id ������,e.first_name ����̸�,
m.employee_id �Ŵ������ ,m.first_name �Ŵ����̸�
from employees e,employees m
where e.manager_id=m.employee_id
order by 1;
--5.6 ANSI JOIN / ANSI ��ȸ���� ���� ǥ�� JOIN �� (ORACLE �ܿ��� MYSQL, CUBRID, ��Ÿ RDBMS ���� JOIN)
--����Ŭ DBMS�� �ƴ� �ٸ� DBMS���� ��������� ����� �� �ִ� ǥ�� ����� JOIN ����
-- ��� DBMS���� .. RDBMS(Relational DBMS/������ DBMS)


--5.6.1 INNER JOIN <---> ����Ŭ JOIN���� INNER JOIN�� ���, EQUI-JOIN!
-- FROM���� INNER JOIN�� ����ϰ�, JOIN ���� (WHERE)�� ON ���� ����Ѵ�.

[����5-12] ����� ���, �̸�, �μ��ڵ�, �μ��� ������ ��ȸ�Ѵ�.
-- ����Ŭ JOIN

SELECT e.employee_id,e.first_name,e.department_id,
d.department_name
from employees e INNER JOIN departments d  --1) FROM ���� INNER JOIN�� ��� :, ���!
ON e.department_id = d.department_id --2) JOIN ������ ON ���� ǥ�� : where ��� ~ ON!
AND e.manager_id IS NOT NULL
ORDER BY 1; 


--ON�� ��� USING���� ����� �� �ִ�.
-- ��, USING�� ����Ҷ� �÷��� ����ؾ� �Ѵ� ==> ���̺��� ��Ī(Alias)�� ����!!
-- �� ���� �÷� �̸��� ��� ==> ���̺� ��Ī ����!!!!!!!!!

SELECT e.employee_id,e.first_name,department_id, --2) SELECT���� ���� �÷��� ���̺� ��Ī ����
d.department_name
from employees e INNER JOIN departments d  
USING (department_id) --1) ON ��� USING (�����÷���)
--AND e.manager_id IS NOT NULL
ORDER BY 1; 

--5.7 OUTER JOIN