
--HR 스키마에 있는
--1.데이터가 담긴 테이블 구조를 조회 명령
-- DESC 테이블명;
-- DESCRIBE 테이블명;
-- describe 테이블명;
-- 대,소문자 구분하지 않음
-- ※왼쪽 접속창 [+] 누르면 같은 기능! (구조를 확인)


desc departments;

-- 나머지 테이블을 모두 조회해보세요!


--2. 데이터를 조회하는 SELECT
-- SELECT * FROM 테이블명;
SELECT * FROM employees;
SELECT * FROM departments;

/* SELECT*
  FROM   테이블명;
  */
  --※ 왼쪽 접속에서 각 테이블을 더블클릭하고 , [데이터]칼럼을 클릭하면 같은 기능!
  
  desc JOB_HISTORY;
  select *
  from EMPLOYEES;
  
  /*
  =================================
  HR 스키마에 있는 테이블 (=오라클 데이터베이스 객체중 하나)
  ==============================================
  이름              정보
  ---------------------------------------------------
  COUNTRIES     국가/나라 정보(국가ID/코드, 이름, 지역ID/코드)
  Departments    부서정보(부서 코드, 부서 이름, 담당자코드, 위치코드)
  EMPLOYEES       사원 정보(사원코드, 이름, 성, 이메일, 전화번호, 입사일, 업무 코드, 급여,커미션율(퍼센트),담당자 코드,부서코드)
  JOB_HISTORY       
  JOBS
  LOCATIONS
  REGIONS   
  */
  
  
  
  
  --2.1 테이블 구조
  -- 오라클 (데이터베이스 관리 시스템)이 데이터를 2차원 구조(표, table의 행과 열로)로 기본적으로 저장
  -- 테이블 : 어떤 정보가 있는데 <---> 데이터베이스 : 관계(Relation)
  -- ex> (회사) 부서 정보 테이블, 사원 정보 테이블
  /*
  사원 정보 테이블
  사원 코드 사원 이름(성,이름) 부서    입사일      급여 ....
  ------------------------------------------------
  1        길동 홍           IT     23-02-01    2000000
  1        길동 홍           IT     23-02-01    2000000
  1        길동 홍           IT     23-02-01    2000000
  1        길동 홍           IT     23-02-01    2000000
  1        길동 홍           IT     23-02-01    2000000
  
  고객 정보 테이블
  고객 코드       고객명     등급       연락처       근무지
  1000           이순신       우수    010.123.456     광주
  1000           이순신       우수    010.123.456     광주
  1000           이순신       우수    010.123.456     광주
  1000           이순신       우수    010.123.456     광주
  */
  
  
  --※ Document : 행,열 구조가 아님 vs RDBMS : 테이블(행,열)
  
  /*
  
  ↓ 열 (COlumn) : 가로 방향 [열 이름(=특성), 열의 자료형(문자,숫자,날짜..),길이]
  이름              널?       유형          <------- 행(ROW), 세로 방향         
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)    


  
  */
  
  
  --대소문자 구별 x 
  -- 띄어쓰기, TAB을 사용해서 가독성 있게!
  -- 쿼리는 절(clause) 단위로 작성
  -- 자동완성 지원함! 근데, 직접 쿼리작성이 빠름!
  
  
  
  --2.1 DESC / DESCRIBE : 테이블 구조 ==> 열 이름, 자료형 (저장할 수 있는 데이터) 길이 확인
  --        SELECT : 데이터를 조회 ==> 테이블의 레코드 (ROW 또는 Tuple/튜플)
  
  
SELECT *           -- SELECT절
FROM employees;  --FROM 절
--계속 뭔가가 추가..

-- 2.2 조건절
-- 필요한 정보만 조회하기 위한 구문, 일종의 필터링!
SELECT 열 이름1, 열이름2, 열이름3,...
FROM 테이블명;

-- *: 애스터리스크, ALL (모든컬럼)
SELECT * 
FROM countries; -- 25rows

SELECT *
FROM departments; -- 27 rows

[예제 2-3] 80번 부서의 사원정보를 조회 ==> 80번 부서에 근무하는 사원들을 필터링!
-- ctrl + enter or 블럭씌우고 +F5
SELECT *
FROM employees -- 108 rorws
WhERE department_id = 80; -- 총 107명중 80번 부서에 근무하는 사원은 34명(rows)
-- 오라클 연산자 : =(같다),대입x

