[연습문제8-1]

1.EMP 테이블에 (교재의) 데이터 행을 저장하시오

-- DML : INSERT, UPDATE, DELETE
INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (400, 'Johns', 'Hopkins', '2008/10/15', 5000);

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (401, 'Abraham', 'Lincoln', '2010/03/03', 12500);

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (402, 'Tomas', 'Edison', '2013/06/21', 5000);

select emp_id, fname, lname, hire_date,salary
from emp;

2. EMP 테이블의 사번 401번 사원의 부서코드를 90, 업무코드를 SA_MAN 으로 변경하고 데이터 행의 저장을 확정한다.

UPDATE emp
set dept_id = 90,
    job_id = 'SA_MAN'
where emp_id=401;

select *
from emp;

commit;

rollback;

3. EMP 테이블의 급여가 8000 미만인 모든 사원의 부서코드를 80번으로 변경하고, 급여는 employees 테이블의
80번 부서의 평균 급여를 가져와 변경한다.
(단, 평균급여는 반올림된 정수를 사용한다.)

--데이터 확인
SELECT *
from emp
WHERE salary < 8000;

-- employees 테이블의 80번 부서원의 평균 급여 조회
SELECT ROUND(AVG(salary))
from employees
where department_id = 80;

UPDATE emp
set dept_id = 80,
    salary = (select Round(AVG(salary))
                from employees
                group by department_id
                having department_id=80)
where salary < 8000;
                
4. emp 테이블의 2010년 이전 입사한 사원의 정보를 삭제한다.

delete from emp
where hire_date < '2009-12-31';