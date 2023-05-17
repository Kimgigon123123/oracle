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
--서브쿼리 결과값 중 어느 하나만 만족되더라도 행을 반환한다.
-- = 만 사용할때

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
where salary >   (select salary from employees where department_id=70)
order by salary;

SELECT employee_id,first_name,department_id,salary
from employees
where salary >  any (select salary from employees where department_id=80)-- 80번부서 급여보다 높은게 하나라도 있으면
order by salary;

--같은 기능하는 다중행 서브쿼리 연산자 / 연산기호
--= any : 일치하는것 하나라도 있으면 true 결과 ( 서브쿼리 실행 결과가 다중행을 반환 할때)   on 연산자/ in 연산자
--> any : (서브쿼리 실행에 따른 반환결과가 결과적으로) > 최소값(min함수) 과 같다.     vs        >min
--< any : (서브쿼리 실행에 따른 반환결과가 결과적으로) < 최소값(max함수) 과 같다.     vs        <max
--= all : (서브쿼리 실행에 따른 반환결과가 결과적으로) = 모든 결과와 비교해서 true여야 하는 조건 == > 결과행 안나오는 경우
--> all : (서브쿼리 실행에 따른 반환결과가 결과적으로) > 최대값(max함수) 과 같다.
--< all : (서브쿼리 실행에 따른 반환결과가 결과적으로) < 최대값(min함수)

[예제6-8] 10번 부서원의 급여보다 적은 급여를 받는 사원의 사번 이름 부서번호 급여를 급여순으로 조회한다.

select employee_id, last_name, department_id, salary
from employees
where salary < (select salary from employees where department_id=10)
order by salary;

[예제6-10] 100번 부서원 모두의 급여보다 높은 급여를 받는 사원의 사번 이름 부서번호 급여를 급여 오름차순으로 조회한다

-- 그룹합수 : count(*) or count(컬럼명) or count(distnct 컬럼명)
-- 100번 부서원 조회 --> 그룹별 사원의 수 집계
-- count() : NULL 제외
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

[예제6-14] 20번 부서원의 급여와 같은 급여를 받는 사원의 사번,이름,부서번호,급여를 부서코드 순, 급여순으로 조회한다.

SELECT employee_id, first_name, department_id,salary
from employees
where salary in (select salary from employees where department_id=20)
order by department_id,salary;

[예제6-16] 부서테이블에서 부서코드가 10,20,30,40에 해당하지 않는 부서코드를 조회한다.
-- NOT IN 연산자와 <> ALL는 동일한 기능


select department_id,department_name
from departments
where department_id not in (10,20,30,40); -- 23rows

select department_id,department_name
from departments
where department_id <> any (10,20,30,40); -- 27rows ==> 10번 비교, 20~270/ 20번 비교, 10,30~270

--6.2.5 (단일 행,다중 행) 다중 컬럼 서브쿼리 (p.57)
--서브쿼리도 메인쿼리처럼 여러개의 컬럼을 사용 할 수 있다.

[예제6-18] 매니저가 없는 사원이 매니저로 있는 부서코드, 부서명을 조회합니다.

select department_id,department_name
from departments 
where (department_id,manager_id) in (select department_id,employee_id from employees where manager_id is null);

-- 다중컬럼 서브쿼리 ==> 한번에 두개이상의 컬럼을 비교하는 서브쿼리

--6.3 exists 연산자 (상호연관서브쿼리에서 사용)
-- 상호 연관 서브쿼리(p.57)
-- 상호 : 서로~ / 연관 : 관련 ~ 연결 == > join 연산 vs set 연산
-- 서브쿼리인데, join연산을 활용한 서브쿼리!
-- 메인쿼리의 컬럼이 서브쿼리의 조건절에 사용되어 메인쿼리에 독립적이지 않은 형식

[예제6-19] 매니저가 있는 부서코드에 소속된 사원들의 수를 조회한다.
select count(employee_id)
from employees
where manager_id is not null;

select count(*) AS 사원수
from employees
where department_id in (select department_id
                        from employees
                        where manager_id is not null);
                        
select count(*) AS 사원수
from employees e
where department_id in (select department_id
                        from departments d
                        where manager_id is not null
                        AND e.department_id = d.department_id
                        );
                        
                        
-- in 연산자를 exists 연산자로 바꿔 사용할 수 있다.
select count(*) AS 사원수
from employees e
where department_id exists (select department_id
                        from departments d
                        where manager_id is not null
                        AND e.department_id = d.department_id
                        );
--ORA-00920: 관계 연산자가 부적합합니다 : IN 대신 exists를 사용할때는 where절에 비교 컬럼이 없어야 함.
select count(*) AS 사원수
from employees e
where exists (select department_id
                        from departments d
                        where manager_id is not null
                        AND e.department_id = d.department_id
                        );
-- EXISTS 연산자는 서브쿼리의 결과행 존재 여부만 판단한다 ==>
-- EXISTS 연산자를 사용할때, 서브쿼리의 select 목록과는 무관한 메인 쿼리 컬럼과의 join 조건이 핵심이다.
-- 다중컬럼 서브쿼리보다 분량은 좀 더 있다 -->비중이 좀 더 있다. --> 더 자주 사용할 수 있다??
-- 상호연관 서브쿼리는 서브쿼리 실행결과를 메인쿼리에 조인 ==> 속도차이

