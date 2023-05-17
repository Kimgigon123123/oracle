--회원, 상품, 구매이력

create table tbl_company202(
    company_code number primary key,
    Name nvarchar2(10) not null,
    salary number default 0,    -- int는 소숫점 안되고 크기가 38고정 이어서 쓸모없는 메모리 소모있음.
    adress nvarchar2(200)

);

drop table tbl_company202;
delete from tbl_company202;
insert into tbl_company202 values (1,'김개발자',200,'광주1');
insert into tbl_company202(company_code,name) values (2,'김개발자');
insert into tbl_company202 values (3,'박개발자',300,'광주2');
insert into tbl_company202 values (4,'이개발자',300,'광주3');

-- 내가 저장 해야할 데이터를 모두 담을 수 있는 구조를 가진 테이블을 만든다.
-- 의미 없는 데이터를 몇건 넣어봄. (dummy data) 현재 3건 넣었다.

UPDATE TBL_COMPANY202 SET JOB = replace(job,'자바 개발','자바 개발1');


commit;
rollback;


select * from tbl_company202;

drop table tbl_job202;
Create table tbl_job202(
    job_num number primary key,
    job_name nvarchar2(200) not null
);

insert into tbl_job202 values (1,'자바 개발');
insert into tbl_job202 values (2,'웹 개발');
insert into tbl_job202 values (3,'앱 개발');
select * from tbl_job202;

SELECT a.*,b.* from tbl_company202 a left outer join tbl_job202 b on a.job= b.job_num;
update tbl_job202 set job_name = '자바 개발1' where job_num=1;
update tbl_job202 set job_name = '웹 개발1' where job_num=2;


create table job_state(
    company_code number,
    job_num number,
    constraint company_job_pk primary key(
    company_code,
    job_num
    )enable
);

insert into job_state values (1,1);
insert into job_state values (1,2);
insert into job_state values (2,3);
insert into job_state values (100,30);


select * from job_state;

delete from job_state;
commit;
rollback;
-- job_state에 company_code와 job_num을 이용하여 job의 명칭, 개발자의 이름을 출력해보기
-- 1, 김개발자, 1, 자바개발
-- 1, 김개발자, 2, 웹 개발

SELECT c.name,j.job_name
--case when c.company_code=1 then c.name 
--end,
--case when s.job_num=1 then j.job_name
--when s.job_num=2  then j.job_name
--end
from job_state s left outer join tbl_company202 c 
on s.company_code= c.company_code
left outer join TBL_JOB202 j
on s.job_num = j.job_num;

select c.*,s.*
from  tbl_company202 c left outer join job_state s on c.company_code=s.company_code;


-- 테이블을 만들어 놨는데 문제가 있음 뭘까?
-- 정규화 : 데이터베이스를 설계적으로 잘 만들게 하는 규칙(과정) x
-- 