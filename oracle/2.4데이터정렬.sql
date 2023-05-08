--2.4 데이터 정렬
-- 많이 사용하지 않는게 좋다 == > 성능 관련 (데이터베이스 관리자, 옵티마이저(=최적화),튜너)
-- 기본적으로 해당 테이블의 식별자(=유일하게/중복되지 않는 데이터를 구분하는 어떤 값)
-- ex> 사람의 경우 주민번호 
--SELECT *
--FROM employees
--ORDER BY 컬럼명 [ASC|DESC] ;-- [] : 옵션 , ASC (=기본값)
-- ASC : Aseending / 오름차순 : 작은값 -- > 큰값
-- DESC : Descending / 내림차순 : 큰값 -- > 작은값
-- ORDER BY는 너무 많이 사용하지 않는게 되려 성능 향상에 도움된다.
-- 데이터베이스 내부에서 테이블 작성할때 기본적으로 테이블의 식별자를 기준으로 정렬 되게 해주는데,
-- 잘못 조회하게 되면 되려 조회속도가 떨어질 수 있음
-- 1) 데이터베이스 내부에서 정렬 [요즘 DB 성능이 워낙 뛰어나니까~ 권장]
-- 2) 애플리케이션 (비동기통신 -- JSON 데이터 정렬)
-- ==========================================================
-- desc or describe : 테이블의 구조 조회(=테이블의 컬럼 정의, 자료형, 길이값)
-- 정렬 : SELECT 구문 이하에서 조회된 결과의 특정 칼럼을 기준으로 값을 오름차순, 내림차순 정렬
-- ※ SELECT문의 가장 마지막에 ORDER BY를 작성한다(위치한다)



--SELECT *
--FROM employees
--order by employee_id ASC;
--WHERE 조건절; -- Wrong!!!
--
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--WHERE

[예제2-40] 80번 부서의 사원정보에 대해, 이름을 오름차순으로 정렬한다.
--오름차순 : 작은값 --> 큰값
SELECT employee_id,first_name,salary,department_id
FROM employees
WHERE department_id=80
ORDER BY first_name ASC; -- 생략가능(기본값)

[예제2-41] 80번 부서의 사원정보에 대해, 이름을 내림차순으로 정렬한다.
--내림차순 : 큰값 --> 작은값
SELECT employee_id,first_name,salary,department_id
FROM employees
WHERE department_id=80
ORDER BY first_name DESC;

[예제2-42] 60번 부서의 사원정보에 대해 년급여를 오름차순으로 정렬한다.
SELECT employee_id,first_name,salary*12 AS ANNUAL_SALARY,department_id
FROM employees
WHERE department_id=80
ORDER BY ANNUAL_SALARY;

--============================================
--ORDER BY 절에 컬럼명 또는 컬럼의 Alias(=별칭,약어)를 이용해 정렬 가능
--    "     컬럼의 위치값을 이용해
--============================================

SELECT employee_id,first_name,salary,department_id
FROM employees
WHERE department_id=80
ORDER BY 2 ASC; // = ORDER BY first_name ASC


--p.16 ORDER BY 정렬대상;
-- 정렬대상 컬럼이 1개가 아니라면?
-- 예) 이름은 오름차순, 급여는 내림차순 정렬한다면
SELECT employee_id,last_name,salary,department_id
FROM employees
ORDER BY last_name , salary DESC;
--이름과 급여를 하나의 정렬 기준으로 조합해서 정렬