--====================
--1) 서브쿼리 결과행에 따른 구분 : 단일 행, 다중행, 다중컬럼
--2) 연관성에 따른 구분 (=join연산 사용) : 상호연관 서브쿼리
--3) 서브쿼리 사용위치에 따른 구분 : 스칼라 서브쿼리, 인라인 뷰 서브쿼리, (일반,where절에) 서브쿼리


--6.5 스칼라 서브쿼리
-- 스칼라 : (물리)방향을 갖지 않고 크기만 갖는 개념 (1차원) vs 벡터 : 크기와 방향을 모두 갖는 개념(2차원)
-- select 절에 사용하는 서브쿼리 ==> select절은 컬럼 (하나하나)을 작성하는 곳 (clause, 절)
-- 코드성 테이블에서 코드명을 조회하거나 그룹함수의 결과값을 조회할때 사용한다. / 최대값,최고값,합계,평균

[예제 6-22] 사원의 이름, 급여,부서코드, 부서명을 조회한다.
-- join연산
-- employees: 이름, 급여, 부서코드
-- department : 부서명

select first_name, salary, department_id,
        (select department_name
         from departments d
         where e.department_id = d.department_id) AS department_name-- 스칼라 서브쿼리 
from employees e;

[예제 6-23] 사원의 사번, 이름, 급여, 부서코드, 부서평균 급여 정보를 조회한다

select employee_id , first_name , salary, department_id,
        ( select   round(avg(salary))
          from employees e1
          where e1.department_id = e2.department_id
          group by department_id) avg_sal
from employees e2;

--6.6 인라인 뷰 서브쿼리
-- from 절에 사용되는 서브쿼리 ==> from절은 테이블 나열 ==> 인라인 뷰 서브쿼리
-- 뷰 : 가상의 테이블 (=메모리에만 존재, 쿼리 실행시 메모리에서 실행, 결과를 반환하고 사라지는..)
-- select절에 사용되는 서브쿼리 ==> 스칼라 서브쿼리
-- 메인 쿼리와 독립적이고 ==> 별도의 테이블이니까
-- where 절에 메인쿼리의 테이블과 join을 통해 관계를 맺는다.

--> 보통은 where절에 (일반) 서브쿼리 : 가장 많이 사용한다.

[예제6-24] 급여가 회사 평균급여 이상이고 최대급여 이하인 사원의 사번, 이름, 급여, 회사 평균급여, 회사 최대급여를 조회한다.

--hr계정 : 회사의 급여평균 집계 테이블은 없다 ==> 가상으로 있는 것 처럼 서브쿼리 조회

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

-- join 연산중 non-equi join 형식 : = 이외의 연산자 사용하는 join 형식 (범위비교연산자 , between, in)
-- 거의 사용하지 않는 형식

[예제6-25,26] 월별 입사 현황 테이블은 없지만, 인라인 뷰 서브쿼리 형식으로, 월별 입사자 현황을 조회하시오.
-- 요구되는 테이블의 구조
-- 1월... 6월 ...12월
-- 14(명)...11명...7명
--1) 결과행이 하나이다.
--2) 컬럼의 수는 1월~12월 까지 12개
--3) 데이터는 사원수의 합계이다.

-- decode / 함수   vs   CASE ~ END / 표현식   <------> 오라클의 IF ~ ELSE문!
-- 동등비교만!           동등비교, 범위비교~

-- DECODE (exp,search1,result1,                CASE (exp WHEN search1 THEN result
--             search2,result2,                          WHEN search1 THEN result
--                 ..계속..                              ELSE 기본값
--               0) AS 별칭                          END AS 별칭
        
--        to_char()        to_date()
-- 숫자 -----------> 문자 -----------> 날짜
-- 숫자 <----------- 문자 <----------- 날짜
--          to_number       to_char()
-- 숫자--> 날짜 변환 안되므로 , 변환함수가 활용!
-- 날짜포맷 ==> NLS 확인 필요!

select to_char(hire_date, 'DAY')
from employees;

SELECT decode(to_char(hire_date,'mm'),'01',COUNT(*),0) AS "1월",
       decode(to_char(hire_date,'mm'),'02',COUNT(*),0) AS "2월",
       decode(to_char(hire_date,'mm'),'03',COUNT(*),0) AS "3월",
       decode(to_char(hire_date,'mm'),'04',COUNT(*),0) AS "4월",
       decode(to_char(hire_date,'mm'),'05',COUNT(*),0) AS "5월",
       decode(to_char(hire_date,'mm'),'06',COUNT(*),0) AS "6월",
       decode(to_char(hire_date,'mm'),'07',COUNT(*),0) AS "7월",
       decode(to_char(hire_date,'mm'),'08',COUNT(*),0) AS "8월",
       decode(to_char(hire_date,'mm'),'09',COUNT(*),0) AS "9월",
       decode(to_char(hire_date,'mm'),'10',COUNT(*),0) AS "10월",
       decode(to_char(hire_date,'mm'),'11',COUNT(*),0) AS "11월",
       decode(to_char(hire_date,'mm'),'12',COUNT(*),0) AS "12월"

from employees
group by to_char(hire_date,'mm')
order by to_char(hire_date,'mm');
-- 그룹함수는 여러 행으로부터 하나의 결과값을 반환한다