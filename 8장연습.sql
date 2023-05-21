insert into table [column1, column2]
values (value1,value2);

[예제8-1]
insert into emp (emp_id,fname,lname,hire_date)
values (300,'Steven','Jobs',SYSDATE);

select *
from emp;

[예제8-2]
insert into emp(emp_id,fname,lname,hire_date)
values (301,'Bill','Gates',To_date('2013/05/26','yyyy-mm-dd'));

select *
from emp;

[예제8-4]
insert into emp (emp_id,fname,lname,hire_date,job_id,salary)
values (302,'Warren','Buffett',sysdate,'','');

select *
from emp;

[예제8-5] emp 테이블에 부서코드가 10 , 20 인 사원의 정보를 불러온다.
insert into emp (emp_id,fname,lname,hire_date,job_id,dept_id)
select employee_id, first_name, last_name, hire_date, job_id, department_id
from employees
where department_id in (10,20);

select *
from emp;

[예제8-6] 월별 급여 관리 테이블에 부서코드 행 데이터를 삽입 저장한다.
insert into month_salary (dept_id)
select distinct(department_id)
from employees
where department_id is not null;

select *
from month_salary;

[예제8-7] emp 테이블에 부서코드가 30~60인 사원의 정보를 불러온다.
insert into emp (emp_id,fname,lname,hire_date,job_id,dept_id)
select employee_id, first_name, last_name, hire_date, job_id, department_id
from employees
where department_id between 30 and 60;

select * from emp;

update table명
set column = value;

[예제8-8] 사번이 300번 이상인 사원의 부서코드를 20으로 변경한다.
update emp
set dept_id = 20
where emp_id >=300;

select * from emp;

[예제8-9] 사번이 300번인 사원의 급여, 커미션 백분율, 업무코드 변경한다.
update emp
set salary = 2000 , comm_pct = 0.1 , job_id = 'IT_PROG'
where emp_id = 300;

select * from emp;

[예제8-10]
update emp
set salary = 5000, comm_pct =0.4;

select * from emp;

commit;

[예제8-11] emp 테이블 사번 103번 사원의 급여를
employees 테이블 20번 부서의 최대 급여로 변경한다.

update emp
set salary = (select max(salary)
                from employees
                group by department_id
                having department_id = 20)
where emp_id = 103;

select salary from emp where emp_id = 103;

[예제8-12] emp 테이블 사번 180번 사원과 같은 해에 입사한 사원들의 급여를
employees 테이블 50번 부서의 평균급여로 변경한다.

update emp
set salary = (select round(avg(salary))
               from employees
               group by department_id
               having department_id = 50)
where to_char(hire_date,'yyyy') = (select to_char(hire_date,'yyyy')
                                   from emp
                                   where emp_id = 180
                                   )  ;
                                   
                                   
                                   
[★★★★★★★★★★][★★★★★★★★★★][★★★★★★★★★★][★★★★★★★★★★]                                 
[예제8-13] month_salary 테이블에 각 부서별 사원수, 급여합계, 평균급여를 변경한다.

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
       
       
[★★★★★★★★★★][★★★★★★★★★★][★★★★★★★★★★][★★★★★★★★★★]                  
[예제8-14]
update month_salary
set (emp_count,sum_sal,avg_sal) = (select count(employee_id),sum(salary),round(avg(salary))
                from employees
                where department_id = dept_id
                group by department_id);
                

DELETE FROM table명
where 조건:;

[예제8-15] emp 테이블에서 60번 부서의 사원정보를 삭제한다.

delete from emp
where dept_id = 60;

select * from emp;


[연습문제 8-1]

1.emp테이블에 다음과 같은 데이터 행을 저장한다.

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (400, 'Johns', 'Hopkins', '2008/10/15', 5000);

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (401, 'Abraham', 'Lincoln', '2010/03/03', 12500);

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (402, 'Tomas', 'Edison', '2013/06/21', 5000);

select * from emp;

2. emp 테이블의 사번 401번 사원의 부서코드를 90, 업무코드를 SA_MAN으로 변경하고
데이터행의 저장을 확정한다.

update emp
set dept_id = 90, job_id = 'SA_MAN'
where emp_id = 401;

select* from emp where emp_id = 401;

commit;

3. emp 테이블의 급여가 8000미만인 모든 사원의 부서코드는 80으로 변경하고
급여는 employees 테이블의 80번 부서의 평균급여를 가져와 변경한다.
단, 평균급여는 반올림된 정수를 사용한다.

update emp
set dept_id =80,
salary= (select round(avg(salary))
        from employees
        group by department_id
        having department_id = 80)
where salary < 8000;

select * from emp;

4. emp 테이블의 2010년 이전 입사한 사원의 정보를 삭제한다.

delete emp
where to_char(hire_date,'yyyy') < '2010';

select * from emp;

commit;