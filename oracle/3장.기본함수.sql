-- 3��.�⺻�Լ�
-- �����Լ� + ����� ���� �Լ� ==> PL/SQL (SQL�� �̿��� ���α׷��� ����)
-- �Լ� : ��Դ� Return ���� �ִ�
-- ���ν��� : Return ���� ���� �Լ� ����
-- ���α׷��� ���� ����ϴ� �Լ��� ����ϴ�
-- ���� ����ϴ� ����� �Լ��� �����Ͽ� ������ ��, �ʿ��Ҷ� ���� ȣ���Ѵ�.
-- ��) ��ü ����� �޿� ����� ��ȸ ==> AVG()
-- ��) sal_avg() : ����� ���� �Լ� ����� �ִµ�..����/�ﰢ/�繫/��� �Լ��� ��� ������.
-- �⺻������ ����� ���� �Լ��� �⺻�Լ��� ���� Ư���� ó���� ����� ��ȯ�� ���� ����.(PL/SQL)

-- �⺻�Լ� : �� �� �ϳ��� ����� ��ȯ�ϴ� "���� ��" �Լ�
-- �Լ����� ����ϴ� �Ķ����, ���� ������ ���� �Լ��� �����Ѵ�.
-- �Լ��� ���� : ����/����/��¥/��ȯ/�Ϲ� �Լ�

-- �� ��� �Լ��� ���翡�� �ٷ���� �ƴ�!!
-- 3.1 �����Լ�
-- 3.1.1 ABS() : ���밪���� ��ȯ�ϴ� �Լ�
-- dual : ��¥ ���̺�
SELECT ABS(32) ,ABS(-32)
FROM DUAL;


-- 3.1.2 SIGN() : ��ȣ (����,���,0)
SELECT SIGN(32),SIGN(-32),SIGN(0)
FROM dual;


-- 3.1.3 ROUND(n [,i]) : �ݿø� �Լ� ..n�� �Ҽ��� i��° �ڸ��� �ݿø��� ����� ��ȯ�ϴ� �Լ�

SELECT (100+90+75)/3 avg1,
        ROUND(88.33333333333333333333333333333333333333) avg2,
        ROUND(88.33333333333333333333333333333333333333, 2) avg3,
        ROUND(88.33333333333333333333333333333333333333, 0) avg4
FROM    dual;

-- i�� ������ ���, ������ i��° �ڸ����� �ݿø�
[���� 3-3]
SELECT ROUND(123.45678) avg1,
        ROUND(123.45678,1) avg2,
        ROUND(123.45678, 0) avg3,
        ROUND(123.45678, -1) avg4
FROM    dual;

