-- 10��. ��������

-- ���Ἲ �������� (Integrity Constraints): �������� ��Ȯ���� �����ϱ� ���� �δ� ����/���� ����
-- 1) ���̺� ������ ���� : CREATE TABLE ~
-- 2) ���̺� ���� �� �߰� : ALTER TABLE ~

--10.1 NOT NULL �������� - NULL ������� ����
-- �÷� ������ ���� �־� NULL ������� ����
-- �� ���̺� ������ �÷� �������� �����Ѵ�
-- ex> ���̺� ���� ����



--10.2 CHECK �������� - ���� ����
--10.3 UNIQUE �������� - �ߺ����� (NULL ���)
--10.4 Primary key �������� - UNIQUE + NOT NULL
--10.5 FOREIGN KEY �������� - �ܷ�Ű

--NOT NULL �� �÷��� �����Ͱ��� �־� NULL �� ������� �ʴ� ���������̴�.

[����10-1]
CREATE TABLE null_test(
 col1 varchar2(5) NOT NULL,
 col2 varchar2(5)
 );
 
 [����10-2]
 INSERT INTO null_test(col1)
 values('AA');
 
 select *
 from null_test;
 
 [����10-3]
UPDATE  null_test
SET col2 = 'BB'
where col1='AA';

[����10-4]
ALTER TABLE null_test
MODIFY ( col2 NOT NULL ); -- null_test ���̺��� 2�� �÷��� not null ���������� �߰�!

[����10-5]
ALTER TABLE null_test
MODIFY ( col2 ); -- null_test ���̺� 2�� �÷��� NULL ������������ �ٽ� ����

-- CHECK �� ���ǿ� �´� �����͸� ����� �� �ֵ��� �ϴ� ���������̴�.
[����10-6]
