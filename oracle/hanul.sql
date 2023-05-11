--정의, 조작, 제어
-- DML (DATA MANIPLATION LANGUAGE ) - INSERT , UPDATE, DLELETE (SELECT)
-- CRUD ( WEB에서 기본 4가지 로직을 묶어서 CRUD라고 표현을 한다. )
-- DDL (DATA DFINITION LANGUAGE) = create , alter, drop (테이블 생성하고, 삭제하고, 수정)

-- JAVA (JDBC) -> (SQL)DBMS ->DB (Excel처럼 저장만 하는 창고)

SELECT 1 FROM dual;

--KEY 데이터베이스가 정규화 과정을 거치는데 그 때 데이터를 하나로 묶고 또는 구분하고 할수 있게 해주는
-- 식별자 (사람으로 치면 주 식별자 : 주민등록번호 , 부 식별자 : 부모님의 주민등록 번호)
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
-- 방금 작업한 모든 것들을 되돌리다. (ROLLBACK) ; ROLLBACK 또는 COMMIT을 할때는 신중하게 한다.
-- 방금 작업한 모든것 확정 (COMMIT)
--트랜잭션 : 디비 작업에 최소의 단위 : DBMS가 작업을 해놓고 확정할껀지 기다리는 상태.
SELECT * FROM KGG;

UPDATE KGG SET col1 = '상호명바꿈' where col3='10000';

DELETE FROM KGG;

-- DATA TYPE : NUMBER (int) , VHRCHAR2 (String)
-- CREATE  TABLE 테이블이름 (
-- 칼럼이름 데이터타입(크기), 칼럼이름2 데이터2타입(크기), ...
--);
ROLLBACK;
DROP TABLE KOREA_PEOPLE;
CREATE TABLE KOREA_PEOPLE(
    JUMIN_NUM NUMBER PRIMARY KEY, --중복되면 안되는 데이터(key,식별자)를 의미함.
    NAME VARCHAR2(20),
    GENDER NUMBER
);

INSERT INTO KOREA_PEOPLE (JUMIN_NUM, NAME, GENDER) VALUES ('2', '이름', '1');

SELECT * FROM korea_people;

COMMIT;

-- 상호명 : 소나무, 주메뉴 : 고기, 주소 : ~~ , 연번11
--내가 공공데이터 포털에서 가져온 데이터를 나의 DB에 저장을 하고 싶다면 어떻게 해야할까?
-- 해당 내용을 가지고 테이블을 만들고, INSERT문을 이용해서 데이터를 넣어보기 (2건)

CREATE TABLE MATJIB(
    상호명 VARCHAR2(30),
    주메뉴 VARCHAR2(30),
    연번 NUMBER
);

INSERT INTO "HANUL"."MATJIB" ("상호명", "주메뉴", "연번") VALUES ('소나무', '고기', '1');
INSERT INTO "HANUL"."MATJIB" ("상호명", "주메뉴", "연번") VALUES ('제일중화요리', '짜장면', '2');
INSERT INTO "HANUL"."MATJIB" ("상호명", "주메뉴", "연번") VALUES ('채미원', '굴비', '3');
ROLLBACK;
COMMIT;

SELECT * FROM MATJIB;

CREATE TABLE school(
    학년 NUMBER,
    반 NUMBER,
    번호 NUMBER,
    이름 VARCHAR2(30)
);

INSERT INTO "HANUL"."SCHOOL" ("학년", "반", "번호", "이름") VALUES ('1', '1', '1', '김기곤');
INSERT INTO "HANUL"."SCHOOL" ("학년", "반", "번호", "이름") VALUES ('1', '1', '2', '곽영균');
INSERT INTO "HANUL"."SCHOOL" ("학년", "반", "번호", "이름") VALUES ('1', '1', '3', '김건호');
commit;
SELECT * FROM school;