--3.1.3 TRUNC(n,[,i] : ���� �Լ� .. �⺻������ ROUND�� ����.
[���� 3-5]
SELECT TRUNC(123.45678) T1,
        TRUNC(123.45678,0) T2,
        TRUNC(123.45678,2) T3,
        TRUNC(123.45678,-2) T4 --������ i��° �ڸ����� ����
FROM dual;

--3.1.4 CEIL(n) : n�� ���ų� ū ���� ���� ����, (�ܾ� �� : õ��, �ø� ?)
[����3-6]
SELECT CEIL(0.12345) CEIL1, CEIL(123.45) CEIL2
FROM DUAL;
--3.1.5 FLOOR(n) n�� ���ų� ���� ���� ū ���� (�ܾ� �� : �ٴ�, ����)
SELECT FLOOR(0.12345) FLOOR1, FLOOR(123.45) FLOOR2
FROM DUAL;

--3.1.6 MOD(m,2) : m�� n���� ���� ������ ���� ��ȯ�ϴ� �Լ�
-- % : LIKE �����ڿ� �Բ� '���� ���ڿ�' ã�� ������ ��ȣ�� ����.
[����3-8]
SELECT MOD(17,4) MOD1,
        MOD(17,-4) MOD2,
        MOD(-17,-4) MOD3,
        MOD(17,0) MOD4
FROM dual;

-- 0���� ������ ���� ==> Zero Divide ���� �߻�����!

[�������� 3-1]
SELECT employee_id,first_name,salary, ROUND(salary*1.15) AS "Increased Salary",department_id
FROM employees
WHERE department_id IN(100,110);

-- 3.2 �����Լ�
-- 3.2.1 CONCAT(char1,char2) : �� ���ڿ� char1, char2�� �����Ͽ� ��ȯ�ϴ� �Լ�
-- || : ���ڿ� ���� ������

[����3-9]
SELECT CONCAT('Hello','Oracle') CONCAT1,
        'Hello'||'Oracle' CONCAT2
FROM dual;

-- 3.2.2 INITCAP(char) : ���ĺ� �ܾ� ������ ù ���ڸ� �빮��ȭ �Ͽ� ��ȯ�ϴ� �Լ�

--3.2.3 UPPER (char) : ���ĺ��� ��� �빮��ȭ �Ͽ� ��ȯ�ϴ� �Լ�
--3.2.4 LOWER (char) : ���ĺ��� ��� �ҹ���ȭ �Ͽ� ��ȯ�ϴ� �Լ�

[����3-10]
SELECT INITCAP('i am a boy') CAP1,
        UPPER('i am a boy') CAP2,
        LOWER('i am a boy') CAP3
FROM dual;


--3.2.5 LPAD(char1,n [,char2])
--3.2.6 RPAD()
-- �� LPAD�� ���ʿ� ����/���ڿ�(char2) ä���, RPAD�� �����ʿ� ����/���ڿ�(char2)�� ä�� ��ȯ�Ѵ�.
-- �� n : ��ü ���ڿ� ���� (n ������, �⺻������ ���鹮�� 1���� �����ȴ�)
-- �� ������ �߰����ٴ� ������ ���� �ξ�~ ����.

[����3-11]
SELECT LPAD('abc',7) AS LPAD1,
        LPAD('abc',7,'*') AS LPAD2,
        RPAD('abc',3)||']' AS RPAD3,
        RPAD('abc',7,'*') AS RPAD4
FROM dual;

--p.23
--3.2.7 LTRIM(char1 [,char2]) : ���ڿ� char1���� char2�� ������ ���ڸ� ������ ����� ��ȯ�Ѵ�.
--3.2.8 RTRIM()

[����3-12]
SELECT '['||LTRIM('   ABCDEFG ')||']' LTRIM1,
        LTRIM('ABCDEFG','AB') LTRIM2,
        LTRIM('ABCDEFG','BA') LTRIM3,
        LTRIM('ABCDEFG','BC') LTRIM4
FROM dual;
[���� 3-13]
SELECT '['||RTRIM('   ABCDEFG   ')||']' RTRIM1,
        RTRIM('ABCDEFG','FG') RTRIM2,
        RTRIM('ABCDEFG','GF') RTRIM3,
        RTRIM('ABCDEFG','BC') RTRIM4
FROM dual;

--3.2.9 TRIM([LEADING, TRAILING, BOTH] [,trim_char] [FROM] char) : ���ڿ� char�� ����(LEADIMG)�̳�
-- ������ (TRAILING) �Ǵ� ���� (BOTH)���� ������ (=������) trim_char ���ڸ� ������ ����� ��ȯ�ϴ� �Լ�
-- ���� : LEADING(=left),TRAILING(=right),BOTH(=left and right) (�⺻���� ������ BOTH �⺻�� = ���� ����)

[����3-14]
SELECT '['|| TRIM('             ABCDEFG                ')||']' TRIM1,
        '['|| LTRIM('             ABCDEFG                ')||']' TRIM2,
        '['|| RTRIM('             ABCDEFG                ')||']' TRIM3,
        '['|| TRIM(LEADING 'A' FROM 'ABCDFG')||']' TRIM4,
        '['|| TRIM(TRAILING 'G' FROM 'ABCDEFG')||']' TRIM5,
        '['|| TRIM(BOTH '1' FROM '1ABCDEFG1')||']' TRIM6,
        '['|| TRIM('1' FROM '1ABCDEFG1')||']' TRIM7
FROM dual;



--3.3.0 SUBSTR(char,position [,length]):���ڿ��� �Ϻθ� ����/�и��ؼ� ��ȯ�ϴ� �Լ�
-- char : ������ ���ڿ�
-- position : ������ ��ġ, ���� 0���� ����� ��� 1�� ���� (=���ڿ��� ù��° �ڸ�)
--length : ����,���� --> length  ������ ���ڿ��� ������


[����3-15]
SELECT SUBSTR('You are not alone',9,3) SUBSTR1, --9���� ��ġ���� 3�� �и��ؼ� ��ȯ
        SUBSTR('You are not alone',5) SUBSTR2, --(length ������) 5��° ��ġ���� ������ �и��ؼ� ��ȯ
        SUBSTR('You are not alone',0,3) SUBSTR3, -- position�� 0 ���� ����ϸ� 1�� �⺻��
        SUBSTR('You are not alone',-9,3) SUBSTR4,
        SUBSTR('You are not alone',-5) SUBSTR5
        
        --======================================
        --position ���� ������ ��� �� ��ġ��, �����ʺ��� ���۵ȴ�
        --============================================
        
        
        
        
FROM dual;


SELECT SUBSTR('admin@hanul.co.kr',0,5) EMAIL_ID,
        SUBSTR('admin@hanul.co.kr',6) EMAIL_DOMAIN,
        SUBSTR('062-362-7797',0,3) LOCAL_NUMBER,
        SUBSTR('062-362-7797',5) RAMAINDER_NUMBER
FROM DUAL;

--3.3.1 REPLACE(char,search_string [,replace_string]): ���ڿ��� �Ϻθ� �ٸ� ���ڿ��� �����Ͽ� ��ȯ
--char : ���ڿ�
--search_string : ã�� ���ڿ�
-- replace_string : ������ ���ڿ�. ������ ���, NULL�� ���� search-string ���ڿ��� ������ ����� ��ȯ�Ѵ�.

[����3-17]
SELECT REPLACE('You are not alone', 'You','We') REP1,
        REPLACE('You are not alone','not') REP2, -- replace_str ����, search_str ������ char ��ȯ
        REPLACE('You are not alone','not',null) REP3
FROM dual;

--3.3.2 TRANSATE() : from_string���� �ش��ϴ� ���ڸ� ã�� to_string �ش��ϴ� ���ڷ� 1:1 ��ȯ�Ͽ� ��ȯ
[����3-18]
SELECT TRANSLATE('u! You are not alone.','You','We') TRANS
FROM dual;

--����
SELECT REPLACE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���','��','��') quiz1
FROM dual;

SELECT TRANSLATE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '����','�ʳ�') quiz2
       
