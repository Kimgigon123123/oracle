--����, ����, ����
-- DML (DATA MANIPLATION LANGUAGE ) - INSERT , UPDATE, DLELETE (SELECT)
-- CRUD ( WEB���� �⺻ 4���� ������ ��� CRUD��� ǥ���� �Ѵ�. )
-- DDL (DATA DFINITION LANGUAGE) = create , alter, drop (���̺� �����ϰ�, �����ϰ�, ����)

-- JAVA (JDBC) -> (SQL)DBMS ->DB (Exceló�� ���常 �ϴ� â��)

SELECT 1 FROM dual;

--KEY �����ͺ��̽��� ����ȭ ������ ��ġ�µ� �� �� �����͸� �ϳ��� ���� �Ǵ� �����ϰ� �Ҽ� �ְ� ���ִ�
-- �ĺ��� (������� ġ�� �� �ĺ��� : �ֹε�Ϲ�ȣ , �� �ĺ��� : �θ���� �ֹε�� ��ȣ)
-- number(int), varchar2(string), nvarchar2(String)
CREATE TABLE KGG(
    COL1 varchar2(1000),
    COL2 Number,
    COL3 varchar2(1000),
    COL4 varchar2(1000),
    COL5 varchar2(1000)
    
);
--DROP TABLE KGG;

INSERT INTO "KGG" (COL1, COL2, COL3, COL4, COL5) VALUES ('A', '1', 'C', 'D', 'E');
INSERT INTO "KGG" (COL1, COL2, COL3, COL4, COL5) VALUES ('A', '1', 'C', 'D', 'E');
INSERT INTO "KGG" (COL1, COL2, COL3, COL4, COL5) VALUES ('A', '1', 'C', 'D', 'E');

ROLLBACK;
COMMIT;
-- ��� �۾��� ��� �͵��� �ǵ�����. (ROLLBACK) ; ROLLBACK �Ǵ� COMMIT�� �Ҷ��� �����ϰ� �Ѵ�.
-- ��� �۾��� ���� Ȯ�� (COMMIT)
--Ʈ����� : ��� �۾��� �ּ��� ���� : DBMS�� �۾��� �س��� Ȯ���Ҳ��� ��ٸ��� ����.
SELECT * FROM KGG;

UPDATE KGG SET col1 = '��ȣ��ٲ�' where col3='10000';

DELETE FROM KGG;

-- DATA TYPE : NUMBER (int) , VHRCHAR2 (String)
-- CREATE  TABLE ���̺��̸� (
-- Į���̸� ������Ÿ��(ũ��), Į���̸�2 ������2Ÿ��(ũ��), ...
--);
ROLLBACK;
DROP TABLE KOREA_PEOPLE;
CREATE TABLE KOREA_PEOPLE(
    JUMIN_NUM NUMBER PRIMARY KEY, --�ߺ��Ǹ� �ȵǴ� ������(key,�ĺ���)�� �ǹ���.
    NAME VARCHAR2(20),
    GENDER NUMBER
);

INSERT INTO KOREA_PEOPLE (JUMIN_NUM, NAME, GENDER) VALUES ('2', '�̸�', '1');

SELECT * FROM korea_people;

COMMIT;

-- ��ȣ�� : �ҳ���, �ָ޴� : ���, �ּ� : ~~ , ����11
--���� ���������� ���п��� ������ �����͸� ���� DB�� ������ �ϰ� �ʹٸ� ��� �ؾ��ұ�?
-- �ش� ������ ������ ���̺��� �����, INSERT���� �̿��ؼ� �����͸� �־�� (2��)

CREATE TABLE MATJIB(
    ��ȣ�� VARCHAR2(30),
    �ָ޴� VARCHAR2(30),
    ���� NUMBER
);

INSERT INTO "HANUL"."MATJIB" ("��ȣ��", "�ָ޴�", "����") VALUES ('�ҳ���', '���', '1');
INSERT INTO "HANUL"."MATJIB" ("��ȣ��", "�ָ޴�", "����") VALUES ('������ȭ�丮', '¥���', '2');
INSERT INTO "HANUL"."MATJIB" ("��ȣ��", "�ָ޴�", "����") VALUES ('ä�̿�', '����', '3');
ROLLBACK;
COMMIT;

SELECT * FROM MATJIB;

CREATE TABLE school(
    �г� NUMBER,
    �� NUMBER,
    ��ȣ NUMBER,
    �̸� VARCHAR2(30)
);

INSERT INTO "HANUL"."SCHOOL" ("�г�", "��", "��ȣ", "�̸�") VALUES ('1', '1', '1', '����');
INSERT INTO "HANUL"."SCHOOL" ("�г�", "��", "��ȣ", "�̸�") VALUES ('1', '1', '2', '������');
INSERT INTO "HANUL"."SCHOOL" ("�г�", "��", "��ȣ", "�̸�") VALUES ('1', '1', '3', '���ȣ');
commit;
SELECT * FROM school;