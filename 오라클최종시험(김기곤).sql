--13번

create table dept(
    DEPTNO number primary key,
    DNAME varchar2(30),
    CITY varchar2(30)
);

insert into dept
values (10,'Accounting','New York');

insert into dept
values (20,'Research','Dallas');

insert into dept
values (30,'Sales','Chicago');
select *
from dept;

--14번

--create table emp(
--EMPNO number primary key,
--name varchar2(30),
--job varchar2(30),
--hire_date varchar2(30),
--salary number,
--deptno number
--);
--
--insert into emp
--values(200103,'Jones','Manager','2001-04-02',2975,20);
--
--insert into emp
--values(200104,'Blake','Manager','2001-05-01',2850,30);
--
--insert into emp
--values(200105,'Clark','Manager','2001-06-09',2450,10);
--
--insert into emp
--values(200106,'King','President','2001-11-17',5000,10);
--
--insert into emp
--values(200201,'Miller','Clerk','2002-01-23',1300,10);
--
--insert into emp
--values(200202,'Allen','Salesman','2002-02-20',1600,30);
--
--insert into emp
--values(200203,'Ford','Analyst','2002-12-03',3000,20);
--
--insert into emp
--values(200701,'Adams','Clerk','2007-02-23',1100,20);
--
--insert into emp
--values(200702,'Ward','Salesman','2007-05-22',1250,30);
--
--insert into emp
--values(200703,'James','Clerk','2007-12-03',950,30);

select *
from emp;

commit;

select name,salary,deptno,hire_date
from emp
where hire_date like '2001%'
order by to_date(hire_date) desc;

--15번

select empno,name,deptno,salary
from emp
where deptno in (10,20)
order by 3,4 desc;

--16번

select name, salary, dname
from emp e , dept d
where e.deptno = d.deptno;

--17번

select deptno,round(avg(salary),2)
from emp
group by deptno;

--18번

insert into emp
values (201701,'Bill','Clerk','2017-10-02',1000,20);

select *
from emp;

commit;

--19번

UPDATE emp
set salary = 1400
where job = 'Clerk';

select *
from emp;


--20번
delete from emp
where salary = (select max(salary)
                from emp);
                
select *
from emp;