--80번 부서의 부서이름을 조회하시오!
SELECT *
FROM departments
where department_id = 80; -- sale 부서 : 판매 부서 --> 소속이 많이 필요한 부서

--Sales 부서(80)가 위치한 위치정보를 조회해보시오! (도로주소, 우편번호,국가코드)
-- LACATION_ID를 찾아서, LOCATIONS 테이블에 LOCATION_ID가 일치한 정보

SELECT location_id "위치코드", department_id "부서코드" -- 별칭(Alias) : 컬럼의 이름을 약어로 표시
FROM departments
--WHERE department_id=80; -- 부서코드로 필터링
--WHERE department_name = 'Sales'; -- 부서이름으로 필터링

where department_name='Sales'; --문자는 '로 작성, 대/소문자를 구분[날짜 데이터도 '로]

-- 위치정보를 찾아보면,
SELect city, street_address,postal_code
FROM locations
Where location_id=2500;


SELECT *
FROM job_history; -- 10rows

SELECT *
FROM jobs; -- 19rows

SELECT *
FROM locations; --22rows

SELECT *
FROM regions; -- 4rows

-- 미국의 어떤 회사의 정보 : 회사에 근무하는 사원을 중심으로 이들이 소속된 부서, 하는 업무, 지역(국가/대륙)등
-- 지역(국가/대륙)등의 정보 [작은규모, 학습용 데이터/실제 데이터 x]

/*
    WHERE 조건절을 구성하는 항목의 분류(p.5)
    1) 칼럼명, 숫자, 문자/날짜
    2) 산술(+,-,*,/), 비교연산자(=,<=,<,>,>=) 부정(!=,<>,^=)    
    3)AND, OR, NOT
    4)LIKE, IN, BETWEEN, EXISTS
    5) IS NULL, IS NOT NULL
    6)ANY, SOME, ALL
    7) 함수


--2.3연산자
--2.3.1 산술 연산자: +,-,*,/
-- MOD(젯수,피젯수) : % 대신 사용하는 함수
--산술연산자는 SELECT 목록과 조건절에 사용할 수 있습니다.


*/
SELECT 2+2 "합"
FROM dual; -- 4
-- 실제 존재하지 않는 테이블 dual, 단순히 산술 연산이나 시스템 날짜 출력하거나 함수를 실행, 반환값 확인

SELECT 2-1 "차"
FROM dual;
--실제로 DB에서는 기본적으로 오라클 객체를(=테이블) 대문자로 작성하는데,
-- 소문자 테이블명으로 작성하려면 생성할때 "소문자"로 명령을 처리!
-- 0942. 00000 -  "table or view does not exist"


SELECT 2*4 AS 곱
FROM dual;

--약어 사용시 AS: 생략 가능하지만, SELECT절이 복잡해지면 가독성 측면에서 AS를 추가하는 개발자가 많다라는 통계가 있음!!

SELECT 2*4 AS 곱, 2-1 AS 차, 2/3 "몫"
FROM dual;


--2) WHERE 조건절
SELECT employee_id, last_name, salary ,salary*12 AS 연봉, department_id
FROM employees
WHERE salary*12 > 100000;

[예제 2-4] 80번 부서 사원의 한 해동안 받은 급요를 조회한다.
SELECT employee_id AS 사번 ,last_name AS 성,salary*12 "연봉"
FROM employees
where department_id = 80; -- sales 부서, 34rows

[예제 2-4] 한 해 동안 받은 급여가 120000 ( $,USD ) 인 사원정보를 조회한다
-- NLS 설정상 " 자동으로 오라클이 WON으로 설정 되어 있음.
-- 다만, hr 스키마의 데이터는 영문 데이터로 자연스럽게 USD로 추측할 수 있음.
SELECT employee_id AS 사번, last_name AS 성, salary*12||'$' "연봉",department_id "부서코드"
FROM employees
where salary*12 = 120000; -- 연봉정보가 저장된 칼럼은 없지만 , salary 칼럼에 12를 곱해서 연봉정보를 조회,비교

--2.3.2 연결 연산자
--문자열 연결 연산자 : ||
--문자열 연결 함수 : CONCAT()
-- 문자 데이터, 숫자 데이터 : '로 묶음

