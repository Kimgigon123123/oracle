--4장. 그룹 함수
--그룹지어서, 그룹별로 데이터를 조회
-- 부서별 급여 합계, 급여 평균 조회하고자 할때/ 합계,평균,최고,최저의 통계적인 결과를 구하기 위한 함수

--4.1 DISTINCT
-- 중복을 제거한 결과를 반환하는 함수
--DISTINCT 컬럼명1, 컬럼명2, .... : 모든 컬럼에 (중복제거) 적용된다.
-- NULL은 제거되지 않음

[예제4.1] 사원들이 소속된 부서와 사번을 조회한다.
-- department 테이블 : 27개 부서 (11개 부서에 사원이 소속, 나머지 ??)

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT department_id, employee_id
FROM employees;

--연습문제 4-1

SELECT distinct manager_id
FROM employees;

--4.2 COUNT() : 데이터 행이 몇건 존재하는지 갯수를 세어서 반환하는 함수
-- 데이터가 NULL 인 행은 제외된다.

[예제4-3]
-- * : 애스터리스크 / 모든 행
-- 검색속도의 차이가 있다고 알려져 있음.
SELECT count(*), COUNT(employee_id),count(department_id),count(distinct department_id)
FROM employees;

--4.3 SUM() : 숫자 데이터 컬럼의 전체 합계를 계산하여 그 결과를 반환하는 함수
SELECT TO_CHAR(SUM(salary),'L999,999') AS "급여 총합",
        TO_CHAR(ROUND(SUM(salary) / COUNT(*),0),'9,999') AS "급여 평균"
FROM employees;

--4.4 MAX() : 데이터 컬럼에서 가장 큰값을 반환하는 함수, MIN() : 가장 작은 값을 반환하는 함수
-- 모든 데이터 유형을 사용! (숫자 데이터 칼럼에만 사용하는게 아니다??)
SELECT MAX(salary) AS 최고급여,
     MIN(salary) AS 최저금여액
FROM employees;


[예제4-6]
SELECT employee_id, first_name||' '||last_name AS name, job_id, salary
from employees
WHERE salary IN(24000,2100);

SELECT *
FROM job_history; --사번/출근일/퇴사일/직무(업무)/부서코드

SELECT *
from jobs; -- 직무(업무)/업무제목/최저급여/최고급여


SELECT employee_id,first_name,MAX(hire_date),min(hire_date),max(commission_pct),min(commission_pct)
FROM employees
WHERE commission_pct IS NOT NULL;
--오류

SELECT MAX(hire_date),MIN(hire_Date)
FROM employees;

--4.4 



--- 지금까지 등장했던 SQL 구문

--SELECT
--FROM
--WHERE
----group by
--ORDER BY : 가장 마지막에 작성한다

--4.3 GROUP BY 절 (그룹함수)
-- 1) 특정 조건을 사용하여 데이터 행을 하나의 그룹으로 나눌 수 있따.
-- 2) 그룹짓는 기준이 되는 컬럼을 지정한다.
-- 그룹함수를 사용한 컬럼과 일반 컬럼을 함께 SELECT절에 작성할 경우,
-- GROUP BY 절을 추가해서 그룹짓는 기준 컬럼을 명시해야 '오류'가 발생하지 않음.
-- SELECT 목록에 사용되는 그룹 함수 이외의 컬럼은 반드시 group by절을 명시해야한다!!!


[예제4-8] 부서별 <--- (부서가 기준) 급여 총액, 사원 수 ,평균 급여를 조회한다.

SELECT department_id,SUM(salary) AS 급여총액, count(*) AS 사원수, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
order by 1;

[예제4-9]

SELECT department_id,job_id,SUM(salary) AS 급여총액, count(*) AS 사원수, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id,job_id
order by 1;

SELECT department_id,TO_CHAR(SUM(salary),'999,999'),ROUND(AVG(salary)) AS 평균급여
FROM employees
WHERE department_id=80
group by department_id;


-- HAVING
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING -- 여기 위치!! 그룹바이 다음 위치!! (그룹함수 조건절)
--ORDER BY -- 항상 마지막!! 

[예제4-11]
SELECT ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id = 80;

[예제4-12]
SELECT department_id, COUNT(*)
from employees
WHERE department_id is NOT null
GROUP BY department_id
HAVING COUNT(*)<5;


--4.5 ROLLUP, CUBE
--4.5.1 ROLLUP : GROUP BY 절에 ROLLUP 함수를 사용해 GROUP BY 구문에 결과와 함께,
--                  단계별 소계, 총계

[예제4-13] 부서별 사원수와 급여합계, 급여총계를 조회한다.

SELECT department_id,COunt(*),SUM(salary)
FROM employees
GROUP BY ROLLUP(department_id)
ORDER BY department_id;

SELECT department_id,COunt(*),SUM(salary)
FROM employees
GROUP BY CUBE(department_id)
ORDER BY department_id;

SELECT department_id,job_id,Count(*),SUM(salary)
FROM employees
GROUP BY ROLLUP(department_id,job_id)
ORDER BY department_id;

SELECT department_id,job_id,Count(*),SUM(salary)
FROM employees
GROUP BY cube(department_id,job_id)
ORDER BY department_id;

