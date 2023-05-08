
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
WHERE hire_date < '04/01/01';


--2.3.4 ������ ������ (p.8)
-- ������ ������ �������� �� �� �ִ�.
-- ���� ������ ���� ��� ������ ���ǵ��� AND, OR �����ڸ� �̿��� �����Ѵ�.

--NOT + BETWEEN ������, IN ������, LIKE ������

[���� 2-13] 30�� �μ� ��� �� �޿��� 10000 ������ ����� ������ ��ȸ
-- ����� ������ : EMPLOYEES ���̺�
-- EMPLOYEE_ID ~ DEPARTMENT_ID : ���� ����ǵ��� ������ � Ư�� �÷����� ����
-- �μ������� DEARTMENTS�� ������, ������� �μ� 10~110������ �ҼӵǾ� ����

SELECT employee_id, first_name||''||last_name AS �̸�,salary,department_id
FROM employees
WHERE department_id=30 
AND salary<=10000;

[����2-14] 30�� �μ� ��� �� �޿��� 10000 �����̸鼭 �Ի����ڰ� 2005�� ������ �Ի��� ����� ������ ��ȸ
SELECT employee_id, first_name||''||last_name AS �̸�,salary,department_id
FROM employees
WHERE department_id=30 
AND salary<=10000
--AND hire_date < '2005/01/01' ;
AND hire_date < '2005-01-01'; -- '01-JAN-05' : 1�� - 1�� - 2005�⵵ 

-- NLS: National Language Support (���ƽþ�-�ѱ�/�߱�/�Ϻ�) RR/MM/DD 
-- DATE : ��¥, ǥ���Ҷ� YY(Year) vs RR(50 �̻��� 1900���, 50�̸��� 2000��� ǥ���)

[���� 2-15] 30�� �μ��� 60�� �μ��� ���� ����� ������ ��ȸ�Ͻÿ�

SELECT employee_id,first_name||''||last_name name,hire_date,salary,phone_number,email,department_id
FROM employees
WHERE department_id = 30
OR department_id=60;



--AND, OR ������ ȥ�յǾ� ���Ǵ� ��� �������� ���� ��ȣ�� �ٿ��ִ� ���� ����

--2.3.5 ������ ������ (p.9)
--���� ���� ������ BETWEEN  �ʱⰪ (�̻�) AND ��������(����);
[����2-18] ����� 110�� ���� 120�� ������ ��� ������ ��ȸ�Ͻÿ�
--100������ 206����� �� 107�� �ٹ��ϴ� ȸ���� ������� ���̺�
SELECT *
FROM employees
WHERE employee_id >=110
OR employee_id <=120;


SELECT employee_id, first_name||' '||last_name AS �̸�,salary,department_id
FROM employees
WHERE employee_id BETWEEN 110 AND 120;


--(p.10 �ϴ�) NOT �����ڿ� BETWEEN �����ڸ� ����Ͽ� BETWEEN �ʱⰪ AND �������� �� �ݴ�Ǵ� ������ �����

-- ����� 110~120�� ������ ������ ��������� ��ȸ�Ѵ�.

SELECT employee_id, first_name||' '||last_name AS �̸�,salary,department_id
FROM employees
WHERE NOT employee_id BETWEEN 110 AND 120; -- NOT + �÷���

SELECT employee_id, first_name||' '||last_name AS �̸�,salary,department_id
FROM employees
WHERE employee_id NOT BETWEEN 110 AND 120; -- NOT + NETWEEN ~

-- �� ��� ��� ���� ����� ��ȸ�ȴ�.
-- BETWEEN�̳� ���� �����ڷ� ���� �� �ִ� ���� 1) ���� ������ 2) ���� ������ 3) ��¥ ������ �̴�.
-- 11g ���������� NLS ������ ��� ������ �ȵ�����, 21c ������ RR / MM / DD ������ ���� ��ȸ�Ͽ���
-- ������ �߻����� �ʴ´�.
--ORA-01858: ���ڰ� �־�� �ϴ� ��ġ���� ���ڰ� �ƴ� ���ڰ� �߰ߵǾ����ϴ�. ��� ������ ������ ��¥ ����!
--���� �ʾƼ� ==> 1) ��Դ� ��ȯ�Լ� ��� �ؼ� ó���ϰų� ~ 2) NLS ������ Ȯ���ϰ� RR/MM/DD�� ��ȸ�ϰų�
-- ���� > ȯ�漳�� > �����ͺ��̽� > NLS Ȯ��
-- NLS ���� Ȯ�� ��� ~
SELECT *
FROM v$nls_parameters;


-- ��¥ �������� ��ȯ�ϴ� �Լ� : TO_DATE('��¥������')
--RR/MM/DD �Ǵ� TO_DATE('��¥������','�������� YY-MM-DD HH:MI:SS')
--3��. �Լ� - ��ȯ�Լ� ��Ʈ(p.27)


--2.3.7 IN ���ǿ�����(p.11)
--OR ������ ��� IN������ ==> ������, ���Ἲ
[����2-25] 30�� �μ��� �Ǵ� 60�� �μ��� �Ǵ� 90�� �μ����� ������ ��ȸ�Ѵ�.
SELECT employee_id AS emp_id, first_name||' '||last_name name, salary,department_id AS dept_id
FROM employees
WHERE department_id IN(30,60,90);

--NOT �÷� IN (��1,��2,��3...)
SELECT employee_id AS emp_id, first_name||' '||last_name name, salary,department_id AS dept_id
FROM employees
WHERE NOT department_id IN(30,60,90);

