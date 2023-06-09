--1. 사번이 200인 사원의 이름과 부서번호를 조회하는 쿼리문을 작성한다
SELECT last_name||' '||first_name AS NAME , department_id
FROM employees
WHERE employee_id=200;


--2. 급여가 3000에서 1500 사이에 포함되지 않는 사원의 사번, 이름, 급여 정보를 조회하는 쿼리문을 작성한다.
--(단, 이름은 성과 이름을 공백문자를 두어 합쳐서 조회한다. 예를 들어 이름이 John이고, 성이 Seo이면 John Seo 로 조회되도록한다.)

SELECT employee_id,first_name||' '||last_name AS NAME ,salary
FROM employees
WHERE NOT salary  BETWEEN 3000 AND 15000;

--3. 부서번호 30과 60에 소속된 사원의 사번, 이름, 부서번호, 급여를 조회하는데, 이름을 알파벳 순서로 정렬하여 조회하는 쿼리문을 작성한다.

SELECT employee_id,first_name,department_id,salary
FROM employees
WHERE department_id IN(30,60)
ORDER BY first_name;

--4. 급여가 3000에서 15000 사이 이면서 부서번호 30 또는 60에 소속된 사원의 사번, 이름, 급여를 조회하는 쿼리문을 작성한다.
-- (단, 조회되는 컬럼명을 이름은 성과 이름을 공백문자를 두어 합쳐 name 으로,
-- 급여는 Monthly Salary로 조회되도록한다.

SELECT employee_id,first_name||' '||last_name AS NAME, salary AS "Monthly Salary",department_id
FROM employees
WHERE (salary BETWEEN 3000 AND 15000) AND (department_id = 30 OR department_id=60);

--5. 소속된 부서번호가 없는 사원의 사번, 이름, 업무 ID를 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name, job_id
FROM employees
WHERE department_id IS NULL;

--6.커미션을 받는 사원의 사번, 이름, 급여, 커미션을 조회하는데, 커미션이 높은 사원부터 낮은 사원 순서로 정렬
-- 하여 조회하는 쿼리문을 작성한다.

SELECT employee_id,first_name,salary,commission_pct
FROM employees
WHERE commission_pct is NOT null
ORDER BY commission_pct DESC;

-- 7. 이름에 문자 z가 포함된 사원의 사번과 이름을 조회하는 쿼리문을 작성한다.

SELECT employee_id,first_name||' '||last_name AS name
FROM employees
--WHERE 절에 Alias(별칭, 약어) 사용 : X
WHERE first_name||' '||last_name LIKE '%z%';

