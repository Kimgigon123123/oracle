insert into table [column1, column2]
values (value1,value2);

[����8-1]
insert into emp (emp_id,fname,lname,hire_date)
values (300,'Steven','Jobs',SYSDATE);

select *
from emp;

[����8-2]
insert into emp(emp_id,fname,lname,hire_date)
values (301,'Bill','Gates',To_date('2013/05/26','yyyy-mm-dd'));

select *
from emp;

[����8-4]
insert into emp (emp_id,fname,lname,hire_date,job_id,salary)
values (302,'Warren','Buffett',sysdate,'','');

select *
from emp;

[����8-5] emp ���̺� �μ��ڵ尡 10 , 20 �� ����� ������ �ҷ��´�.
insert into emp (emp_id,fname,lname,hire_date,job_id,dept_id)
select employee_id, first_name, last_name, hire_date, job_id, department_id
from employees
where department_id in (10,20);

select *
from emp;

[����8-6] ���� �޿� ���� ���̺� �μ��ڵ� �� �����͸� ���� �����Ѵ�.
insert into month_salary (dept_id)
select distinct(department_id)
from employees
where department_id is not null;

select *
from month_salary;

[����8-7] emp ���̺� �μ��ڵ尡 30~60�� ����� ������ �ҷ��´�.
insert into emp (emp_id,fname,lname,hire_date,job_id,dept_id)
select employee_id, first_name, last_name, hire_date, job_id, department_id
from employees
where department_id between 30 and 60;

select * from emp;

update table��
set column = value;

[����8-8] ����� 300�� �̻��� ����� �μ��ڵ带 20���� �����Ѵ�.
update emp
set dept_id = 20
where emp_id >=300;

select * from emp;

[����8-9] ����� 300���� ����� �޿�, Ŀ�̼� �����, �����ڵ� �����Ѵ�.
update emp
set salary = 2000 , comm_pct = 0.1 , job_id = 'IT_PROG'
where emp_id = 300;

select * from emp;

[����8-10]
update emp
set salary = 5000, comm_pct =0.4;

select * from emp;

commit;

[����8-11] emp ���̺� ��� 103�� ����� �޿���
employees ���̺� 20�� �μ��� �ִ� �޿��� �����Ѵ�.

update emp
set salary = (select max(salary)
                from employees
                group by department_id
                having department_id = 20)
where emp_id = 103;

select salary from emp where emp_id = 103;

[����8-12] emp ���̺� ��� 180�� ����� ���� �ؿ� �Ի��� ������� �޿���
employees ���̺� 50�� �μ��� ��ձ޿��� �����Ѵ�.

update emp
set salary = (select round(avg(salary))
               from employees
               group by department_id
               having department_id = 50)
where to_char(hire_date,'yyyy') = (select to_char(hire_date,'yyyy')
                                   from emp
                                   where emp_id = 180
                                   )  ;
                                   
                                   
                                   
[�ڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡ�]                                 
[����8-13] month_salary ���̺� �� �μ��� �����, �޿��հ�, ��ձ޿��� �����Ѵ�.

update month_salary 
set emp_count = (select count(employee_id)
                    from employees 
                    where department_id = dept_id
                    group by department_id),
 sum_sal = (select sum(salary)
                    from employees 
                    where department_id = dept_id
                    group by department_id),
 avg_sal = (select round(avg(salary))
                    from employees 
                    where department_id = dept_id
                    group by department_id)  ;               
       
       
[�ڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡ�][�ڡڡڡڡڡڡڡڡڡ�]                  
[����8-14]
update month_salary
set (emp_count,sum_sal,avg_sal) = (select count(employee_id),sum(salary),round(avg(salary))
                from employees
                where department_id = dept_id
                group by department_id);
                

DELETE FROM table��
where ����:;

[����8-15] emp ���̺��� 60�� �μ��� ��������� �����Ѵ�.

delete from emp
where dept_id = 60;

select * from emp;


[�������� 8-1]

1.emp���̺� ������ ���� ������ ���� �����Ѵ�.

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (400, 'Johns', 'Hopkins', '2008/10/15', 5000);

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (401, 'Abraham', 'Lincoln', '2010/03/03', 12500);

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (402, 'Tomas', 'Edison', '2013/06/21', 5000);

select * from emp;

2. emp ���̺��� ��� 401�� ����� �μ��ڵ带 90, �����ڵ带 SA_MAN���� �����ϰ�
���������� ������ Ȯ���Ѵ�.

update emp
set dept_id = 90, job_id = 'SA_MAN'
where emp_id = 401;

select* from emp where emp_id = 401;

commit;

3. emp ���̺��� �޿��� 8000�̸��� ��� ����� �μ��ڵ�� 80���� �����ϰ�
�޿��� employees ���̺��� 80�� �μ��� ��ձ޿��� ������ �����Ѵ�.
��, ��ձ޿��� �ݿø��� ������ ����Ѵ�.

update emp
set dept_id =80,
salary= (select round(avg(salary))
        from employees
        group by department_id
        having department_id = 80)
where salary < 8000;

select * from emp;

4. emp ���̺��� 2010�� ���� �Ի��� ����� ������ �����Ѵ�.

delete emp
where to_char(hire_date,'yyyy') < '2010';

select * from emp;

commit;