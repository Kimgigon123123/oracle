-- 3장.기본함수
-- 내장함수 + 사용자 정의 함수 ==> PL/SQL (SQL을 이용한 프로그래밍 문법)
-- 함수 : 대게는 Return 값이 있다
-- 프로시저 : Return 값이 없는 함수 형태
-- 프로그래밍 언어에서 사용하는 함수와 비슷하다
-- 자주 사용하는 기능을 함수로 정의하여 만들어둔 뒤, 필요할때 마다 호출한다.
-- 예) 전체 사원의 급여 평균을 조회 ==> AVG()
-- 예) sal_avg() : 사용자 정의 함수 만들수 있는데..수학/삼각/재무/통계 함수는 대게 제공함.
-- 기본적으로 사용자 정의 함수는 기본함수에 없는 특별한 처리와 결과값 반환을 위해 만듦.(PL/SQL)

-- 기본함수 : 행 당 하나의 결과를 반환하는 "단일 행" 함수
-- 함수에서 사용하는 파라미터, 값의 유형에 따라 함수를 구분한다.
-- 함수의 종류 : 숫자/문자/날짜/변환/일반 함수

-- ※ 모든 함수를 교재에서 다룬것은 아님!!
-- 3.1 숫자함수
-- 3.1.1 ABS() : 절대값으로 반환하는 함수
-- dual : 가짜 테이블
SELECT ABS(32) ,ABS(-32)
FROM DUAL;


-- 3.1.2 SIGN() : 부호 (음수,양수,0)
SELECT SIGN(32),SIGN(-32),SIGN(0)
FROM dual;


-- 3.1.3 ROUND(n [,i]) : 반올림 함수 ..n을 소수점 i번째 자리로 반올림한 결과를 반환하는 함수

SELECT (100+90+75)/3 avg1,
        ROUND(88.33333333333333333333333333333333333333) avg2,
        ROUND(88.33333333333333333333333333333333333333, 2) avg3,
        ROUND(88.33333333333333333333333333333333333333, 0) avg4
FROM    dual;

-- i가 음수인 경우, 정수부 i번째 자리에서 반올림
[예제 3-3]
SELECT ROUND(123.45678) avg1,
        ROUND(123.45678,1) avg2,
        ROUND(123.45678, 0) avg3,
        ROUND(123.45678, -1) avg4
FROM    dual;

