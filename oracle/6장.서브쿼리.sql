--6��. �������� (p.51)

--================��������������==============
--6.1 ���� �� ��������
--6.2 ���� �� ��������
--6.3 ���� �÷� ��������
--6.4 ��ȣ���� ��������
--6.5 ��Į�� ��������
--6.6 �ζ��� �� ��������
--===========================================
[���� 6-1] ��ձ޿����� �� ���� �޿��� �޴� ����� ������ ��ȸ�Ѵ�.
select employee_id, first_name, salary
from employees
where salary < (select avg(salary) from employees);

[����6-2] ���޿��� ���� ���� ����� ���, �̸�,�� ������ ��ȸ�Ѵ�

select employee_id, first_name, salary
from employees
where salary=(select max(salary) from employees);

[����6-3] ��� 108�� ����� �޿����� ������ �޿��� �޴� ����� ���, �̸�, �޿��� ��ȸ�Ѵ�.

select employee_id, first_name, salary
from employees
where salary > (select salary from employees where employee_id=108);

[���� 6-4] ���޿��� ���� ���� ����� ���, �̸�, ��, �������� ������ ��ȸ�Ѵ�.

select e.employee_id,e.first_name,
j.job_title
from employees e,jobs j
where e.job_id = j.job_id
and salary = (select max(salary) from employees);


--6.2 ���� �� �������� (p.53)
--���� �� ������ (IN,NOT,ANY(=SOME),ALL,EXISTS)
--6.2.1 IN ������ 
-- OR ������ ��� --> ����
--6.2.1 NOT ������

--6.2.1 ANY ������
--�������� ����� �� ��� �ϳ��� �����Ǵ��� ���� ��ȯ�Ѵ�.
-- = �� ����Ҷ�

--6.2.1 ALL ������
--6.2.1 EXISTS ������

[����6-5] �ٹ���(��ġ�ڵ�)�� ����(UK)�� �μ��ڵ�, ��ġ�ڵ�, �μ��� ������ ��ȸ�Ѵ�.

select location_id
from locations
where country_id='UK';
--���� ���� ������ ������ ������ �������� �Ұ�!

SELECT d.department_id, d.location_id, d.department_name
from departments d
where d.location_id IN (select location_id from locations where country_id='UK');

[����6-6] 70�� �μ����� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� �޿������� ��ȸ�Ѵ�.

SELECT employee_id,first_name,department_id,salary
from employees
where salary >   (select salary from employees where department_id=70)
order by salary;

SELECT employee_id,first_name,department_id,salary
from employees
where salary >  any (select salary from employees where department_id=80)-- 80���μ� �޿����� ������ �ϳ��� ������
order by salary;

--���� ����ϴ� ������ �������� ������ / �����ȣ
--= any : ��ġ�ϴ°� �ϳ��� ������ true ��� ( �������� ���� ����� �������� ��ȯ �Ҷ�)   on ������/ in ������
--> any : (�������� ���࿡ ���� ��ȯ����� ���������) > �ּҰ�(min�Լ�) �� ����.     vs        >min
--< any : (�������� ���࿡ ���� ��ȯ����� ���������) < �ּҰ�(max�Լ�) �� ����.     vs        <max
--= all : (�������� ���࿡ ���� ��ȯ����� ���������) = ��� ����� ���ؼ� true���� �ϴ� ���� == > ����� �ȳ����� ���
--> all : (�������� ���࿡ ���� ��ȯ����� ���������) > �ִ밪(max�Լ�) �� ����.
--< all : (�������� ���࿡ ���� ��ȯ����� ���������) < �ִ밪(min�Լ�)

[����6-8] 10�� �μ����� �޿����� ���� �޿��� �޴� ����� ��� �̸� �μ���ȣ �޿��� �޿������� ��ȸ�Ѵ�.

select employee_id, last_name, department_id, salary
from employees
where salary < (select salary from employees where department_id=10)
order by salary;

[����6-10] 100�� �μ��� ����� �޿����� ���� �޿��� �޴� ����� ��� �̸� �μ���ȣ �޿��� �޿� ������������ ��ȸ�Ѵ�

-- �׷��ռ� : count(*) or count(�÷���) or count(distnct �÷���)
-- 100�� �μ��� ��ȸ --> �׷캰 ����� �� ����
-- count() : NULL ����
select department_id, count(*) AS cnt
from employees
group by department_id
order by 1;

select employee_id,first_name,salary,department_id
from employees
where department_id = 100
order by 3; -- 6900,7700,7800,9000,12008

select employee_id, first_name, department_id,salary
from employees
where salary > ALL (select salary from employees where department_id=100)
order by salary;

