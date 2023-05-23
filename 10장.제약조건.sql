-- 10��. ��������

-- ���Ἲ �������� (Integrity Constraints): �������� ��Ȯ���� �����ϱ� ���� �δ� ����/���� ����
-- 1) ���̺� ������ ���� : CREATE TABLE ~
-- 2) ���̺� ���� �� �߰� : ALTER TABLE ~

--10.1 NOT NULL �������� - NULL ������� ����
-- �÷� ������ ���� �־� NULL ������� ����
-- �� ���̺� ������ �÷� �������� �����Ѵ�
-- ex> ���̺� ���� ����



--10.2 CHECK �������� - ���� ����/������ (p.80)
--���ǿ� �´� �����͸� ������ �� �ֵ��� �ϴ� ���������̴�.
--�÷� ����, ���̺� �������� �����Ѵ�.
--�÷� ����
--���̺� ����
[����10-6]
CREATE TABLE check_test (
    name varchar2(10) not null, -- �÷� ����
    gender varchar(10) not null check (gender in ('����','����')),
    salary number(8),
    dept_id number(4),
    constraint check_test_salary_ck check (salary > 2000) -- ���̺� ���� (���̺� ��������)
);

select *
from user_constraints
where table_name = 'CHECK_TEST';

[����10-7] �����͸� check_test ���̺� �����غ��ÿ�.
insert into check_test 
values('ȫ�浿','����',3000,10);

select *
from check_test;

[����10-8]
insert into check_test
values('��û','����',3000,20); -- ���� vs ����

[����10-9]
update check_test
set salary=1000
where name = 'ȫ�浿'; --ORA-02290: üũ ��������(HANUL.CHECK_TEST_SALARY_CK)�� ����Ǿ����ϴ�

[����10-10]
-- DDL : CREATE, ALTER, DROP
--        ����,   ����,   ����
-- check_test�� �ɸ� ���������� Ȯ���ϰ�, �׷� ���� �����ߴٰ� �ٽ� �߰��ϴ� ����

--�̰� ����
alter table check_test
drop constraint �������Ǹ�;

alter table check_test
drop constraint check_test_salary_ck;

[����10-11]
--�ٽ� �߰��ϱ�!
ALTER TABLE check_test
ADD CONSTRAINT check_salary_dept_pk check ( salary between 2000 and 10000 and dept_id in(10,20,30));

select *
from check_test;

[����10-12]
update check_test
set salary = 12000
where name = 'ȫ�浿';

update check_test
set dept_id = 40
where name = 'ȫ�浿';

--10.3 UNIQUE �������� - �ߺ����� (NULL ���)
-- �����Ͱ� �ߺ����� �ʵ��� ���ϼ��� �����ϴ� ��������
-- �÷� ����, ���̺� �������� ����
-- ����Ű(Composite Key)�� ������ �� �ִ�. ��)���� ��� vs ���+�̸�
-- primary key = unique + not null
-- ���̺� ������ UNIQUE ����
--I.�÷����� ����
CREATE TABLE unique_test(
    col1 varchar2(5) unique not null,
    col2 varchar2(5),
    col3 varchar2(5) not null,
    col4 varchar2(5) not null,
    constraint uni_col2_uk unique (col2),
    constraint uni_col34_uk unique (col3,col4) -- ����Ű : �� �̻��� �÷��� ���� ==> ���+��ȭ��ȣ, ���+�̸�
);

[����10-14] �ߺ����� �����ϴ��� �Է� �׽�Ʈ
insert into unique_test (col1,col2,col3,col4)
values ('A1','B1','C1','D1');

select *
from unique_test;

insert into unique_test
values('A2','B2','C2','D2');

[����10-15]
Update unique_test
set col1='A1'
where col1='A2';

desc unique_test;

[����10-16] ������ �Է� �׽�Ʈ --> �ߺ��� Ȯ��
insert into unique_test
values ('A3','','C3','D3');-- col2 : null ������.

insert into unique_test
values ('A4',null,'C4','D4');
--II.���̺� ���� ����
-- ���̺� ���� �� unique �߰�/���� : ������ �ۼ��� unique ���� --> �߰�

select constraint_name,constraint_type
from user_constraints
where table_name='UNIQUE_TEST';

[����10-18] UNI_COL34_UK ���������� �����ϰ� col2,col3,col4�� UNIQUE ����Ű�� �����ϴ� !
ALTER TABLE unique_test
drop constraint uni_col34_uk;

[����10-19] uni_col234_uk ���������� �߰�
ALTER TABLE unique_test
add constraint uni_col234_uk unique(col2,col3,col4);

select *
from unique_test;

[����10-20]
insert into unique_test
values ('A7',null,'C4','D4'); --C4,D4 �ߺ��̶� ������


--10.4 Primary key �������� - UNIQUE + NOT NULL
-- ������ �� (ROW)�� ��ǥ�ϵ��� �����ϰ� �ĺ��ϱ� ���� ��������
-- UNIQUE + NOT NULL�� ����
-- �⺻Ű, �ĺ���, �� Ű, PK �� �Ѵ�.
-- �÷�����, ���̺��� ���� ���� �ں���Ű�ڸ� ���� �� �� �ִ�.
-- ��) ��� - �ֹι�ȣ (= ����Ű), ȸ��� - �����ȣ

-- I.�÷����� ����
�÷��� ������ Ÿ�� PRIMARY KEY : ��� --> SYS_C008XXX
�÷��� ������ Ÿ�� CONSTRAINT �������Ǹ� PRIMARY KEY --> ���̺��_�÷���_�������Ǿ��

-- II.���̺��� ����
CREATE TABLE member(
    id number(5) PRIMARY KEY,
    name,
    email,
    phone,
    constraint member_id_pk primary key (id)
);

[����10-21]dept_test ���̺��� �����ϰ� dept_id,dept_name �÷� ���� ���� 4����Ʈ, �������� 30����Ʈ�� ������
�����ϵ� dept_name�� null�� ������� �ʰ�, dept_id�� �⺻Ű�� �����ϴ� ������ �ۼ��Ͻÿ�

CREATE TABLE dept_test(
    dept_id number(4),
    dept_name varchar2(30) not null,
    CONSTRAINT dept_test_dept_id_pk primary key (dept_id)
    );
    
[����10-22] �μ��ڵ�10, �μ����� �������� �μ� �����͸� �Է��Ͻÿ�
INSERT INTO dept_test (dept_id,dept_name)
values (10,'������');

select *
from dept_test;

insert into dept_test
values(10,'���ߺ�'); -- ����

insert into dept_test
values(20,'�ѹ���');


--10.5 FOREIGN KEY �������� - �ܷ�Ű
--�θ� ���̺��� �÷��� �����ϴ� �ڽ� ���̺��� �÷���, �������� ���Ἲ�� �����ϱ� ���� �����ϴ� ��������
-- NULL ��� <--> UNIQUE : �ߺ�����, NULL ���
-- ����Ű, �ܷ�Ű, FK
-- �÷�����, ���̺� �������� ����, ����Ű�� ������ �� �ִ�.
-- �÷�����
-- �÷��� ������ Ÿ�� REFERENCES �θ����̺� (�����Ǵ� �÷���)
-- �÷��� ������ Ÿ�� CONSTRAINT �������Ǹ� REFERNECES �θ����̺� (�����Ǵ� �÷�)

