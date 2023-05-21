[����9-1] 3byte ���� id �÷��� 20byte ���� fname �÷����� �̷���� tmp ���̺��� �����Ѵ�

create table tmp
(
id number(3),
fname varchar2(20)
);

[���� 9-4] �μ����̺� �����͸� �����Ͽ� dept1 ���̺��� �����Ѵ�.
create table dept1 AS
select * from departments;



[���� 9-5] ��� ���̺��� ���, �̸�, �Ի��� �÷��� �����͸� �����Ͽ� emp 20 ���̺��� �����Ѵ�
CREATE TABLE emp20 AS
SELECT  employee_id, first_name, hire_date
FROM    employees
WHERE   department_id = 20;

[���� 9-6] �μ����̺��� ������ ���� �����Ͽ� dept2 ���̺��� �����Ѵ�.

create table dept2 AS
select * from departments
where 1=2;

--�÷� �߰�

alter table ���̺��
add ( �÷���1 ������Ÿ��, �÷���2 ������Ÿ��, ...);

[���� 9-7] emp20 ���̺� ����Ÿ�� �޿� �÷��� ����Ÿ�� �����÷��� �߰��Ѵ�.

alter table emp20
add ( salary number, job_id varchar2(30));

select * from emp20;

-- ũ�⺯��
alter table ���̺��
modify (�÷���1 ������Ÿ��, �÷���2 ������Ÿ��, ...);

[���� 9-8] emp20 ���̺��� �޿� �÷��� �����ڵ� �÷��� ������ ����� �����Ѵ�.

alter table emp20
modify ( salary number(8,2), job_id varchar2(10));

desc emp20;

[����9-9] emp20 ���̺��� �����ڵ� �÷��� �����Ѵ�.
alter table emp20
drop column job_id;

select * from emp20;

[����9-10] emp20 ���̺��� �����Ѵ�
drop table emp20;

--truncate table�� ���̺� ������ ���ܵΰ� ��� �� �����͸� �����Ѵ�.
[����9-11]
truncate table dept1;

select * from dept1;