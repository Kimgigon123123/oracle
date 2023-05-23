-- 10장. 제약조건

-- 무결성 제약조건 (Integrity Constraints): 데이터의 정확성을 보장하기 위해 두는 제약/제한 조건
-- 1) 테이블 생성시 정의 : CREATE TABLE ~
-- 2) 테이블 생성 후 추가 : ALTER TABLE ~

--10.1 NOT NULL 제약조건 - NULL 허용하지 않음
-- 컬럼 데이터 값에 있어 NULL 허용하지 않음
-- ★ 테이블 생성시 컬럼 레벨에서 정의한다
-- ex> 테이블 생성 구문



--10.2 CHECK 제약조건 - 값의 범위/도메인 (p.80)
--조건에 맞는 데이터만 저장할 수 있도록 하는 제약조건이다.
--컬럼 레벨, 테이블 레벨에서 정의한다.
--컬럼 레벨
--테이블 레벨
[예제10-6]
CREATE TABLE check_test (
    name varchar2(10) not null, -- 컬럼 레벨
    gender varchar(10) not null check (gender in ('남성','여성')),
    salary number(8),
    dept_id number(4),
    constraint check_test_salary_ck check (salary > 2000) -- 테이블 레벨 (테이블 제약조건)
);

select *
from user_constraints
where table_name = 'CHECK_TEST';

[예제10-7] 데이터를 check_test 테이블에 삽입해보시오.
insert into check_test 
values('홍길동','남성',3000,10);

select *
from check_test;

[예제10-8]
insert into check_test
values('심청','여자',3000,20); -- 여성 vs 여자

[예제10-9]
update check_test
set salary=1000
where name = '홍길동'; --ORA-02290: 체크 제약조건(HANUL.CHECK_TEST_SALARY_CK)이 위배되었습니다

[예제10-10]
-- DDL : CREATE, ALTER, DROP
--        생성,   수정,   삭제
-- check_test에 걸린 제약조건을 확인하고, 그런 다음 삭제했다가 다시 추가하는 과정

--이건 제거
alter table check_test
drop constraint 제약조건명;

alter table check_test
drop constraint check_test_salary_ck;

[예제10-11]
--다시 추가하기!
ALTER TABLE check_test
ADD CONSTRAINT check_salary_dept_pk check ( salary between 2000 and 10000 and dept_id in(10,20,30));

select *
from check_test;

[예제10-12]
update check_test
set salary = 12000
where name = '홍길동';

update check_test
set dept_id = 40
where name = '홍길동';

--10.3 UNIQUE 제약조건 - 중복방지 (NULL 허용)
-- 데이터가 중복되지 않도록 유일성을 보장하는 제약조건
-- 컬럼 레벨, 테이블 레벨에서 정의
-- 복합키(Composite Key)를 생성할 수 있다. 예)보통 사번 vs 사번+이름
-- primary key = unique + not null
-- 테이블 생성시 UNIQUE 지정
--I.컬럼레벨 정의
CREATE TABLE unique_test(
    col1 varchar2(5) unique not null,
    col2 varchar2(5),
    col3 varchar2(5) not null,
    col4 varchar2(5) not null,
    constraint uni_col2_uk unique (col2),
    constraint uni_col34_uk unique (col3,col4) -- 복합키 : 둘 이상의 컬럼을 조합 ==> 사번+전화번호, 사번+이름
);

[예제10-14] 중복값을 제한하는지 입력 테스트
insert into unique_test (col1,col2,col3,col4)
values ('A1','B1','C1','D1');

select *
from unique_test;

insert into unique_test
values('A2','B2','C2','D2');

[예제10-15]
Update unique_test
set col1='A1'
where col1='A2';

desc unique_test;

[예제10-16] 데이터 입력 테스트 --> 중복값 확인
insert into unique_test
values ('A3','','C3','D3');-- col2 : null 들어가도됨.

insert into unique_test
values ('A4',null,'C4','D4');
--II.테이블 레벨 정의
-- 테이블 생성 후 unique 추가/지정 : 생성시 작성한 unique 제거 --> 추가

select constraint_name,constraint_type
from user_constraints
where table_name='UNIQUE_TEST';

[예제10-18] UNI_COL34_UK 제약조건을 삭제하고 col2,col3,col4를 UNIQUE 복합키로 지정하는 !
ALTER TABLE unique_test
drop constraint uni_col34_uk;

[예제10-19] uni_col234_uk 제약조건을 추가
ALTER TABLE unique_test
add constraint uni_col234_uk unique(col2,col3,col4);

select *
from unique_test;

[예제10-20]
insert into unique_test
values ('A7',null,'C4','D4'); --C4,D4 중복이라서 오류남


--10.4 Primary key 제약조건 - UNIQUE + NOT NULL
-- 데이터 행 (ROW)을 대표하도록 유일하게 식별하기 위한 제약조건
-- UNIQUE + NOT NULL의 형태
-- 기본키, 식별자, 주 키, PK 라 한다.
-- 컬럼레벨, 테이블레벨 에서 정의 ★복합키★를 생성 할 수 있다.
-- 예) 사람 - 주민번호 (= 인조키), 회사원 - 사원번호

-- I.컬럼레벨 정의
컬럼명 데이터 타입 PRIMARY KEY : 약식 --> SYS_C008XXX
컬럼명 데이터 타입 CONSTRAINT 제약조건명 PRIMARY KEY --> 테이블명_컬럼명_제약조건약어