from dual;

--3.3.3 INSTR(char, search_string [,position]) : ���ڿ����� Ư�� ���ڿ��� ������ġ�� ��ȯ�Ѵ�
-- char : ���ڿ�
--search_string : ã�� ����
-- position: ���ڿ��� ã�� ���� ��ġ, ������ �⺻�� 1�̴�.
--_th : ���° ���ڿ�����, ������ �⺻�� 1
-- �� ���ڿ��� position ��ġ�������� Ư�� ���ڸ� ã�� ������ _th��°�� �ش��ϴ� ���� ��ġ�� ��ȯ �ϴ� �Լ�
--ã�� ���ڿ��� �߰ߵ��� ������ 0�� ��ȯ
-- ã�� ���ڿ��� �߰ߵǸ� �ش� ��ġ���� ��ȯ

[���� 3-19]
SELECT INSTR('EVERY sha-la-la-la','la') INSTR1,
        INSTR('EVERY sha-la-la-la','la',7) INSTR2,
        INSTR('EVERY sha-la-la-la','la',1,2) INSTR3,
        INSTR('EVERY sha-la-la-la','la',12,2) INSTR4,
        INSTR('EVERY sha-la-la-la','la',15,2) INSTR5

FROM dual;


--3.3.4 LENGTH(char) : ���ڿ��� ���̸� ��ȯ�Ѵ�

[����3-20]
SELECT LENGTH('Every Sha-la-la-la') LEN1
FROM dual;

-- 3.3 ��¥�Լ�(p.27)
-- ��¥�� ���Ҿ� �ð��� ���� ������� �Ѵ�.

-- 3.3.1 SYSDATE()
-- SYSDATE() : ��û ����, �Ϲ������� ���� �Լ� --> STSDATE�� ǥ��
-- �ý����� ���� ��¥�� ������ ��ȯ�ϴ� �Լ�
-- �� ��¥�� �ð��� �����ϰ� �ִ�.
-- STSDATE �Լ��� �ٸ� �Լ��� �ٸ��� �Ķ���Ͱ� ����. ()�� ������� �ʴ´�

SELECT SYSDATE
from dual; --23/05/09 <==> �ý��� ��¥ ���� : RR/MM/DD
--RR ǥ��� : 50 �̻��̸� 1900���, 50�̸� �̸� 2000��� ǥ��
-- 99/05/09 ==> 1999/05/09
-- 03/05/09 ==> 2003/05/09

-- ��¥ ����(Format)�� Ȯ�� �ϴ� SQL
SELECT *
FROM v$nls_parameters;-- : ����� (������ ����)
--NLS_DATE_FORMAT : RR/MM/DD --> YY/MM/DD, YYYY/MM/DD, YY/MM/DD HH:MI:SS ... [��¥/�ð� ���� ����]

