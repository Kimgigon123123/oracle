
--HR ��Ű���� �ִ�
--1.�����Ͱ� ��� ���̺� ������ ��ȸ ���
-- DESC ���̺��;
-- DESCRIBE ���̺��;
-- describe ���̺��;
-- ��,�ҹ��� �������� ����
-- �ؿ��� ����â [+] ������ ���� ���! (������ Ȯ��)


desc departments;

-- ������ ���̺��� ��� ��ȸ�غ�����!


--2. �����͸� ��ȸ�ϴ� SELECT
-- SELECT * FROM ���̺��;
SELECT * FROM employees;
SELECT * FROM departments;

/* SELECT*
  FROM   ���̺��;
  */
  --�� ���� ���ӿ��� �� ���̺��� ����Ŭ���ϰ� , [������]Į���� Ŭ���ϸ� ���� ���!
  
  desc JOB_HISTORY;
  select *
  from EMPLOYEES;
  
  /*
  =================================
  HR ��Ű���� �ִ� ���̺� (=����Ŭ �����ͺ��̽� ��ü�� �ϳ�)
  ==============================================
  �̸�              ����
  ---------------------------------------------------
  COUNTRIES     ����/���� ����(����ID/�ڵ�, �̸�, ����ID/�ڵ�)
  Departments    �μ�����(�μ� �ڵ�, �μ� �̸�, ������ڵ�, ��ġ�ڵ�)
  EMPLOYEES       ��� ����(����ڵ�, �̸�, ��, �̸���, ��ȭ��ȣ, �Ի���, ���� �ڵ�, �޿�,Ŀ�̼���(�ۼ�Ʈ),����� �ڵ�,�μ��ڵ�)
  JOB_HISTORY       
  JOBS
  LOCATIONS
  REGIONS   
  */
  
  
  
  
  --2.1 ���̺� ����
  -- ����Ŭ (�����ͺ��̽� ���� �ý���)�� �����͸� 2���� ����(ǥ, table�� ��� ����)�� �⺻������ ����
  -- ���̺� : � ������ �ִµ� <---> �����ͺ��̽� : ����(Relation)
  -- ex> (ȸ��) �μ� ���� ���̺�, ��� ���� ���̺�
  /*
  ��� ���� ���̺�
  ��� �ڵ� ��� �̸�(��,�̸�) �μ�    �Ի���      �޿� ....
  ------------------------------------------------
  1        �浿 ȫ           IT     23-02-01    2000000
  1        �浿 ȫ           IT     23-02-01    2000000
  1        �浿 ȫ           IT     23-02-01    2000000
  1        �浿 ȫ           IT     23-02-01    2000000
  1        �浿 ȫ           IT     23-02-01    2000000
  
  �� ���� ���̺�
  �� �ڵ�       ����     ���       ����ó       �ٹ���
  1000           �̼���       ���    010.123.456     ����
  1000           �̼���       ���    010.123.456     ����
  1000           �̼���       ���    010.123.456     ����
  1000           �̼���       ���    010.123.456     ����
  */
  
  
  --�� Document : ��,�� ������ �ƴ� vs RDBMS : ���̺�(��,��)
  
  /*
  
  �� �� (COlumn) : ���� ���� [�� �̸�(=Ư��), ���� �ڷ���(����,����,��¥..),����]
  �̸�              ��?       ����          <------- ��(ROW), ���� ����         
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)    


  
  */
  
  
  --��ҹ��� ���� x 
  -- ����, TAB�� ����ؼ� ������ �ְ�!
  -- ������ ��(clause) ������ �ۼ�
  -- �ڵ��ϼ� ������! �ٵ�, ���� �����ۼ��� ����!
  
  
  
  --2.1 DESC / DESCRIBE : ���̺� ���� ==> �� �̸�, �ڷ��� (������ �� �ִ� ������) ���� Ȯ��
  --        SELECT : �����͸� ��ȸ ==> ���̺��� ���ڵ� (ROW �Ǵ� Tuple/Ʃ��)
  
  
SELECT *           -- SELECT��
FROM employees;  --FROM ��
--��� ������ �߰�..

