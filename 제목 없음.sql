-- ���̺� ����¹� , Ű
-- ���̺� ����� : ���̺� �� => CUSTOMER
-- ID�� �������·� �����͸� �ĺ��Ҽ��ִ� ������ Ű��
-- NAME ����� �̸��� ������ (NULL �ƴ�)
-- GENDER �� ������ �����ϸ� �⺻������ ���� ������ �� ���� (NULL �ƴ�)
-- EMAIL �̸����� �����Ѵ�
-- PHONE �ڵ��� ��ȣ�� �����Ѵ�.

CREATE TABLE CUSTOMER (
--�ٱ��� ó���� �������� ���̰� �߿��� ���� =>nvarchar2 ���
    id number primary key,
    name nvarchar2(30) not null,
    gender nvarchar2(2) default '����' not null check (gender in('����','����')) ,
    email nvarchar2(30),
    phone nvarchar2(30)
    
);

drop table customer;

select *
from customer;

insert into customer
values (1,'�ǿ���','����','123@naver.com','010-1234-1234');

insert into customer
values (2,'���ȣ','����','123@naver.com','010-1234-1234');

insert into customer
values (3,'����','����','123@naver.com','010-1234-1234');

insert into customer
values (4,'�����','����','123@naver.com','010-1234-1234');

select * from customer where id=1 and name='�ǿ���';

commit;