[����6-14] 20�� �μ����� �޿��� ���� �޿��� �޴� ����� ���,�̸�,�μ���ȣ,�޿��� �μ��ڵ� ��, �޿������� ��ȸ�Ѵ�.

SELECT employee_id, first_name, department_id,salary
from employees
where salary in (select salary from employees where department_id=20)
order by department_id,salary;

[����6-16] �μ����̺��� �μ��ڵ尡 10,20,30,40�� �ش����� �ʴ� �μ��ڵ带 ��ȸ�Ѵ�.
-- NOT IN �����ڿ� <> ALL�� ������ ���


select department_id,department_name
from departments
where department_id not in (10,20,30,40); -- 23rows

select department_id,department_name
from departments
where department_id <> any (10,20,30,40); -- 27rows ==> 10�� ��, 20~270/ 20�� ��, 10,30~270

--6.2.5 (���� ��,���� ��) ���� �÷� �������� (p.57)
--���������� ��������ó�� �������� �÷��� ��� �� �� �ִ�.

[����6-18] �Ŵ����� ���� ����� �Ŵ����� �ִ� �μ��ڵ�, �μ����� ��ȸ�մϴ�.

select department_id,department_name
from departments 
where (department_id,manager_id) in (select department_id,employee_id from employees where manager_id is null);

-- �����÷� �������� ==> �ѹ��� �ΰ��̻��� �÷��� ���ϴ� ��������

--6.3 exists ������ (��ȣ���������������� ���)
-- ��ȣ ���� ��������(p.57)
-- ��ȣ : ����~ / ���� : ���� ~ ���� == > join ���� vs set ����
-- ���������ε�, join������ Ȱ���� ��������!
-- ���������� �÷��� ���������� �������� ���Ǿ� ���������� ���������� ���� ����

[����6-19] �Ŵ����� �ִ� �μ��ڵ忡 �Ҽӵ� ������� ���� ��ȸ�Ѵ�.
select count(employee_id)
from employees
where manager_id is not null;

select count(*) AS �����
from employees
where department_id in (select department_id
                        from employees
                        where manager_id is not null);
                        
select count(*) AS �����
from employees e
where department_id in (select department_id
                        from departments d
                        where manager_id is not null
                        AND e.department_id = d.department_id
                        );
                        
                        
-- in �����ڸ� exists �����ڷ� �ٲ� ����� �� �ִ�.
select count(*) AS �����
from employees e
where department_id exists (select department_id
                        from departments d
                        where manager_id is not null
                        AND e.department_id = d.department_id
                        );
--ORA-00920: ���� �����ڰ� �������մϴ� : IN ��� exists�� ����Ҷ��� where���� �� �÷��� ����� ��.
select count(*) AS �����
from employees e
where exists (select department_id
                        from departments d
                        where manager_id is not null
                        AND e.department_id = d.department_id
                        );
-- EXISTS �����ڴ� ���������� ����� ���� ���θ� �Ǵ��Ѵ� ==>
-- EXISTS �����ڸ� ����Ҷ�, ���������� select ��ϰ��� ������ ���� ���� �÷����� join ������ �ٽ��̴�.
-- �����÷� ������������ �з��� �� �� �ִ� -->������ �� �� �ִ�. --> �� ���� ����� �� �ִ�??
-- ��ȣ���� ���������� �������� �������� ���������� ���� ==> �ӵ�����

--====================
--1) �������� ����࿡ ���� ���� : ���� ��, ������, �����÷�
--2) �������� ���� ���� (=join���� ���) : ��ȣ���� ��������
--3) �������� �����ġ�� ���� ���� : ��Į�� ��������, �ζ��� �� ��������, (�Ϲ�,where����) ��������


--6.5 ��Į�� ��������
-- ��Į�� : (����)������ ���� �ʰ� ũ�⸸ ���� ���� (1����) vs ���� : ũ��� ������ ��� ���� ����(2����)
-- select ���� ����ϴ� �������� ==> select���� �÷� (�ϳ��ϳ�)�� �ۼ��ϴ� �� (clause, ��)
-- �ڵ强 ���̺��� �ڵ���� ��ȸ�ϰų� �׷��Լ��� ������� ��ȸ�Ҷ� ����Ѵ�. / �ִ밪,�ְ�,�հ�,���

[���� 6-22] ����� �̸�, �޿�,�μ��ڵ�, �μ����� ��ȸ�Ѵ�.
-- join����
-- employees: �̸�, �޿�, �μ��ڵ�
-- department : �μ���

select first_name, salary, department_id,
        (select department_name
         from departments d
         where e.department_id = d.department_id) AS department_name-- ��Į�� �������� 
from employees e;

