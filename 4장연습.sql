4장 그룹함수

4.1 DISTINCT

[예제4-1] 사원들이 소속된 부서를 조회한다.
select distinct department_id
from employees;

[예제4-2]
select distinct department_id,employee_id
from employees;

[연습문제 4-1] 사원 테이블에서 이 회사의 매니저들을 조회하는 쿼리문을 작성한다.
SELECT distinct e1.manager_id,e2.first_name
FROM employees e1, employees e2
where e1.manager_id = e2.employee_id
order by 1;

4.2 그룹함수
[연습문제4-2]
1.사원 테이블에서 커미션을 받는 사원이 모두 몇명인지 그수를 조회하는 쿼리문을 작성한다
select count(commission_pct)
from employees;

2. 가장 최근에 뽑은 직원을 입사시킨 날짜가 언제인지 최근 입사일자를 조회하는 쿼리문을 작성한다
select max(hire_date)
from employees;

3. 90번 부서의 평균급여액을 조회하는 쿼리문을 작성한다.
단, 평균급여액은 소수 둘째 자리까지 표기되도록한다.

select round(avg(salary),2)
from employees
where department_id = 90;

4.3 group by 절
[예제4-8] 부서별 급여총액, 사원수, 평균 급여를 조회한다.
select department_id,sum(salary),count(employee_id),round(avg(salary))
from employees
group by department_id;

[예제4-9] 부서별, 업무별 급여총액 평균 급여를 조회한다
select department_id,job_id,sum(salary),round(avg(salary))
from employees
group by department_id,job_id;

[예제4-10] 80번 부서의 급여총액과 평균급여를 조회한다.
select department_id,sum(salary),round(avg(salary))
from employees
where department_id=80
group by department_id;

4.4 HAVING 절
[예제4-11] 80번 부서의 평균급여를 조회한다.
select department_id,round(avg(salary))
from employees
group by department_id 
having department_id=80;

[예제4-12] 부서에 소속된 사원수가 5명 이하인 부서와 그 수 를 조회한다
select department_id,count(*)
from employees
where department_id is not null
group by department_id
having count(*)<=5;

[연습문제4-3]

1. 사원테이블에서 똑같은  이름이 둘 이상있는 이름과 그 이름이 모두 몇명인지를 조회하는 쿼리문을 작성한다.

select first_name,count(first_name)
from employees
group by first_name
having count(first_name) >=2;

2. 부서번호, 각 부서별 급여총액과 평균급여를 조회하는 쿼리문을 작성한다.
단, 부서 평균급여가 8000 이상인 부서만 조회하도록 한다.
select department_id,sum(salary),round(avg(salary))
from employees
group by department_id
having round(avg(salary))>=8000;

3. 년도,년도별로 입사한 사원수를 조회하는 쿼리문을 작성한다.
단, 년도는 2014의 형태로 표기되도록한다.

select to_char(hire_date,'yyyy'),count(to_char(hire_date,'yyyy'))
from employees
group by to_char(hire_date,'yyyy');

4.5 rollup과 cube
[예제4-13] 부서별 사원수와 급여합계, 총계를 조회한다.
select department_id,count(*),sum(salary)
from employees
where department_id is not null
group by rollup(department_id)
order by department_id;

[예제4-14] 부서 내 업무별 사원수와 급여합계, 부서별 소계, 총계를 조회한다.
select department_id,job_id,count(*),sum(salary)
from employees
where department_id is not null
group by rollup(department_id,job_id)
order by department_id;

select job_id,department_id,count(job_id),sum(salary)
from employees
where job_id is not null
group by rollup(job_id,department_id)
order by job_id;