SELECT employee_id AS 사번, last_name||first_name AS 이름, salary*12||' '||'$' "연봉",department_id "부서코드"
FROM employees
where salary*12 = 120000; 

[예제2-6] 사번이 101번인 사원의 성명을 조회한다
SELECT employee_id "사번", last_name||' '||first_name  AS 성명,salary*12 AS 연봉,job_id,department_id
FROM employees
WHERE employee_id=101;

-- 90번 부서
SELECT department_name
FROM departments
WHERE department_id = 90; -- 경영진

--컬럼의 별칭(Alias) : 컬럼에 별칭, 약어를 붙여 사용할 수 있다.
--1) 컬럼명 (공백) 별칭 : ' '
--2) 키워드 AS 또는 as 사용 -- 가독성 측면에서는 SELECT 절이 복잡해지면 AS를 추가하는 경우!
--3) 큰 따옴표를 사용할 수 있다.(보통생략)  , 단! 컬럼명에 공백을 포함할 경우는 반드시 큰 따옴표로 묶을것!

[예제 2-8] 사번이 101번인 사원의 성과 한해 동안 받은 급여를 조회한다.
-- 성: name 이라는 별칭
-- 한해 동안 받은 급여 : ANNUAL SALARY 라는 별칭

SELECT employee_id AS 사번, last_name 성, salary*12 AS "ANNUAL SALARY"
FROM employees
WHERE employee_id=101;

--2.3.3 비교 연산자 (p.6)
-- 값의 크기를 비교 : =, >=, > , >, <=
[예제 2-9] 급여가 3000이하인 사원의정보를 조회한다
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary<=3000;



[예제2-10] 부서코드가 80번 초과인 사원의 정보를 조회한다.
-- 부서코드 : department_id
-- 사원코드 : employee_id
-- 업무코드 : job_id
-- 부서장코드 : manager_id

SELECT *
FROM   employees
WHERE department_id>80; -- 90번 부터 나머지 부서들 ~ 11rows

--departments 데이터를 확인!
SELECT *
FROM departments; -- 27 rows, 10~270 부서코드