[���� 6-23] ����� ���, �̸�, �޿�, �μ��ڵ�, �μ���� �޿� ������ ��ȸ�Ѵ�

select employee_id , first_name , salary, department_id,
        ( select   round(avg(salary))
          from employees e1
          where e1.department_id = e2.department_id
          group by department_id) avg_sal
from employees e2;

--6.6 �ζ��� �� ��������
-- from ���� ���Ǵ� �������� ==> from���� ���̺� ���� ==> �ζ��� �� ��������
-- �� : ������ ���̺� (=�޸𸮿��� ����, ���� ����� �޸𸮿��� ����, ����� ��ȯ�ϰ� �������..)
-- select���� ���Ǵ� �������� ==> ��Į�� ��������
-- ���� ������ �������̰� ==> ������ ���̺��̴ϱ�
-- where ���� ���������� ���̺�� join�� ���� ���踦 �δ´�.

--> ������ where���� (�Ϲ�) �������� : ���� ���� ����Ѵ�.

[����6-24] �޿��� ȸ�� ��ձ޿� �̻��̰� �ִ�޿� ������ ����� ���, �̸�, �޿�, ȸ�� ��ձ޿�, ȸ�� �ִ�޿��� ��ȸ�Ѵ�.

--hr���� : ȸ���� �޿���� ���� ���̺��� ���� ==> �������� �ִ� �� ó�� �������� ��ȸ

select employee_id,first_name,salary,
    avg_sal, max_sal
from employees,
    (select round(avg(salary)) AS avg_sal ,max(salary) As max_sal
     from employees)
where salary between avg_sal  and max_sal;

select e.employee_id,e.first_name,e.salary,
    a.avg_sal, a.max_sal
from employees e,
    (select round(avg(salary)) AS avg_sal ,max(salary) As max_sal
     from employees) a
where e.salary between a.avg_sal  and a.max_sal;

-- join ������ non-equi join ���� : = �̿��� ������ ����ϴ� join ���� (�����񱳿����� , between, in)
-- ���� ������� �ʴ� ����

[����6-25,26] ���� �Ի� ��Ȳ ���̺��� ������, �ζ��� �� �������� ��������, ���� �Ի��� ��Ȳ�� ��ȸ�Ͻÿ�.
-- �䱸�Ǵ� ���̺��� ����
-- 1��... 6�� ...12��
-- 14(��)...11��...7��
--1) ������� �ϳ��̴�.
--2) �÷��� ���� 1��~12�� ���� 12��
--3) �����ʹ� ������� �հ��̴�.

-- decode / �Լ�   vs   CASE ~ END / ǥ����   <------> ����Ŭ�� IF ~ ELSE��!
-- ����񱳸�!           �����, ������~

-- DECODE (exp,search1,result1,                CASE (exp WHEN search1 THEN result
--             search2,result2,                          WHEN search1 THEN result
--                 ..���..                              ELSE �⺻��
--               0) AS ��Ī                          END AS ��Ī
        
--        to_char()        to_date()
-- ���� -----------> ���� -----------> ��¥
-- ���� <----------- ���� <----------- ��¥
--          to_number       to_char()
-- ����--> ��¥ ��ȯ �ȵǹǷ� , ��ȯ�Լ��� Ȱ��!
-- ��¥���� ==> NLS Ȯ�� �ʿ�!

select to_char(hire_date, 'DAY')
from employees;

SELECT decode(to_char(hire_date,'mm'),'01',COUNT(*),0) AS "1��",
       decode(to_char(hire_date,'mm'),'02',COUNT(*),0) AS "2��",
       decode(to_char(hire_date,'mm'),'03',COUNT(*),0) AS "3��",
       decode(to_char(hire_date,'mm'),'04',COUNT(*),0) AS "4��",
       decode(to_char(hire_date,'mm'),'05',COUNT(*),0) AS "5��",
       decode(to_char(hire_date,'mm'),'06',COUNT(*),0) AS "6��",
       decode(to_char(hire_date,'mm'),'07',COUNT(*),0) AS "7��",
       decode(to_char(hire_date,'mm'),'08',COUNT(*),0) AS "8��",
       decode(to_char(hire_date,'mm'),'09',COUNT(*),0) AS "9��",
       decode(to_char(hire_date,'mm'),'10',COUNT(*),0) AS "10��",
       decode(to_char(hire_date,'mm'),'11',COUNT(*),0) AS "11��",
       decode(to_char(hire_date,'mm'),'12',COUNT(*),0) AS "12��"

from employees
group by to_char(hire_date,'mm')
order by to_char(hire_date,'mm');
-- �׷��Լ��� ���� �����κ��� �ϳ��� ������� ��ȯ�Ѵ