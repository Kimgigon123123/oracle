-- 테이블 만드는법 , 키
-- 테이블 만들기 : 테이블 명 => CUSTOMER
-- ID는 숫자형태로 데이터를 식별할수있는 유일한 키값
-- NAME 사람의 이름을 저장함 (NULL 아님)
-- GENDER 는 성별을 저장하며 기본적으로 나의 성별이 들어가 있음 (NULL 아님)
-- EMAIL 이메일을 저장한다
-- PHONE 핸드폰 번호를 저장한다.

CREATE TABLE CUSTOMER (
--다국어 처리나 데이터의 길이가 중요한 경유 =>nvarchar2 사용
    id number primary key,
    name nvarchar2(30) not null,
    gender nvarchar2(2) default '남성' not null check (gender in('남성','여성')) ,
    email nvarchar2(30),
    phone nvarchar2(30)
    
);

drop table customer;

select *
from customer;

insert into customer
values (1,'권영균','남성','123@naver.com','010-1234-1234');

insert into customer
values (2,'김건호','남성','123@naver.com','010-1234-1234');

insert into customer
values (3,'김기곤','남성','123@naver.com','010-1234-1234');

insert into customer
values (4,'김수봉','남성','123@naver.com','010-1234-1234');

select * from customer where id=1 and name='권영균';

commit;