--�Ͻ������� ��¥ ������ ����:��¥ --> ���� : ��¥+�ð� �������� ����
--�������� ���� x, ���� �α��ε� HR ���ǿ����� ��ȿ!
-- ���� > ȯ�漳�� > �����ͺ��̽� > NLS : ��¥ ����
ALTER SESSION SET nls_date_format = 'RR/MM/DD HH24:MI:SS';
ALTER SESSION SET nls_date_format= 'RR/MM/DD';

SELECT SYSDATE
FROM dual;
--===========================================
--������ �Ź� �ٲپ ��¥,�ð��� ����ϴ� ���� �����ϹǷ�,
--��¥ �Լ��� ����Ͽ�, �׶� �׶� ���ϴ� �������� ����ϴ� ���� ����
--================================================
SELECT SYSDATE,
    TO_DATE('2023-05-09 17:32:20', 'RR/MM/DD HH24:MI:SS') SYSDATE_TIME
FROM dual;

    
-- ���̺� / table (��ü) : �����͸� ����
-- �� / view (��ü) : ���̺��� �Ϻθ� �����ؼ� ��ġ ���̺� ó�� ���(��ȸ|����..)
-- HR ����, EMP_DETALS_VIEW (���_�������� ���� ��)
SELECT *
FROM EMP_DETAILS_VIEW; -- �並 ��ȸ! (�ӽ� �� - �޸𸮿��� ����)

--3.3.1 ADD_MONTHS(date,n) : date�� ������ n�� ���ؼ� �� ��� (��¥)�� ��ȯ�ϴ� �Լ�
--n : integer
[����3-21]
SELECT ADD_MONTHS(SYSDATE,1) MONTH1,
        ADD_MONTHS(SYSDATE,2) MONTH2,
         ADD_MONTHS(SYSDATE,-3) MONTH3
FROM dual;


--3.3.2 MONTHS_BETWEEN(date1, date2) : �� ��¥ ������ �������� ���Ͽ� ��ȯ�ϴ� �Լ�
--date1 : ���� ��¥
--date2 : ���� ��¥
-- �� date1 - date2 �������� ���

[����3-22]
SELECT ROUND(MONTHS_BETWEEN('2013-03-20',SYSDATE)) AS REMAINED,
        ABS(TRUNC(MONTHS_BETWEEN(SYSDATE, '2013-08-28'))) AS PASS
FROM dual;

--3.3.3 LAST_DAY(date) : date�� �ش��ϴ� ���� ������ ��¥�� ��ȯ�Ѵ�.
-- 3���̸� 31��ȯ, 4���̸� 30��ȯ
-- ���� ��¥ 5���� 31��!
-- �ſ� �� ������ �ڵ����� �����ϰų�, ���� ������(��� ���� ����?)���� ���� ����� �ڵ������ϴ�
-- ���񽺸� �����ϰų� �ϴ� ��ɿ��� �ʿ��� �� �ִ� �Լ�
SELECT LAST_DAY(SYSDATE) Last1,
        LAST_DAY('2013-03-20') Last2
FROM dual;

SELECT employee_id, first_name,hire_date
from employees;

--3.3.4 NEXT_DAY(date,char) : date ���� ��¥�߿� char�� ��õ� ù��° ���ڸ� ��ȯ�ϴ� �Լ�
--                            ���ƿ��� ����(char)�� ��¥�� ��ȯ�ϴ� �Լ�
-- NLS : ��� ������ KOREAN (���� : SUNDAY,MONDAY... <---> �Ͽ���, ������ ...)

[����3-24]

SELECT NEXT_DAY(SYSDATE,'������') NEXT1,
        NEXT_DAY(SYSDATE,'�ݿ���') NEXT2,
        NEXT_DAY(SYSDATE,'��') NEXT3,
        NEXT_DAY(SYSDATE,'ȭ') NEXT4,
        NEXT_DAY(SYSDATE,4) NEXT5
FROM dual;

--NLS ���� : �ѱ����� ����Ŭ ��ġ ==> �ڵ����� KOREAN, ���ϸ� �ѱ۷�!

SELECT *
FROM v$nls_parameters; -- NLS_LANGUGE : KOREAN, ���ϸ� �ѱ۷�!

-- ���� > ȯ�漳�� > �����ͺ��̽� > NLS - ��¥��� : KOREAN

