--6장. 서브쿼리 (p.51)

--================서브쿼리의유형==============
--6.1 단일 행 서브쿼리
--6.2 다중 행 서브쿼리
--6.3 다중 컬럼 서브쿼리
--6.4 상호연관 서브쿼리
--6.5 스칼라 서브쿼리
--6.6 인라인 뷰 서브쿼리
--===========================================
[예제 6-1] 평균급여보다 더 적은 급여를 받는 사원의 정보를 조회한다.
select employee_id, first_name, salary
from employees
where salary < (select avg(salary) from employees);

[예제6-2] 월급여가 가장 많은 사원의 사번, 이름,성 정보를 조회한다

select employee_id, first_name, salary
from employees
where salary=(select max(salary) from employees);

[예제6-3] 사번 108번 사원의 급여보다 더많은 급여를 받는 사원의 사번, 이름, 급여를 조회한다.

select employee_id, first_name, salary
from employees
where salary > (select salary from employees where employee_id=108);

[예제 6-4] 월급여가 가장 많은 사원의 사번, 이름, 성, 업무제목 정보를 조회한다.

select e.employee_id,e.first_name,
j.job_title
from employees e,jobs j
where e.job_id = j.job_id
and salary = (select max(salary) from employees);


--6.2 다중 행 서브쿼리 (p.53)
--다중 행 연산자 (IN,NOT,ANY(=SOME),ALL,EXISTS)
--6.2.1 IN 연산자 
-- OR 연산자 대신 --> 간결
--6.2.1 NOT 연산자
--6.2.1 ANY 연산자
--6.2.1 ALL 연산자
--6.2.1 EXISTS 연산자

[예제6-5] 근무지(위치코드)가 영국(UK)인 부서코드, 위치코드, 부서명 정보를 조회한다.

select location_id
from locations
where country_id='UK';
--값이 세개 나오기 때문에 단일행 서브쿼리 불가!

SELECT d.department_id, d.location_id, d.department_name
from departments d
where d.location_id IN (select location_id from locations where country_id='UK');

[예제6-6] 70번 부서원의 급여보다 높은 급여를 받는 사원의 사번, 이름, 부서번호, 급여를 급여순으로 조회한다.

SELECT employee_id,first_name,department_id,salary
from employees
where salary > (select salary from employees where department_id=70)
order by salary;

[예제6-8] 10번 부서원의 급여보다 적은 급여를 받는 사원의 사번 이름 부서번호 급여를 급여순으로 조회한다.

select employee_id, last_name, department_id, salary
from employees
where salary < (select salary from employees where department_id=10)
order by salary;

[예제6-10] 100번 부서원 모두의 급여보다 높은 급여를 받는 사원의 사번 이름 부서번호 급여를 급여 오름차순으로 조회한다

select employee_id, first_name, department_id,salary
from employees
where salary > ALL (select salary from employees where department_id=100);

[예제6-14] 20번 부서원의 급여와 같은 급여를 받는 사원의 사번,이름,부서번호,급여를 부서코드 순, 급여순으로 조회한다.

SELECT employee_id, first_name, department_id,salary
from employees
where salary in (select salary from employees where department_id=20)
order by department_id,salary;

[예제6-16] 부서테이블에서 부서코드가 10,20,30,40에 해당하지 않는 부서코드를 조회한다.

select department_id
from departments
where department_id not in (10,20,30,40);