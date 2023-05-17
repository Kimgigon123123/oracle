--ȸ��, ��ǰ, �����̷�

create table tbl_company202(
    company_code number primary key,
    Name nvarchar2(10) not null,
    salary number default 0,    -- int�� �Ҽ��� �ȵǰ� ũ�Ⱑ 38���� �̾ ������� �޸� �Ҹ�����.
    adress nvarchar2(200)

);

drop table tbl_company202;
delete from tbl_company202;
insert into tbl_company202 values (1,'�谳����',200,'����1');
insert into tbl_company202(company_code,name) values (2,'�谳����');
insert into tbl_company202 values (3,'�ڰ�����',300,'����2');
insert into tbl_company202 values (4,'�̰�����',300,'����3');

-- ���� ���� �ؾ��� �����͸� ��� ���� �� �ִ� ������ ���� ���̺��� �����.
-- �ǹ� ���� �����͸� ��� �־. (dummy data) ���� 3�� �־���.

UPDATE TBL_COMPANY202 SET JOB = replace(job,'�ڹ� ����','�ڹ� ����1');


commit;
rollback;


select * from tbl_company202;

drop table tbl_job202;
Create table tbl_job202(
    job_num number primary key,
    job_name nvarchar2(200) not null
);

insert into tbl_job202 values (1,'�ڹ� ����');
insert into tbl_job202 values (2,'�� ����');
insert into tbl_job202 values (3,'�� ����');
select * from tbl_job202;

SELECT a.*,b.* from tbl_company202 a left outer join tbl_job202 b on a.job= b.job_num;
update tbl_job202 set job_name = '�ڹ� ����1' where job_num=1;
update tbl_job202 set job_name = '�� ����1' where job_num=2;


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
-- job_state�� company_code�� job_num�� �̿��Ͽ� job�� ��Ī, �������� �̸��� ����غ���
-- 1, �谳����, 1, �ڹٰ���
-- 1, �谳����, 2, �� ����

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


-- ���̺��� ����� ���µ� ������ ���� ����?
-- ����ȭ : �����ͺ��̽��� ���������� �� ����� �ϴ� ��Ģ(����) x
-- 