-- ���̺������� ����
-- CONSTRAINT ���̺��_�������Ǹ�_�������Ǿ�� FOREIGN KEY (�����ϴ� �÷���) REFERENCES �θ����̺� (���� �Ǵ� �÷���)
-- ���̺�� ���̺� ���迡 ����, ...
-- ��� ���� ���̺� <---> �μ� ���� ���̺�
-- ����� �μ��� �Ҽӵȴ�(=����) N:1
-- �μ��� ����� �����Ѵ�(=���� 1:N
-- HR ��Ű�� ==> ���� �Ը��� �����ͺ��̽� ==> ���ʿ� ����� ���̺� ����

-- ������� ===> employees (���̺�)
-- ���(PK),�̸�,�޿�,�̸���,�μ��ڵ�(FK) ==> first_name,employee_id,salary,email (�÷�)

-- �μ����� ===> departments (���̺�)
-- �μ��ڵ�, �μ���, ��ġ�ڵ� (�÷�)

--NOT NULL �� �÷��� �����Ͱ��� �־� NULL �� ������� �ʴ� ���������̴�.


-- ���θ� ���� : ���ι� ���� �ľ� (��-��ǰ �ֹ�,����, ȸ��-��ǰ ����, �߼�..)
-- ���伳�� : ���� ���� �߿� Ű���带 ���� ==> ����Ƽ(=���̺�), �÷�(=Ư��) ...
-- ������ : Entity Relational Diagram (ERD) ==> �׸����� ��ü, Ư��, ���踦 ǥ���ϴ� ����
-- �������� : CREATE TABLE ~ ALTER TABLE ~ INSERT INTO ~

-- (��� - �μ�) I.���伳��
-- �� ������ ��� ���̺� : CUSTOMERS (��ID,����,����ó...)
-- ��ǰ ������ ��� ���̺� : ITEMS (��ǰID,��ǰ��,����)

--II.������

--III.�������� : SQL

CREATE TABLE customers (
    id NUMBER(4),
    name VARCHAR2(20) NOT NULL,
    phone varchar(11),
    CONSTRAINT customers_id_pk primary key (id)
    
);

[����10-26] 
create table emp_test(
    emp_id number(4) primary key,
    ename varchar2(30) NOT NULL,
    dept_id number(4),
    job_id varchar2(10),
    constraint emp_test_dept_fk Foreign KEY (dept_id) references dept_test (dept_id)
    
);

select *
from emp_test;

select *
from dept_test;

[����10-27]
insert into emp_test(emp_id,ename,dept_id,job_id)
values (100,'King',10,'ST_MAN');

select *
from emp_test;

-- ���̺� ���� �� FK �߰�����
-- �ϴ� ���� ������ ==> ���� ���� �̸��� ����

SELECT constraint_name, constraint_type
from user_constraints
where table_name ='EMP_TEST';

--EMP_TEST_DEPT_ID_FK �� ����
ALTER TABLE emp_test
DROP CONSTRAINT emp_test_dept_fk;

-- �ٽ� ���� : ���� ������~ �����ϰ� (�����)
ALTER TABLE emp_test
ADD CONSTRAINT emp_test_dept_fk foreign key (dept_id) references dept_test (dept_id);


--default
--�÷� ������ �����Ǵ� �Ӽ�, �����͸� �Է����� �ʾƵ� ������ ���� �⺻ �Էµǵ����Ѵ�.
-- ���������� �ƴ�����, �÷� �������� �ۼ��Ѵ�.

[����10-30]
CREATE TABLE default_test(
    name varchar2(10) NOT NULL,
    hire_date DATE DEFAULT SYSDATE NOT NULL,
    salary number(8) default 2500
);

insert into default_test(name,hire_date,salary)
values('ȫ�浿',to_date('2023-05-22','YYYY-MM-DD'),3000);

select *
from default_test;

insert into default_test(name)
values('��浿');

select *
from default_test;

commit;

[����10-1]
CREATE TABLE null_test(
 col1 varchar2(5) NOT NULL,
 col2 varchar2(5)
 );
 
 [����10-2]
 INSERT INTO null_test(col1)
 values('AA');
 
 select *
 from null_test;
 
 [����10-3]
UPDATE  null_test
SET col2 = 'BB'
where col1='AA';

[����10-4]
ALTER TABLE null_test
MODIFY ( col2 NOT NULL ); -- null_test ���̺��� 2�� �÷��� not null ���������� �߰�!

[����10-5]
ALTER TABLE null_test
MODIFY ( col2 ); -- null_test ���̺� 2�� �÷��� NULL ������������ �ٽ� ����

-- CHECK �� ���ǿ� �´� �����͸� ����� �� �ֵ��� �ϴ� ���������̴�.
[����10-6]