--�÷� NOT IN (��1,��2,��3...)
SELECT employee_id AS emp_id, first_name||' '||last_name name, salary,department_id AS dept_id
FROM employees
WHERE department_id NOT IN(30,60,90);

SELECT employee_id AS emp_id, first_name||' '||last_name name, salary,department_id AS dept_id
FROM employees; --107rows... 14(30,60,90 �μ�) + 92(������ �μ�)=106... 1����?? NULL

--2.3.8 LIKE ������ (p.11)
-- Į������ Ư�� ���Ͽ� ���ϴ� ���� ��ȸ�Ҷ� ����ϴ� ���ڿ� ���� ������
--1) % : �������� ���ڿ��� ��Ÿ����.
--2) _ : �ϳ��� ���ڿ��� ��Ÿ����.


[����2-28] �̸��� K�� ���۵Ǵ� ��� ������ ��ȸ�Ѵ�.
--���ڵ����ʹ� ��,�ҹ��ڸ� ���� vs SQL�� ��,�ҹ��ڸ� ���о���
--��) 'k' �� 'K'�� �ٸ�...
--last_name: ��
--first_name: �̸�
SELECT *
FROM employees
WHERE first_name LIKE 'K%';

[����2-29] ���� s�� ������ ��� ������ ��ȸ�Ѵ�.
SELECT *
FROM employees
WHERE last_name LIKE '%s';
[����2-30] �̸��� b�� ���ִ� ��� ������ ��ȸ�Ѵ�.
SELECT *
FROM employees
WHERE first_name LIKE '%b%';

desc employees;
-- ===================== ���־��� ����Ŭ �ڷ��� ================================
-- VARCHAR2(����) : National + VarCHAR2(10) vs VARCHAR2(10) : (�ѱ�) 30byte vs (�̱�) 10byte
-- VARCHAR(����) : �Ϲ����� �������� ������� �ʰ�, ����Ŭ���� ����� ������ Ÿ�� ==> �츮�� ���x
-- NUMBER(����) : ���� ������
-- NUMBER(�ѱ���,�Ҽ������ϱ���):�Ǽ� ������
--DATE : ��¥ ������
-- �� INT �ڷ������� �÷��� �����ϸ� ==> ����Ŭ ���������� NUMBER�� �����ع���..
-- STRING �ڷ������� �÷��� �����ϸ� ==>      "           NUMBER2�� �����ع���..
--������, ���̳ʸ�(=�̹���,�����,����)==> BLOB, CLOB, BFILE Ÿ�� 


[���� 2-31] �̸����� ����° ���ڰ� B�� ��������� ��ȸ�Ѵ�
-- % : ��������
-- _ : �ϳ��� ����
SELECT *
FROM employees
WHERE email LIKE '__B%';

[���� 2-32] �̸����� �ڿ������� ����° ���ڰ� B�� ��������� ��ȸ�Ѵ�.
SELECT *
FROM employees
WHERE email LIKE '%B__';

--LIKE ���� IN, BETWEEN ó���� AND ������ �� �� ���� NOT �����ڿ� �Բ� ����� �� �ִ�.(p.14)
[����2-33] ��ȭ��ȣ�� 6���� ���۵��� �ʴ� ����� ������ ��ȸ�Ѵ�.
SELECT *
FROM employees
WHERE Phone_Number NOT LIKE '6%';

--========================================
--Q. %�� _ ��ü�� ���ڿ��� ��ȸ�ϰ��� �Ѵٸ�?
--========================================
SELECT *
FROM employees
WHERE JOB_ID LIKE '%_A%';

--ESCAPE �ĺ��ڸ� ����� %�� _ ��ü�� �ϳ��� ���ڷ� �˻��ϰ� �Ѵ�.

SELECT *
FROM employees
WHERE JOB_ID LIKE '%\_A%' escape '\';

--2.3.9 NULL ���� ó��
-- NULL : �� �� ---> ''  / �����Ͱ� �Էµ��� ����.
SELECT *
FROM locations; 

SELECT *
FROM locations
WHERE state_province IS NULL;

SELECT *
FROM locations
WHERE state_province IS NOT NULL;

-- IS NULL : NULL�� �����͸� ��ȸ
-- IS NOT NULL : NULL�� �ƴ� �����͸� ��ȸ

--================LOCATIONS (�μ� ��ġ ���� ���̺�)===================
-- POSTAL_CODE : �����ȣ
--STATE_PROVINCE : �������� (~��)


SELECT employee_id, last_name, salary, department_id, job_id,hire_date
FROM employees
WHERE commission_pct IS NULL; -- �ŷ� �����Ḧ ���� �ʴ� ���?? 72��... �� 107�� �� 35���� �޴� ���!


SELECT employee_id, last_name, salary, department_id, job_id,hire_date
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT *
FROM departments
WHERE department_id = 80;

-- commission_pct : (�ŷ��� ����) ��������, 
--manager_id(�Ŵ���,������), department_id(�μ��ڵ�)

SELECT *
FROM jobs
WHERE job_id IN ('SA_MAN','SA_REP')

--80�� �μ� Sale ��Ʈ ==> �Ǹźμ��ϱ� �ŷ� ������ (=���� �ȸ�, ���� ����� ����)
--commission_pct�� NOT NULL �� ����!  �⺻�� ���� , �����Ḧ å���ؼ� �����ϴ� ����?
--      "             NULL �� ����? �Ǹźμ��� �ƴ�, �⺻ �޿��� ���ų�..
-- �ٵ� , 1���� �μ��� ������ commission_pct �� NOT NULL�� ��� (178 Kimberely Grant)