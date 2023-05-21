-- 10장. 제약조건

-- 무결성 제약조건 (Integrity Constraints): 데이터의 정확성을 보장하기 위해 두는 제약/제한 조건
-- 1) 테이블 생성시 정의 : CREATE TABLE ~
-- 2) 테이블 생성 후 추가 : ALTER TABLE ~

--10.1 NOT NULL 제약조건 - NULL 허용하지 않음
-- 컬럼 데이터 값에 있어 NULL 허용하지 않음
-- ★ 테이블 생성시 컬럼 레벨에서 정의한다
-- ex> 테이블 생성 구문



--10.2 CHECK 제약조건 - 값의 범위
--10.3 UNIQUE 제약조건 - 중복방지 (NULL 허용)
--10.4 Primary key 제약조건 - UNIQUE + NOT NULL
--10.5 FOREIGN KEY 제약조건 - 외래키

--NOT NULL 은 컬럼의 데이터값에 있어 NULL 을 허용하지 않는 제약조건이다.

[예제10-1]
CREATE TABLE null_test(
 col1 varchar2(5) NOT NULL,
 col2 varchar2(5)
 );
 
 [예제10-2]
 INSERT INTO null_test(col1)
 values('AA');
 
 select *
 from null_test;
 
 [예제10-3]
UPDATE  null_test
SET col2 = 'BB'
where col1='AA';

[예제10-4]
ALTER TABLE null_test
MODIFY ( col2 NOT NULL ); -- null_test 테이블의 2번 컬럼을 not null 제약조건을 추가!

[예제10-5]
ALTER TABLE null_test
MODIFY ( col2 ); -- null_test 테이블 2번 컬럼을 NULL 제약조건으로 다시 변경

-- CHECK 는 조건에 맞는 데이터만 저장될 수 있도록 하는 제약조건이다.
[예제10-6]