-- 문자 데이터, 날짜 데이터는 작은 따옴표(')로 묶어서 표현해야 합니다.
-- 문자데이터는 대,소문자를 구분합니다.

SELECT *
FROM employees
WHERE last_name = 'Chen';

SELECT employee_id,last_name,hire_date
FROM employees
WHERE hire_date <'05/09/28'; -- 년/월/일 : 먼저, 나중에 입사한 사람들 정보

[예제 2-11] 성이 King인 사원의 정보를 조회한다.

SELECT *
FROM employees
WHERE last_name='King';

[예제 2-12] 입사일이 2004년 1월 1일 이전인 사원의 정보를 조회한다

SELECT department_id,employee_id,last_name,hire_date
FROM employees
WHERE hire_date < '04/01/01';


--2.3.4 논리조건 연산자 (p.8)
-- 조건의 갯수는 여러개가 올 수 있다.
-- 여러 조건이 있을 경우 각각의 조건들을 AND, OR 연산자를 이용해 연결한다.

--NOT + BETWEEN 연산자, IN 연산자, LIKE 연산자

[예제 2-13] 30번 부서 사원 중 급여가 10000 이하인 사원의 정보를 조회
-- 사원의 정보는 : EMPLOYEES 테이블
-- EMPLOYEE_ID ~ DEPARTMENT_ID : 각종 사원의들의 정보중 어떤 특정 컬럼들이 존재
-- 부서정보는 DEARTMENTS에 있으나, 사원들은 부서 10~110번까지 소속되어 있음

SELECT employee_id, first_name||''||last_name AS 이름,salary,department_id
FROM employees
WHERE department_id=30 
AND salary<=10000;

[예제2-14] 30번 부서 사원 중 급여가 10000 이하이면서 입사일자가 2005년 이전에 입사한 사원의 정보를 조회
SELECT employee_id, first_name||''||last_name AS 이름,salary,department_id
FROM employees
WHERE department_id=30 
AND salary<=10000
--AND hire_date < '2005/01/01' ;
AND hire_date < '2005-01-01'; -- '01-JAN-05' : 1일 - 1월 - 2005년도 

-- NLS: National Language Support (동아시아-한국/중국/일본) RR/MM/DD 
-- DATE : 날짜, 표현할때 YY(Year) vs RR(50 이상은 1900년대, 50미만은 2000년대 표기법)

[예제 2-15] 30번 부서나 60번 부서에 속한 사원의 정보를 조회하시오

SELECT employee_id,first_name||''||last_name name,hire_date,salary,phone_number,email,department_id
FROM employees
WHERE department_id = 30
OR department_id=60;



--AND, OR 조건이 혼합되어 사용되는 경우 가독성을 위해 괄호를 붙여주는 것이 좋다

--2.3.5 논리조건 연산자 (p.9)
--범위 조건 연산자 BETWEEN  초기값 (이상) AND 마지막값(이하);
[예제2-18] 사번이 110번 부터 120번 까지의 사원 정보를 조회하시오
--100번부터 206명까지 총 107명 근무하는 회사의 사원정보 테이블
SELECT *
FROM employees
WHERE employee_id >=110
OR employee_id <=120;


SELECT employee_id, first_name||' '||last_name AS 이름,salary,department_id
FROM employees
WHERE employee_id BETWEEN 110 AND 120;


--(p.10 하단) NOT 연산자와 BETWEEN 연산자를 사용하여 BETWEEN 초기값 AND 마지막값 과 반대되는 조건을 만든다

-- 사번이 110~120을 제외한 나머지 사원정보를 조회한다.

SELECT employee_id, first_name||' '||last_name AS 이름,salary,department_id
FROM employees
WHERE NOT employee_id BETWEEN 110 AND 120; -- NOT + 컬럼명

SELECT employee_id, first_name||' '||last_name AS 이름,salary,department_id
FROM employees
WHERE employee_id NOT BETWEEN 110 AND 120; -- NOT + NETWEEN ~

-- 두 경우 모두 같은 결과가 조회된다.
-- BETWEEN이나 관계 연산자로 비교할 수 있는 값은 1) 숫자 데이터 2) 문자 데이터 3) 날짜 데이터 이다.
-- 11g 버전에서는 NLS 설정이 없어서 문제가 안되지만, 21c 에서는 RR / MM / DD 형식을 따라서 조회하여야
-- 오류가 발생되지 않는다.
--ORA-01858: 숫자가 있어야 하는 위치에서 숫자가 아닌 문자가 발견되었습니다. 라는 오류는 무조건 날짜 형식!
--맞지 않아서 ==> 1) 대게는 변환함수 사용 해서 처리하거나 ~ 2) NLS 세팅을 확인하고 RR/MM/DD로 조회하거나
-- 도구 > 환경설정 > 데이터베이스 > NLS 확인
-- NLS 설정 확인 명령 ~
SELECT *
FROM v$nls_parameters;


-- 날짜 형식으로 변환하는 함수 : TO_DATE('날짜데이터')
--RR/MM/DD 또는 TO_DATE('날짜데이터','지정형식 YY-MM-DD HH:MI:SS')
--3장. 함수 - 변환함수 파트(p.27)


--2.3.7 IN 조건연산자(p.11)
--OR 연산자 대신 IN연산자 ==> 가독성, 간결성
[예제2-25] 30번 부서원 또는 60번 부서원 또는 90번 부서원의 정보를 조회한다.
SELECT employee_id AS emp_id, first_name||' '||last_name name, salary,department_id AS dept_id
FROM employees
WHERE department_id IN(30,60,90);

--NOT 컬럼 IN (값1,값2,값3...)
SELECT employee_id AS emp_id, first_name||' '||last_name name, salary,department_id AS dept_id
FROM employees
WHERE NOT department_id IN(30,60,90);

--컬럼 NOT IN (값1,값2,값3...)
SELECT employee_id AS emp_id, first_name||' '||last_name name, salary,department_id AS dept_id
FROM employees
WHERE department_id NOT IN(30,60,90);

SELECT employee_id AS emp_id, first_name||' '||last_name name, salary,department_id AS dept_id
FROM employees; --107rows... 14(30,60,90 부서) + 92(나머지 부서)=106... 1명은?? NULL

--2.3.8 LIKE 연산자 (p.11)
-- 칼럼값중 특정 패턴에 속하는 값을 조회할때 사용하는 문자열 패턴 연산자
--1) % : 여러개의 문자열을 나타낸다.
--2) _ : 하나의 문자열을 나타낸다.


