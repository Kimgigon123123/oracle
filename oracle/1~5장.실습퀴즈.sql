--1. 사원 테이블에서 20번,30번 부서에 근무하는 사원중 급여가 2000 초과인 사원을 조회하시오

select employee_id
from employees
where department_id IN (20,30)
and salary > 2000;

--2. 30번 부서에 근무하는 사원을 조회하여 사번, 이름, 업무코드, 부서코드를 조회하세요
-- 단 업무코드가 PU_CLERK인 사원만 조회
select employee_id,first_name,job_id,department_id
from employees
where department_id=30
and job_id='PU_CLERK';

--3. employees 테이블을 이용해, 다음과 같은 결과가 나오도록 SQL문을 작성해보세요!
-- 이름이 s로 끝나는 사원들을 조회해보세요

select employee_id,first_name,job_id
from employees
where first_name like '%s';

--4. 사원의 이름이 5글자 이상이며, 6글자 미만인 사원정보를 기준으로 사번은 앞 두자리에 *기호를 출력하고 이름은 첫글자만 보여주고
-- 나머지는 글자수만큼 *를 표시하세요

select employee_id AS EMPNO, rpad(substr(employee_id,1,2),4,'*') AS MASKING_EMPNO, first_name AS ENAME, rpad(substr(first_name,1,1),6,'*') AS MASKING_NAME
from employees
where length(first_name) >= 5 and length(first_name) < 6;

--5. 사원테이블에서, 사원들은 입사일을 기준으로 3개월이 지난 시점에 정직원이 된다고 했을때
-- 해당 날짜를 convert_date라는 컬럼을 출력하세요
-- commission_pct가 없는 사원은 null이 안닌 0으로 출력하세요

select employee_id, first_name, hire_date, add_months(hire_date,3) AS convert_date,nvl(commission_pct,0)
from employees;


--6. 매니저 코드가 존재하지 않는 사원 : 0000
-- 매니저 코드 앞 두자리가 10인 사원 : 1010
-- 매니저 코드 앞 두자리가 11인 사원 : 1111
-- 매니저 코드 앞 두자리가 12인 사원 : 1212
-- 그 외 : 본래의 매니저 코드를 그대로 출력

select employee_id,first_name,manager_id,
case
when manager_id is null then '0000'
when substr(manager_id,1,2)=10 then '1010'
when substr(manager_id,1,2)=11 then '1111'
when substr(manager_id,1,2)=12 then '1212'
else substr(manager_id,1)
end new_mgr
from employees;

--7. 다음과 같은 결과가 나오도록 SQL문을 작성해보세요
-- 사원들의 월평균 근무일수는 21.5일
-- 하루 근무 시간을 8시간 기준
-- 사원들의 일일 급여와 시급을 계산하여 사번,성과 함께 출력

select employee_id, last_name, salary,trunc(salary/21.5,2) AS day_sal,  trunc(trunc(salary/21.5,2)/8,1) AS time_salary
from employees;

--8. 부서번호, 평균급여, 최고급여, 최저급여, 사원수를 출력

select department_id,trunc(avg(salary)),max(salary),min(salary),count(employee_id)
from employees
group by department_id
order by department_id;

--9. 업무코드는 AA_BBBBB 형태, 업무는 BBBBB를 뜻함
-- 3명 이상인 업무를 조회

--select substr(job_id,4),count(job_id)
--from employees
--group by substr(job_id,4)
--having count(substr(job_id,4))>=3;

--10.사원들의 입사년도 기준
-- 부서별로 입사자 수를 조회

--select to_char(hire_date,'yyyy'),department_id,count(to_char(hire_date,'yyyy'))
--from employees
--group by to_char(hire_date,'yyyy'),department_id
--order by 1;

--11. 커미션을 받는 사원은 o, 그렇지 않은 사원은 x로 구분하고 그 수를 조회

select nvl2(commission_pct,'o','x'),count(nvl2(commission_pct,'o','x'))
from employees
group by nvl2(commission_pct,'o','x');

----12. 각 부서의 입사 년도별 사원수, 최고급여, 최저급여, 평균급여를 출력하고 각 부서별 소계, 총계를 구하세요
--select department_id,to_char(hire_date,'yyyy'),count(employee_id),max(salary),sum(salary),avg(salary)
--from employees
--group by department_id,rollup(to_char(hire_date,'yyyy'))
--order by 1;

--13. 급여가 2000초과인 사원들의 부서코드, 부서명,사번,이름,급여를 조회하시오
select e.department_id,d.department_name,employee_id,first_name,salary
from employees e , departments d
where e.salary>2000
and e.department_id = d.department_id;

--14. 부서별 평균급여, 최대급여, 최저급여, 사원수 조회
select d.department_id,d.department_name,trunc(avg(salary)),max(salary),min(salary),count(d.department_id)
from departments d, employees e
where d.department_id = e.department_id
group by d.department_id, d.department_name
order by department_id;

--15.
select e.department_id, d.department_name, e.employee_id, e.first_name, e.job_id, e.salary
from employees e , departments d
where e.department_id = d.department_id;

--16. 성에 대소문자 무관하게 z가 있는 성을 가진 사원들의 사번, 성, 부서코드, 부서명 조회하세요
select e.employee_id,e.last_name,e.department_id,d.department_name
from employees e , departments d
where e.department_id=d.department_id
and upper(e.last_name) like '%Z%';

--17. 관리자 사번이 149인 사원들의 정보를 아래와 같이 조회하세요
select e.employee_id, e.last_name, e.department_id,d.department_name
from employees e,departments d
where e.department_id = d.department_id(+)
and e.manager_id=149;

--18. 부서코드가 60번 이하인 부서에 대해 부서의 평균 급여가 5000이상인 부서만 부서코드,사원 수, 급여합계,급여평균,
-- 최대급여, 최근입사일자, 최초입사일자를 조회해보세여

select employee_id,department_id,count(employee_id),sum(salary),trunc(avg(salary)),max(salary),max(hire_date),min(hire_date)
from employees
group by employee_id,department_id
having department_id <= 60 and trunc(avg(salary))>=5000
order by 1;

--19.업무형태(job_id)별로 사원들의 정보를 파악하고자 한다. 업무 형태별로 사원수가 10명 이상인 업무 형태에
-- 대해 업무코드, 업무별 사원수, 업무별 평균급여, 업무별  최대급여, 업무별 최근 입사일자, 업무별 최초입사일자 조회해보세요!!

select job_id,count(job_id),trunc(avg(salary)),max(salary),max(hire_date),min(hire_date)
from employees
group by job_id
having count(job_id) >=10