-- II.테이블레벨 정의
CREATE TABLE member(
    id number(5) PRIMARY KEY,
    name,
    email,
    phone,
    constraint member_id_pk primary key (id)
);

[예제10-21]dept_test 테이블을 생성하고 dept_id,dept_name 컬럼 각각 숫자 4바이트, 가변문자 30바이트의 구조를
갖게하되 dept_name은 null을 허용하지 않고, dept_id를 기본키로 지정하는 쿼리를 작성하시오

CREATE TABLE dept_test(
    dept_id number(4),
    dept_name varchar2(30) not null,
    CONSTRAINT dept_test_dept_id_pk primary key (dept_id)
    );
    
[예제10-22] 부서코드10, 부서명은 영업부인 부서 데이터를 입력하시오
INSERT INTO dept_test (dept_id,dept_name)
values (10,'영업부');

select *
from dept_test;

insert into dept_test
values(10,'개발부'); -- 오류

insert into dept_test
values(20,'총무부');


--10.5 FOREIGN KEY 제약조건 - 외래키
--부모 테이블의 컬럼을 참조하는 자식 테이블의 컬럼에, 데이터의 무결성을 보장하기 위해 지정하는 제약조건
-- NULL 허용 <--> UNIQUE : 중복방지, NULL 허용
-- 참조키, 외래키, FK
-- 컬럼레벨, 테이블 레벨에서 정의, 복합키를 생성할 수 있다.
-- 컬럼레벨
-- 컬럼명 데이터 타입 REFERENCES 부모테이블 (참조되는 컬럼명)
-- 컬럼명 데이터 타입 CONSTRAINT 제약조건명 REFERNECES 부모테이블 (참조되는 컬럼)

-- 테이블레벨에서 정의
-- CONSTRAINT 테이블명_제약조건명_제약조건약어 FOREIGN KEY (참조하는 컬럼명) REFERENCES 부모테이블 (참조 되는 컬럼명)
-- 테이블과 테이블 관계에 따라서, ...
-- 사원 정보 테이블 <---> 부서 정보 테이블
-- 사원은 부서에 소속된다(=관계) N:1
-- 부서는 사원을 포함한다(=관계 1:N
-- HR 스키마 ==> 작은 규모의 데이터베이스 ==> 기초에 충실한 테이블 설계

-- 사원정보 ===> employees (테이블)
-- 사번(PK),이름,급여,이메일,부서코드(FK) ==> first_name,employee_id,salary,email (컬럼)

-- 부서정보 ===> departments (테이블)
-- 부서코드, 부서명, 위치코드 (컬럼)

--NOT NULL 은 컬럼의 데이터값에 있어 NULL 을 허용하지 않는 제약조건이다.


-- 쇼핑몰 구축 : 쇼핑물 업무 파악 (고객-상품 주문,결제, 회사-상품 포장, 발송..)
-- 개념설계 : 업무 관련 중요 키워드를 도출 ==> 엔터티(=테이블), 컬럼(=특성) ...
-- 논리설계 : Entity Relational Diagram (ERD) ==> 그림으로 개체, 특성, 관계를 표시하는 과정
-- 물리설계 : CREATE TABLE ~ ALTER TABLE ~ INSERT INTO ~

-- (사원 - 부서) I.개념설계
-- 고객 정보를 담는 테이블 : CUSTOMERS (고객ID,고객명,연락처...)
-- 상품 정보를 담는 테이블 : ITEMS (상품ID,상품명,가격)

--II.논리설계

--III.물리설계 : SQL

CREATE TABLE customers (
    id NUMBER(4),
    name VARCHAR2(20) NOT NULL,
    phone varchar(11),
    CONSTRAINT customers_id_pk primary key (id)
    
);

[예제10-26] 
create table emp_test(
    emp_id number(4) primary key,
    ename varchar2(30) NOT NULL,
    dept_id number(4),
    job_id varchar2(10),
    constraint emp_test_dept_fk Foreign KEY (dept_id) references dept_test (dept_id)
    
);

select *
from emp_test;

select *
from dept_test;

[예제10-27]
insert into emp_test(emp_id,ename,dept_id,job_id)
values (100,'King',10,'ST_MAN');

select *
from emp_test;

-- 테이블 생성 후 FK 추가지정
-- 일단 먼저 지우자 ==> 제약 조건 이름을 알자

SELECT constraint_name, constraint_type
from user_constraints
where table_name ='EMP_TEST';

--EMP_TEST_DEPT_ID_FK 을 삭제
ALTER TABLE emp_test
DROP CONSTRAINT emp_test_dept_fk;

-- 다시 지정 : 원래 없었다~ 가정하고 (시험용)
ALTER TABLE emp_test
ADD CONSTRAINT emp_test_dept_fk foreign key (dept_id) references dept_test (dept_id);


--default
--컬럼 단위로 지정되는 속성, 데이터를 입력하지 않아도 지정된 값이 기본 입력되도록한다.
-- 제약조건은 아니지만, 컬럼 레벨에서 작성한다.

[예제10-30]
CREATE TABLE default_test(
    name varchar2(10) NOT NULL,
    hire_date DATE DEFAULT SYSDATE NOT NULL,
    salary number(8) default 2500
);

insert into default_test(name,hire_date,salary)
values('홍길동',to_date('2023-05-22','YYYY-MM-DD'),3000);

select *
from default_test;

insert into default_test(name)
values('김길동');

select *
from default_test;

commit;

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