[예제2-28] 이름이 K로 시작되는 사원 정보를 조회한다.
--문자데이터는 대,소문자를 구분 vs SQL은 대,소문자를 구분안함
--예) 'k' 와 'K'는 다른...
--last_name: 성
--first_name: 이름
SELECT *
FROM employees
WHERE first_name LIKE 'K%';

[예제2-29] 성이 s로 끝나는 사원 정보를 조회한다.
SELECT *
FROM employees
WHERE last_name LIKE '%s';
[예제2-30] 이름에 b가 들어가있는 사원 정보를 조회한다.
SELECT *
FROM employees
WHERE first_name LIKE '%b%';

desc employees;
-- ===================== 자주쓰는 오라클 자료형 ================================
-- VARCHAR2(길이) : National + VarCHAR2(10) vs VARCHAR2(10) : (한국) 30byte vs (미국) 10byte
-- VARCHAR(길이) : 일반적인 목적으로 사용하지 않고, 오라클에서 사용할 예정인 타입 ==> 우리는 사용x
-- NUMBER(길이) : 정수 데이터
-- NUMBER(총길이,소숫점이하길이):실수 데이터
--DATE : 날짜 데이터
-- ※ INT 자료형으로 컬럼을 정의하면 ==> 오라클 내부적으로 NUMBER로 변경해버림..
-- STRING 자료형으로 컬럼을 정의하면 ==>      "           NUMBER2로 변경해버림..
--빅데이터, 바이너리(=이미지,오디오,영상)==> BLOB, CLOB, BFILE 타입 


[예제 2-31] 이메일의 세번째 문자가 B인 사원정보를 조회한다
-- % : 여러문자
-- _ : 하나의 문자
SELECT *
FROM employees
WHERE email LIKE '__B%';

[예제 2-32] 이메일이 뒤에서부터 세번째 문자가 B인 사원정보를 조회한다.
SELECT *
FROM employees
WHERE email LIKE '%B__';

--LIKE 역시 IN, BETWEEN 처음값 AND 마지막 값 과 같이 NOT 연산자와 함께 사용할 수 있다.(p.14)
[예제2-33] 전화번호가 6으로 시작되지 않는 사원의 정보를 조회한다.
SELECT *
FROM employees
WHERE Phone_Number NOT LIKE '6%';

--========================================
--Q. %나 _ 자체를 문자열로 조회하고자 한다면?
--========================================
SELECT *
FROM employees
WHERE JOB_ID LIKE '%_A%';

--ESCAPE 식별자를 사용해 %나 _ 자체를 하나의 문자로 검색하게 한다.

SELECT *
FROM employees
WHERE JOB_ID LIKE '%\_A%' escape '\';

--2.3.9 NULL 조건 처리
-- NULL : 빈 값 ---> ''  / 데이터가 입력되지 않음.
SELECT *
FROM locations; 

SELECT *
FROM locations
WHERE state_province IS NULL;

SELECT *
FROM locations
WHERE state_province IS NOT NULL;

-- IS NULL : NULL인 데이터를 조회
-- IS NOT NULL : NULL이 아닌 데이터를 조회

--================LOCATIONS (부서 위치 정보 테이블)===================
-- POSTAL_CODE : 우편번호
--STATE_PROVINCE : 행정구역 (~주)


SELECT employee_id, last_name, salary, department_id, job_id,hire_date
FROM employees
WHERE commission_pct IS NULL; -- 거래 수수료를 받지 않는 사람?? 72명... 총 107명 중 35명은 받는 사람!


SELECT employee_id, last_name, salary, department_id, job_id,hire_date
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT *
FROM departments
WHERE department_id = 80;

-- commission_pct : (거래에 따른) 수수로율, 
--manager_id(매니저,관리자), department_id(부서코드)

SELECT *
FROM jobs
WHERE job_id IN ('SA_MAN','SA_REP')

--80번 부서 Sale 파트 ==> 판매부서니까 거래 수수료 (=많이 팔면, 많이 남기는 구조)
--commission_pct가 NOT NULL 인 이유!  기본급 낮되 , 수수료를 책정해서 지급하는 구조?
--      "             NULL 인 이유? 판매부서가 아님, 기본 급여가 높거나..
-- 근데 , 1명이 부서는 없으나 commission_pct 가 NOT NULL인 사람 (178 Kimberely Grant)