--3.3.5 �ݿø��Լ�, �����Լ�
-- �� ����,��¥���� ���밡���� �Լ�, ������! ��ҿ��� ���ڿ�.. � Ư�� ����? Ư���� �������� ����� �� ����.
-- Ư���� �������� ����� �� ����. (�Լ��� Ư¡���θ� ����)
--ROUND(n [,i]), ROUND(date,fmt) : �ݿø� �Լ�, 
--TRUNC(n [,i]), TRUNC(date,fmt) : ���� �Լ�


[����3-25]
-- �ڵ�����ȯ(=������ ����ȯ)
SELECT 10 + '5'
FROM dual; -- 15��, �˾Ƽ� ��ȯ�ؼ� ������ ��� 15�� ��ȯ

SELECT 10+'ABCD'
FROM dual; -- ORA-01722: ��ġ�� �������մϴ� ==> ���ڶ�� �Ǵ��Ҽ� �ִ� ���ڵ����ʹ� ����ȯ




-- YYYY or RRRR : �⵵�� 4�ڸ��� ǥ��
SELECT ROUND(TO_DATE('2013-06-30'),'YYYY') AS R1,
        ROUND(TO_DATE('2013-07-01'),'YEAR') AS R2,
        ROUND(TO_DATE('2013-12-15'),'MONTH') AS R3,
        ROUND(TO_DATE('2013-12-16'),'MM') AS R4,
        ROUND(TO_DATE('2013-05-27 11:59:59','YYYY-MM-DD HH24:MI:SS'),'DD') AS R5
from dual;

[����3-26]
SELECT  TRUNC(TO_DATE('2013-06-30'),'YYYY') AS R1,
        TRUNC(TO_DATE('2013-07-01'),'YEAR') AS R2,
        TRUNC(TO_DATE('2013-12-15'),'MONTH') AS R3,
        TRUNC(TO_DATE('2013-12-16'),'MM') AS R4,
        TRUNC(TO_DATE('2013-05-27 11:59:59','YYYY-MM-DD HH24:MI:SS'),'DD') AS R5
from dual;

-- 3.4 ��ȯ�Լ� (p.30)
-- ����Ŭ�� �������� ����ȯ ==> ����+'����' (ok), ����+'����' (no!)
-- ������� ����ȯ �Լ��� 3����!! (�⺻ ����, ����)
-- ����ȯ : ������, NUMBER --> DATE �ٷ� ��ȯx
--            TO_NUMBER()            TO_DATE()
-- NUMBER <---------------- CHAR  <--------------- DATE
--   3rd                     1rd                    2rd
--         --------------->     ------------------->
--            TO_CHAR()               TO_DATE()


--3.4.1 TO_CHAR(date [,fmt])
-- ��,��,��,��,��,�� ����
-- * �и������� ==> ����� ��Ϻ�(?) + SYSTIMESTAME or ????

SELECT SYSDATE ����ð���¥,SYSTIMESTAMP ����ð���¥�и�������_GMTǥ�ؽ�
FROM dual;

-- ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD HH:MI:SS' ; -- �̰ͺ��ٴ� �������̸� ��ȯ�Լ�!!
[����3-27]

SELECT  TO_CHAR(SYSDATE,'YYYY-MON-DD') AS R1,
        TO_CHAR(SYSDATE,'RR/MM/DD HH:MI:SS') AS R2,
        TO_CHAR(SYSDATE,'YY-MM-DD DAY') AS R3
       
FROM dual;


--3.4.2 TO_DATE()

[����3-30]
SELECT TO_DATE('2013-05-27') DATE1,
      TO_DATE('2013-06-27 11:12:35','YYYY/MM/DD HH:MI:SS AM') DATE2
FROM dual;
--3.4.3 TO_NUMBER()
[����3-29]
SELECT TO_NUMBER('12345')+1000 "���ڸ� ���ڷ�1",
        TO_NUMBER('123.45') "���ڸ� ���ڷ�2"
FROM dual;

--To_DATE() : ���ڸ� ��¥ �������� ��ȯ�ϴ� �Լ�
--TO_CHAR() : ���ڷ� �ٲٴ� �Լ�
--TO_NUMBER() : ���ڷ� �ٲٴ� �Լ�

-- 3.5 �Ϲ��Լ�

--NULL ���� �Լ�
--3.5.1 NVL(exp1, exp2)
-- NVL�� �Ķ������ exp1, exp2�� ������ ������ ���� ���ƾ� �Ѵ�.

