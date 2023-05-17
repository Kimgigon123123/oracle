[연습문제 6-2]

--1. 부서위치 코드가 1700에 해당하는 모든 사원의 사번, 이름, 부서코드
-- 업무코드를 조회하는 쿼리문을 다중 행 서브쿼리를 사용하여 작성한다

select employee_id, first_name, department_id,job_id
from employees
where department_id in (select department_id from departments where location_id=1700);


--2. 부서별로 가장 급여를 많이 받는 사원의 사번, 이름, 부서번호, 급여 업무 코드를 조회하는
-- 쿼리문을 다중 컬럼 서브쿼리를 사용하여 작성한다.

select employee_id, first_name, department_id, salary, job_id
from employees
where (department_id,salary) in (select department_id,max(salary) 
                                 from employees 
                                 group by department_id)

-- = any 또는 in 연산자 : 정답처리~