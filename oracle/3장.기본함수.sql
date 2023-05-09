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

-- 3.4 ��ȯ�Լ�
-- 3.5 �Ϲ��Լ�

-- ����Լ� : ������ ���̾�Ƽ��Ʈ(DS),������ �м���(DA) ���� ����ϴ� �Լ