[����3-31]
SELECT employee_id,first_name,salary,NVL(commission_pct,0) AS "������", salary*commission_pct comm
from employees
WHERE salary*commission_pct<1000;

[����3-32]
SELECT employee_id,first_name,salary,NVL(commission_pct,0) AS "������", salary*NVL(commission_pct,0) comm
from employees
WHERE salary*NVL(commission_pct,0)<1000;


--3.5.2 NVL2(exp1, exp2, exp3)

[����3-33]
SELECT employee_id,first_name,NVL(commission_pct,0),
        NVL2(commission_pct,salary*(1+commission_pct),salary) AS "total_salary"
FROM employees;


--3.5.3 COALESCE(exp1, exp2, exp3, ...)

[����3-35]
SELECT COALESCE('A','B','C',NULL) first,
        COALESCE(NULL,'B','C',NULL) second,
        COALESCE(Null,null,'C',null) third
FROM dual;


--3.6 DECODE�� CASE
--���� ���ǿ� ���� ó��, IF~ELSE / SWITCH(case) ..
-- ����Ŭ������ ���ǿ� ���� ó�� ==> �Լ� DECODE
-- ����Ŭ PL/SQL(SQL ���α׷�) ������ IF~ELSE ����


-- 3.6.1 DECODE(exp,search1,result1, search2,result2, ... [,default]): IF~ELSE ó�� exp�� �˻��Ͽ�
-- search1�� ��ġ�ϸ� result1 ��ȯ, search2�� ��ġ�ϸ� result2 ��ȯ, ... ��ġ�ϴ°� ������

[����3-36] ���ʽ� ���޿� �־�, 20�� �μ��� 20%       (salary�� 20%)
                               30�� �μ��� 30%
                               40�� �μ��� 40%
                               �׿� �μ��� 0(=�������� �ʴ´�)

SELECT employee_id,first_name,salary,department_id,
DECODE(department_id,20,salary*0.2,
                     30,salary*0.3,
                     40,salary*0.4,
                     0) AS "���ʽ�"
FROM employees
ORDER BY 5;



-- 3.6.2 CASE : �Լ���� ���� �� ū ������ ���� ǥ�����̴�.
-- �����, ������ (ũ��,�۴�..)

--CASE exp WHEN search1 THEN result1
--         WHEN search2 THEN result2
--         ...���...
--         [ELSE default]
--END



--CASE     WHEN condition1 THEN result1
--         WHEN condition2 THEN result2
--         ...���...
--         [ELSE default]
--END


[����3-37] ���ʽ� ���޿� �־�, 20�� �μ��� 20%       (salary�� 20%)
                               30�� �μ��� 30%
                               40�� �μ��� 40%
                               �׿� �μ��� 0(=�������� �ʴ´�)

SELECT employee_id,last_name,department_id,salary,
        CASE department_id WHEN 20 THEN salary*0.2
                           WHEN 30 THEN salary*0.3
                           WHEN 40 THEN salary*0.4
                           ELSE 0
        
        END AS bonus
FROM employees;


-- ������϶��� DECODE()�� CASE ~ END�� �����ϰ� ó��
SELECT employee_id,last_name,department_id,salary,
        CASE    WHEN department_id=20 THEN salary*0.2
                WHEN department_id=30 THEN salary*0.3
                WHEN department_id=40 THEN salary*0.4
                ELSE 0
        
        END AS bonus
FROM employees;

--���ʽ� ���޿� �־ 30�� �̸� �μ��� �޿��� 10%�� ���ʽ��� ����,
--                    30������ 50�� �μ������� �޿��� 20%�� ���ʽ��� ����,
--                    60������ 80�� �μ������� �޿��� 30%�� ���ʽ��� �����ϰ�,
--                    �� ���� �μ��� 40%�� �����Ѵٰ� �Ҷ�,
--                CASE ǥ������ �̿���, �� ����� ������ ���ʽ� �ݾ��� ��ȸ�Ͻÿ�.
                
SELECT employee_id,last_name,department_id,salary,
        CASE WHEN department_id<30 THEN salary*0.1
             WHEN department_id BETWEEN 30 AND 50 THEN salary*0.2
             WHEN department_id BETWEEN 60 AND 80 THEN salary*0.3
             ELSE salary*0.4
        END AS "���ʽ�"
FROM employees;
            


-- ����Լ� : ������ ���̾�Ƽ��Ʈ(DS),������ �м���(DA) ���� ����ϴ� �Լ