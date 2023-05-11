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


--5.3 NON-EQUI JOIN

--5.4 OUTER JOIN

--5.5 SELF JOIN

--5.6 ANSI JOIN / ANSI ��ȸ���� ���� ǥ�� JOIN �� (ORACLE �ܿ��� MYSQL, CUBRID, ��Ÿ RDBMS ���� JOIN)


--5.7 OUTER JOIN