--3.1.3 TRUNC(n,[,i] : 버림 함수 .. 기본적으로 ROUND와 같다.
[예제 3-5]
SELECT TRUNC(123.45678) T1,
        TRUNC(123.45678,0) T2,
        TRUNC(123.45678,2) T3,
        TRUNC(123.45678,-2) T4 --정수부 i번째 자리에서 버림
FROM dual;

--3.1.4 CEIL(n) : n과 같거나 큰 가장 작은 정수, (단어 뜻 : 천정, 올림 ?)
[예제3-6]
SELECT CEIL(0.12345) CEIL1, CEIL(123.45) CEIL2
FROM DUAL;
--3.1.5 FLOOR(n) n과 같거나 작은 가장 큰 정수 (단어 뜻 : 바닥, 내림)
SELECT FLOOR(0.12345) FLOOR1, FLOOR(123.45) FLOOR2
FROM DUAL;

--3.1.6 MOD(m,2) : m을 n으로 나눈 나머지 값을 반환하는 함수
-- % : LIKE 연산자와 함께 '여러 문자열' 찾는 패턴의 기호로 사용됨.
[예제3-8]
SELECT MOD(17,4) MOD1,
        MOD(17,-4) MOD2,
        MOD(-17,-4) MOD3,
        MOD(17,0) MOD4
FROM dual;

-- 0으로 나누는 쿼리 ==> Zero Divide 에러 발생가능!

[연습문제 3-1]
SELECT employee_id,first_name,salary, ROUND(salary*1.15) AS "Increased Salary",department_id
FROM employees
WHERE department_id IN(100,110);

-- 3.2 문자함수
-- 3.2.1 CONCAT(char1,char2) : 두 문자열 char1, char2를 연결하여 반환하는 함수
-- || : 문자열 연결 연산자

[예제3-9]
SELECT CONCAT('Hello','Oracle') CONCAT1,
        'Hello'||'Oracle' CONCAT2
FROM dual;

-- 3.2.2 INITCAP(char) : 알파벳 단어 단위로 첫 글자를 대문자화 하여 반환하는 함수

--3.2.3 UPPER (char) : 알파벳을 모두 대문자화 하여 반환하는 함수
--3.2.4 LOWER (char) : 알파벳을 모두 소문자화 하여 반환하는 함수

[예제3-10]
SELECT INITCAP('i am a boy') CAP1,
        UPPER('i am a boy') CAP2,
        LOWER('i am a boy') CAP3
FROM dual;


--3.2.5 LPAD(char1,n [,char2])
--3.2.6 RPAD()
-- ※ LPAD는 왼쪽에 공백/문자열(char2) 채우고, RPAD는 오른쪽에 공백/문자열(char2)을 채워 반환한다.
-- ※ n : 전체 문자열 길이 (n 생략시, 기본값으로 공백문자 1개가 지정된다)
-- ※ 업무상 추가보다는 제거할 일이 훨씬~ 많다.

[예제3-11]
SELECT LPAD('abc',7) AS LPAD1,
        LPAD('abc',7,'*') AS LPAD2,
        RPAD('abc',3)||']' AS RPAD3,
        RPAD('abc',7,'*') AS RPAD4
FROM dual;

--p.23
--3.2.7 LTRIM(char1 [,char2]) : 문자열 char1에서 char2로 지정한 문자를 제거한 결과를 반환한다.
--3.2.8 RTRIM()

[예제3-12]
SELECT '['||LTRIM('   ABCDEFG ')||']' LTRIM1,
        LTRIM('ABCDEFG','AB') LTRIM2,
        LTRIM('ABCDEFG','BA') LTRIM3,
        LTRIM('ABCDEFG','BC') LTRIM4
FROM dual;
[예제 3-13]
SELECT '['||RTRIM('   ABCDEFG   ')||']' RTRIM1,
        RTRIM('ABCDEFG','FG') RTRIM2,
        RTRIM('ABCDEFG','GF') RTRIM3,
        RTRIM('ABCDEFG','BC') RTRIM4
FROM dual;

--3.2.9 TRIM([LEADING, TRAILING, BOTH] [,trim_char] [FROM] char) : 문자열 char의 왼쪽(LEADIMG)이나
-- 오른쪽 (TRAILING) 또는 양쪽 (BOTH)에서 지정된 (=제거할) trim_char 문자를 제거한 결과를 반환하는 함수
-- 방향 : LEADING(=left),TRAILING(=right),BOTH(=left and right) (기본값은 생략시 BOTH 기본값 = 양쪽 제거)

[예제3-14]
SELECT '['|| TRIM('             ABCDEFG                ')||']' TRIM1,
        '['|| LTRIM('             ABCDEFG                ')||']' TRIM2,
        '['|| RTRIM('             ABCDEFG                ')||']' TRIM3,
        '['|| TRIM(LEADING 'A' FROM 'ABCDFG')||']' TRIM4,
        '['|| TRIM(TRAILING 'G' FROM 'ABCDEFG')||']' TRIM5,
        '['|| TRIM(BOTH '1' FROM '1ABCDEFG1')||']' TRIM6,
        '['|| TRIM('1' FROM '1ABCDEFG1')||']' TRIM7
FROM dual;



--3.3.0 SUBSTR(char,position [,length]):문자열의 일부를 추출/분리해서 반환하는 함수
-- char : 지정된 문자열
-- position : 지정된 위치, 값을 0으로 명시할 경우 1로 적용 (=문자열의 첫번째 자리)
--length : 길이,갯수 --> length  생략시 문자열의 끝까지


[예제3-15]
SELECT SUBSTR('You are not alone',9,3) SUBSTR1, --9번쨰 위치부터 3개 분리해서 반환
        SUBSTR('You are not alone',5) SUBSTR2, --(length 생략시) 5번째 위치에서 끝까지 분리해서 반환
        SUBSTR('You are not alone',0,3) SUBSTR3, -- position을 0 으로 명시하면 1로 기본값
        SUBSTR('You are not alone',-9,3) SUBSTR4,
        SUBSTR('You are not alone',-5) SUBSTR5
        
        --======================================
        --position 값이 음수일 경우 그 위치가, 오른쪽부터 시작된다
        --============================================
        
        
        
        
FROM dual;


SELECT SUBSTR('admin@hanul.co.kr',0,5) EMAIL_ID,
        SUBSTR('admin@hanul.co.kr',6) EMAIL_DOMAIN,
        SUBSTR('062-362-7797',0,3) LOCAL_NUMBER,
        SUBSTR('062-362-7797',5) RAMAINDER_NUMBER
FROM DUAL;

--3.3.1 REPLACE(char,search_string [,replace_string]): 문자열중 일부를 다른 문자열로 변경하여 반환
--char : 문자열
--search_string : 찾을 문자열
-- replace_string : 변경할 문자열. 생략할 경우, NULL이 오면 search-string 문자열을 제외한 결과를 반환한다.

[예제3-17]
SELECT REPLACE('You are not alone', 'You','We') REP1,
        REPLACE('You are not alone','not') REP2, -- replace_str 생략, search_str 제외한 char 반환
        REPLACE('You are not alone','not',null) REP3
FROM dual;

--3.3.2 TRANSATE() : from_string에서 해당하는 문자를 찾아 to_string 해당하는 문자로 1:1 변환하여 반환
[예제3-18]
SELECT TRANSLATE('u! You are not alone.','You','We') TRANS
FROM dual;

--퀴즈
SELECT REPLACE('너는 나를 모르는데 나는 너를 알겠느냐','너','나') quiz1
FROM dual;

SELECT TRANSLATE('너는 나를 모르는데 나는 너를 알겠느냐', '나너','너나') quiz2
       
from dual;

--3.3.3 INSTR(char, search_string [,position]) : 문자열에서 특정 문자열의 시작위치를 반환한다
-- char : 문자열
--search_string : 찾을 문자
-- position: 문자열을 찾는 시작 위치, 생략시 기본값 1이다.
--_th : 몇번째 문자열인지, 생략시 기본값 1
-- ※ 문자열의 position 위치에서부터 특정 문자를 찾기 시작해 _th번째에 해당하는 시작 위치를 반환 하는 함수
--찾을 문자열이 발견되지 않으면 0을 반환
-- 찾을 문자열이 발견되면 해당 위치값을 반환

[예제 3-19]
SELECT INSTR('EVERY sha-la-la-la','la') INSTR1,
        INSTR('EVERY sha-la-la-la','la',7) INSTR2,
        INSTR('EVERY sha-la-la-la','la',1,2) INSTR3,
        INSTR('EVERY sha-la-la-la','la',12,2) INSTR4,
        INSTR('EVERY sha-la-la-la','la',15,2) INSTR5

FROM dual;


--3.3.4 LENGTH(char) : 문자열의 길이를 반환한다

[예제3-20]
SELECT LENGTH('Every Sha-la-la-la') LEN1
FROM dual;

-- 3.3 날짜함수(p.27)
-- 날짜와 더불어 시간을 연산 대상으로 한다.

-- 3.3.1 SYSDATE()
-- SYSDATE() : 엄청 자주, 일반적으로 쓰는 함수 --> STSDATE로 표기
-- 시스템의 현재 날짜를 가져와 반환하는 함수
-- 이 날짜는 시각을 포함하고 있다.
-- STSDATE 함수는 다른 함수와 다르게 파라미터가 없다. ()를 사용하지 않는다

SELECT SYSDATE
from dual; --23/05/09 <==> 시스템 날짜 형식 : RR/MM/DD
--RR 표기법 : 50 이상이면 1900년대, 50미만 이면 2000년대 표기
-- 99/05/09 ==> 1999/05/09
-- 03/05/09 ==> 2003/05/09

-- 날짜 형식(Format)을 확인 하는 SQL
SELECT *
FROM v$nls_parameters;-- : 공용뷰 (누구나 쓸수)
--NLS_DATE_FORMAT : RR/MM/DD --> YY/MM/DD, YYYY/MM/DD, YY/MM/DD HH:MI:SS ... [날짜/시간 형식 지정]

--일시적으로 날짜 포맷을 기존:날짜 --> 변경 : 날짜+시간 형식으로 변경
--영구적인 설정 x, 현재 로그인된 HR 세션에서만 유효!
-- 도구 > 환경설정 > 데이터베이스 > NLS : 날짜 포맷
ALTER SESSION SET nls_date_format = 'RR/MM/DD HH24:MI:SS';
ALTER SESSION SET nls_date_format= 'RR/MM/DD';

SELECT SYSDATE
FROM dual;
--===========================================
--설정을 매번 바꾸어서 날짜,시간을 출력하는 것은 불편하므로,
--날짜 함수를 사용하여, 그때 그때 원하는 형식으로 출력하는 편이 낫다
--================================================
SELECT SYSDATE,
    TO_DATE('2023-05-09 17:32:20', 'RR/MM/DD HH24:MI:SS') SYSDATE_TIME
FROM dual;

    
-- 테이블 / table (객체) : 데이터를 저장
-- 뷰 / view (객체) : 테이블의 일부만 추출해서 마치 테이블 처럼 사용(조회|저장..)
-- HR 계정, EMP_DETALS_VIEW (사원_세부정보 담은 뷰)
SELECT *
FROM EMP_DETAILS_VIEW; -- 뷰를 조회! (임시 뷰 - 메모리에서 존재)

--3.3.1 ADD_MONTHS(date,n) : date에 개월수 n을 더해서 그 결과 (날짜)를 반환하는 함수
--n : integer
[예제3-21]
SELECT ADD_MONTHS(SYSDATE,1) MONTH1,
        ADD_MONTHS(SYSDATE,2) MONTH2,
         ADD_MONTHS(SYSDATE,-3) MONTH3
FROM dual;


--3.3.2 MONTHS_BETWEEN(date1, date2) : 두 날짜 사이의 개월수를 구하여 반환하는 함수
--date1 : 이후 날짜
--date2 : 이전 날짜
-- ※ date1 - date2 형식으로 계산

[예제3-22]
SELECT ROUND(MONTHS_BETWEEN('2013-03-20',SYSDATE)) AS REMAINED,
        ABS(TRUNC(MONTHS_BETWEEN(SYSDATE, '2013-08-28'))) AS PASS
FROM dual;

--3.3.3 LAST_DAY(date) : date에 해당하는 달의 마지막 날짜를 반환한다.
-- 3월이면 31반환, 4월이면 30반환
-- 오늘 날짜 5월은 31일!
-- 매월 말 보고서를 자동으로 생성하거나, 관련 데이터(비용 지출 내역?)등을 월말 보고로 자동생성하는
-- 서비스를 생성하거나 하는 기능에서 필요할 수 있는 함수
SELECT LAST_DAY(SYSDATE) Last1,
        LAST_DAY('2013-03-20') Last2
FROM dual;

SELECT employee_id, first_name,hire_date
from employees;

--3.3.4 NEXT_DAY(date,char) : date 이후 날짜중에 char로 명시된 첫번째 일자를 반환하는 함수
--                            돌아오는 요일(char)의 날짜를 반환하는 함수
-- NLS : 언어 설정이 KOREAN (요일 : SUNDAY,MONDAY... <---> 일요일, 월요일 ...)

[예제3-24]

SELECT NEXT_DAY(SYSDATE,'월요일') NEXT1,
        NEXT_DAY(SYSDATE,'금요일') NEXT2,
        NEXT_DAY(SYSDATE,'일') NEXT3,
        NEXT_DAY(SYSDATE,'화') NEXT4,
        NEXT_DAY(SYSDATE,4) NEXT5
FROM dual;

--NLS 설정 : 한국에서 오라클 설치 ==> 자동으로 KOREAN, 요일명도 한글로!

SELECT *
FROM v$nls_parameters; -- NLS_LANGUGE : KOREAN, 요일명도 한글로!

-- 도구 > 환경설정 > 데이터베이스 > NLS - 날짜언어 : KOREAN

--3.3.5 반올림함수, 버림함수
-- ※ 숫자,날짜에도 적용가능한 함수, 하지만! 평소에는 숫자에.. 어떤 특정 업무? 특수한 직무에서 사용할 수 있음.
-- 특수한 직무에서 사용할 수 있음. (함수의 특징으로만 구분)
--ROUND(n [,i]), ROUND(date,fmt) : 반올림 함수, 
--TRUNC(n [,i]), TRUNC(date,fmt) : 버림 함수


[예제3-25]
-- 자동형변환(=묵시적 형변환)
SELECT 10 + '5'
FROM dual; -- 15로, 알아서 변환해서 연산한 결과 15를 반환

SELECT 10+'ABCD'
FROM dual; -- ORA-01722: 수치가 부적합합니다 ==> 숫자라고 판단할수 있는 문자데이터는 형변환




-- YYYY or RRRR : 년도를 4자리로 표현
SELECT ROUND(TO_DATE('2013-06-30'),'YYYY') AS R1,
        ROUND(TO_DATE('2013-07-01'),'YEAR') AS R2,
        ROUND(TO_DATE('2013-12-15'),'MONTH') AS R3,
        ROUND(TO_DATE('2013-12-16'),'MM') AS R4,
        ROUND(TO_DATE('2013-05-27 11:59:59','YYYY-MM-DD HH24:MI:SS'),'DD') AS R5
from dual;

[예제3-26]
SELECT  TRUNC(TO_DATE('2013-06-30'),'YYYY') AS R1,
        TRUNC(TO_DATE('2013-07-01'),'YEAR') AS R2,
        TRUNC(TO_DATE('2013-12-15'),'MONTH') AS R3,
        TRUNC(TO_DATE('2013-12-16'),'MM') AS R4,
        TRUNC(TO_DATE('2013-05-27 11:59:59','YYYY-MM-DD HH24:MI:SS'),'DD') AS R5
from dual;

-- 3.4 변환함수 (p.30)
-- 오라클은 묵시적인 형변환 ==> 숫자+'숫자' (ok), 숫자+'문자' (no!)
-- 명시적인 형변환 함수들 3가지!! (기본 사용법, 형식)
-- 형변환 : 강제로, NUMBER --> DATE 바로 변환x
--            TO_NUMBER()            TO_DATE()
-- NUMBER <---------------- CHAR  <--------------- DATE
--   3rd                     1rd                    2rd
--         --------------->     ------------------->
--            TO_CHAR()               TO_DATE()


--3.4.1 TO_CHAR(date [,fmt])
-- 년,월,일,시,분,초 형식
-- * 밀리세컨드 ==> 출퇴근 기록부(?) + SYSTIMESTAME or ????

SELECT SYSDATE 현재시간날짜,SYSTIMESTAMP 현재시간날짜밀리세컨즈_GMT표준시
FROM dual;

-- ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD HH:MI:SS' ; -- 이것보다는 가급적이면 변환함수!!
[예제3-27]

SELECT  TO_CHAR(SYSDATE,'YYYY-MON-DD') AS R1,
        TO_CHAR(SYSDATE,'RR/MM/DD HH:MI:SS') AS R2,
        TO_CHAR(SYSDATE,'YY-MM-DD DAY') AS R3
       
FROM dual;


--3.4.2 TO_DATE()

[예제3-30]
SELECT TO_DATE('2013-05-27') DATE1,
      TO_DATE('2013-06-27 11:12:35','YYYY/MM/DD HH:MI:SS AM') DATE2
FROM dual;
--3.4.3 TO_NUMBER()
[예제3-29]
SELECT TO_NUMBER('12345')+1000 "문자를 숫자로1",
        TO_NUMBER('123.45') "문자를 숫자로2"
FROM dual;

--To_DATE() : 문자를 날짜 형식으로 변환하는 함수
--TO_CHAR() : 문자로 바꾸는 함수
--TO_NUMBER() : 숫자로 바꾸는 함수

-- 3.5 일반함수

--NULL 관련 함수
--3.5.1 NVL(exp1, exp2)
-- NVL의 파라미터인 exp1, exp2는 데이터 유형이 서로 같아야 한다.

[예제3-31]
SELECT employee_id,first_name,salary,NVL(commission_pct,0) AS "수수료", salary*commission_pct comm
from employees
WHERE salary*commission_pct<1000;

[예제3-32]
SELECT employee_id,first_name,salary,NVL(commission_pct,0) AS "수수료", salary*NVL(commission_pct,0) comm
from employees
WHERE salary*NVL(commission_pct,0)<1000;


--3.5.2 NVL2(exp1, exp2, exp3)

[예제3-33]
SELECT employee_id,first_name,NVL(commission_pct,0),
        NVL2(commission_pct,salary*(1+commission_pct),salary) AS "total_salary"
FROM employees;


--3.5.3 COALESCE(exp1, exp2, exp3, ...)

[예제3-35]
SELECT COALESCE('A','B','C',NULL) first,
        COALESCE(NULL,'B','C',NULL) second,
        COALESCE(Null,null,'C',null) third
FROM dual;


--3.6 DECODE와 CASE
--보통 조건에 따른 처리, IF~ELSE / SWITCH(case) ..
-- 오라클에서는 조건에 따른 처리 ==> 함수 DECODE
-- 오라클 PL/SQL(SQL 프로그램) 에서는 IF~ELSE 있음


-- 3.6.1 DECODE(exp,search1,result1, search2,result2, ... [,default]): IF~ELSE 처럼 exp를 검사하여
-- search1과 일치하면 result1 반환, search2와 일치하면 result2 반환, ... 일치하는게 없으면

[예제3-36] 보너스 지급에 있어, 20번 부서는 20%       (salary의 20%)
                               30번 부서는 30%
                               40번 부서는 40%
                               그외 부서는 0(=지급하지 않는다)

SELECT employee_id,first_name,salary,department_id,
DECODE(department_id,20,salary*0.2,
                     30,salary*0.3,
                     40,salary*0.4,
                     0) AS "보너스"
FROM employees
ORDER BY 5;



-- 3.6.2 CASE : 함수라기 보다 더 큰 개념을 가진 표현식이다.
-- 동등비교, 범위비교 (크다,작다..)

--CASE exp WHEN search1 THEN result1
--         WHEN search2 THEN result2
--         ...계속...
--         [ELSE default]
--END



--CASE     WHEN condition1 THEN result1
--         WHEN condition2 THEN result2
--         ...계속...
--         [ELSE default]
--END


[예제3-37] 보너스 지급에 있어, 20번 부서는 20%       (salary의 20%)
                               30번 부서는 30%
                               40번 부서는 40%
                               그외 부서는 0(=지급하지 않는다)

SELECT employee_id,last_name,department_id,salary,
        CASE department_id WHEN 20 THEN salary*0.2
                           WHEN 30 THEN salary*0.3
                           WHEN 40 THEN salary*0.4
                           ELSE 0
        
        END AS bonus
FROM employees;


-- 동등비교일때는 DECODE()와 CASE ~ END를 동일하게 처리
SELECT employee_id,last_name,department_id,salary,
        CASE    WHEN department_id=20 THEN salary*0.2
                WHEN department_id=30 THEN salary*0.3
                WHEN department_id=40 THEN salary*0.4
                ELSE 0
        
        END AS bonus
FROM employees;

--보너스 지급에 있어서 30번 미만 부서는 급여의 10%를 보너스로 지급,
--                    30번부터 50번 부서까지는 급여의 20%를 보너스로 지급,
--                    60번부터 80번 부서까지는 급여의 30%를 보너스로 지급하고,
--                    그 외의 부서는 40%를 지급한다고 할때,
--                CASE 표현식을 이용해, 전 사원의 정보와 보너스 금액을 조회하시오.
                
SELECT employee_id,last_name,department_id,salary,
        CASE WHEN department_id<30 THEN salary*0.1
             WHEN department_id BETWEEN 30 AND 50 THEN salary*0.2
             WHEN department_id BETWEEN 60 AND 80 THEN salary*0.3
             ELSE salary*0.4
        END AS "보너스"
FROM employees;
            


-- 고급함수 : 데이터 사이언티스트(DS),데이터 분석가(DA) 들이 사용하는 함수