-- 2.2 ������
-- �ʿ��� ������ ��ȸ�ϱ� ���� ����, ������ ���͸�!
SELECT �� �̸�1, ���̸�2, ���̸�3,...
FROM ���̺��;

-- *: �ֽ��͸���ũ, ALL (����÷�)
SELECT * 
FROM countries; -- 25rows

SELECT *
FROM departments; -- 27 rows

[���� 2-3] 80�� �μ��� ��������� ��ȸ ==> 80�� �μ��� �ٹ��ϴ� ������� ���͸�!
-- ctrl + enter or ������� +F5
SELECT *
FROM employees -- 108 rorws
WhERE department_id = 80; -- �� 107���� 80�� �μ��� �ٹ��ϴ� ����� 34��(rows)
-- ����Ŭ ������ : =(����),����x

--80�� �μ��� �μ��̸��� ��ȸ�Ͻÿ�!
SELECT *
FROM departments
where department_id = 80; -- sale �μ� : �Ǹ� �μ� --> �Ҽ��� ���� �ʿ��� �μ�

--Sales �μ�(80)�� ��ġ�� ��ġ������ ��ȸ�غ��ÿ�! (�����ּ�, �����ȣ,�����ڵ�)
-- LACATION_ID�� ã�Ƽ�, LOCATIONS ���̺� LOCATION_ID�� ��ġ�� ����

SELECT location_id "��ġ�ڵ�", department_id "�μ��ڵ�" -- ��Ī(Alias) : �÷��� �̸��� ���� ǥ��
FROM departments
--WHERE department_id=80; -- �μ��ڵ�� ���͸�
--WHERE department_name = 'Sales'; -- �μ��̸����� ���͸�

where department_name='Sales'; --���ڴ� '�� �ۼ�, ��/�ҹ��ڸ� ����[��¥ �����͵� '��]

-- ��ġ������ ã�ƺ���,
SELect city, street_address,postal_code
FROM locations
Where location_id=2500;


SELECT *
FROM job_history; -- 10rows

SELECT *
FROM jobs; -- 19rows

SELECT *
FROM locations; --22rows

SELECT *
FROM regions; -- 4rows

-- �̱��� � ȸ���� ���� : ȸ�翡 �ٹ��ϴ� ����� �߽����� �̵��� �Ҽӵ� �μ�, �ϴ� ����, ����(����/���)��
-- ����(����/���)���� ���� [�����Ը�, �н��� ������/���� ������ x]

/*
    WHERE �������� �����ϴ� �׸��� �з�(p.5)
    1) Į����, ����, ����/��¥
    2) ���(+,-,*,/), �񱳿�����(=,<=,<,>,>=) ����(!=,<>,^=)    
    3)AND, OR, NOT
    4)LIKE, IN, BETWEEN, EXISTS
    5) IS NULL, IS NOT NULL
    6)ANY, SOME, ALL
    7) �Լ�


--2.3������
--2.3.1 ��� ������: +,-,*,/
-- MOD(����,������) : % ��� ����ϴ� �Լ�
--��������ڴ� SELECT ��ϰ� �������� ����� �� �ֽ��ϴ�.


*/
SELECT 2+2 "��"
FROM dual; -- 4
-- ���� �������� �ʴ� ���̺� dual, �ܼ��� ��� �����̳� �ý��� ��¥ ����ϰų� �Լ��� ����, ��ȯ�� Ȯ��

SELECT 2-1 "��"
FROM dual;
--������ DB������ �⺻������ ����Ŭ ��ü��(=���̺�) �빮�ڷ� �ۼ��ϴµ�,
-- �ҹ��� ���̺������ �ۼ��Ϸ��� �����Ҷ� "�ҹ���"�� ����� ó��!
-- 0942. 00000 -  "table or view does not exist"


SELECT 2*4 AS ��
FROM dual;

--��� ���� AS: ���� ����������, SELECT���� ���������� ������ ���鿡�� AS�� �߰��ϴ� �����ڰ� ���ٶ�� ��谡 ����!!

SELECT 2*4 AS ��, 2-1 AS ��, 2/3 "��"
FROM dual;


--2) WHERE ������
SELECT employee_id, last_name, salary ,salary*12 AS ����, department_id
FROM employees
WHERE salary*12 > 100000;

[���� 2-4] 80�� �μ� ����� �� �ص��� ���� �޿並 ��ȸ�Ѵ�.
SELECT employee_id AS ��� ,last_name AS ��,salary*12 "����"
FROM employees
where department_id = 80; -- sales �μ�, 34rows

[���� 2-4] �� �� ���� ���� �޿��� 120000 ( $,USD ) �� ��������� ��ȸ�Ѵ�
-- NLS ������ " �ڵ����� ����Ŭ�� WON���� ���� �Ǿ� ����.
-- �ٸ�, hr ��Ű���� �����ʹ� ���� �����ͷ� �ڿ������� USD�� ������ �� ����.
SELECT employee_id AS ���, last_name AS ��, salary*12||'$' "����",department_id "�μ��ڵ�"
FROM employees
where salary*12 = 120000; -- ���������� ����� Į���� ������ , salary Į���� 12�� ���ؼ� ���������� ��ȸ,��

--2.3.2 ���� ������
--���ڿ� ���� ������ : ||
--���ڿ� ���� �Լ� : CONCAT()
-- ���� ������, ���� ������ : '�� ����

SELECT employee_id AS ���, last_name||first_name AS �̸�, salary*12||' '||'$' "����",department_id "�μ��ڵ�"
FROM employees
where salary*12 = 120000; 

[����2-6] ����� 101���� ����� ������ ��ȸ�Ѵ�
SELECT employee_id "���", last_name||' '||first_name  AS ����,salary*12 AS ����,job_id,department_id
FROM employees
WHERE employee_id=101;

-- 90�� �μ�
SELECT department_name
FROM departments
WHERE department_id = 90; -- �濵��

--�÷��� ��Ī(Alias) : �÷��� ��Ī, �� �ٿ� ����� �� �ִ�.
--1) �÷��� (����) ��Ī : ' '
--2) Ű���� AS �Ǵ� as ��� -- ������ ���鿡���� SELECT ���� ���������� AS�� �߰��ϴ� ���!
--3) ū ����ǥ�� ����� �� �ִ�.(�������)  , ��! �÷��� ������ ������ ���� �ݵ�� ū ����ǥ�� ������!

[���� 2-8] ����� 101���� ����� ���� ���� ���� ���� �޿��� ��ȸ�Ѵ�.
-- ��: name �̶�� ��Ī
-- ���� ���� ���� �޿� : ANNUAL SALARY ��� ��Ī

SELECT employee_id AS ���, last_name ��, salary*12 AS "ANNUAL SALARY"
FROM employees
WHERE employee_id=101;

--2.3.3 �� ������ (p.6)
-- ���� ũ�⸦ �� : =, >=, > , >, <=
[���� 2-9] �޿��� 3000������ ����������� ��ȸ�Ѵ�
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary<=3000;



[����2-10] �μ��ڵ尡 80�� �ʰ��� ����� ������ ��ȸ�Ѵ�.
-- �μ��ڵ� : department_id
-- ����ڵ� : employee_id
-- �����ڵ� : job_id
-- �μ����ڵ� : manager_id

SELECT *
FROM   employees
WHERE department_id>80; -- 90�� ���� ������ �μ��� ~ 11rows

--departments �����͸� Ȯ��!
SELECT *
FROM departments; -- 27 rows, 10~270 �μ��ڵ�


-- ���� ������, ��¥ �����ʹ� ���� ����ǥ(')�� ��� ǥ���ؾ� �մϴ�.
-- ���ڵ����ʹ� ��,�ҹ��ڸ� �����մϴ�.

SELECT *
FROM employees
WHERE last_name = 'Chen';

SELECT employee_id,last_name,hire_date
FROM employees
WHERE hire_date <'05/09/28'; -- ��/��/�� : ����, ���߿� �Ի��� ����� ����

[���� 2-11] ���� King�� ����� ������ ��ȸ�Ѵ�.

SELECT *
FROM employees
WHERE last_name='King';

[���� 2-12] �Ի����� 2004�� 1�� 1�� ������ ����� ������ ��ȸ�Ѵ�

SELECT department_id,employee_id,last_name,hire_date
FROM employees
WHERE hire_date < '04/01/01'