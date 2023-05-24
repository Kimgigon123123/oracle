--[��������10-2]


1. �̸��� ������ ���� �迪���� ��� ������ ��ȸ
SELECT *
FROM characters
where email is null;

2. ������ �ý��� �ش��ϴ� �����ι��� ��ȸ
���� ���� ���̺� : roles
select *
from characters
where role_id = (select role_id
                    from roles
                    where role_name ='�ý�');


3. ���Ǽҵ�4�� �⿬�� ������ ���� �̸��� ��ȸ
-- star_wars : ��ȭ����(���Ǽҵ� ���̵�,���Ǽҵ��,��������)
-- characters : �����ι�����(���̵�,�̸�,�����;��̵�,���Ҿ��̵�,�̸���)
--casting : �����ι��� �������(���Ǽҵ� ���̵�, ĳ���� ���̵�, �����̸�)

select *
from casting
where episode_id = 4;

4. ���Ǽҵ�5�� �⿬�� ������ �迪�̸��� �����̸�
--�迪�̸� : character_name    < characters ���̺�>
--�����̸� : real_name               <casting ���̺�>
--���ο��� : �ٸ� ���̺��� �÷��� ������ ��ġ �ϳ��� ���̺��ΰ�ó�� �����͸� ��ȸ(����)
--SET ���� : �÷�����, ������ Ÿ�Ը� ������ ��ġ �ϳ��� ���̺��� ������ ��ȸ�� ��� (����)

SELECT ch.character_name AS �迪�̸�,
        ca.real_name AS �����̸�
from characters ch,casting ca
where ch.character_id = ca.character_id
and ca.episode_id=5;

5.����ǥ�� ���ι����� �ٲپ� �ۼ��Ͻÿ�
-- ANSI ���� : inner join, outer join
-- on�� : where ������ ���
-- using : �÷��� ��Ī/��� ��� X
-- ���̺� ������ �϶� : ���� ������ ����� �ٽ� �߰��� �����ϴ� ����
-- (+) : ����Ŭ �ƿ��� ���� <---> [LEFT|RIGHT|FULL] OUTER JOIN

select c.character_name, p.real_name, r.role_name
from characters c left outer join casting p
on c.character_id = p.character_id
right outer join roles r
on c.role_id = r.role_id
and p.episode_id=2;

-- ���Ǽҵ� 2�� �⿬�� 3���� �迪�� | ���� ���� | ���� �̸� �� ���;� ��
--characters �����Ϳ� casting �����Ͱ� ����ġ : ���� ���� vs ���� ������ ����/����

--6. ���ڿ� �Լ��� �̿��� characters ���̺��� �迪�̸�,�̸���,�̸��Ͼ��̵� ��ȸ�Ͻÿ�
-- ��, �̸����� ���̵�@�������϶�!
--substr() : ���ڿ� �����Ͽ� ��ȯ
--instr() : Ư�� ���ڿ��� ������ġ�� ��ȯ
--replace(),translate() : ġȯ/1:1 ��ȯ
--trim(),ltrim(),rtrim() : ���ڿ�/�⺻�� ���� ����
--lpad(),rpad() : ���ڿ�/���� �߰�
--length() : ���ڿ� ���� ��ȯ


select character_name AS �迪�̸�,
        email AS �̸���,
        SUBSTR(email,1,INSTR(email,'@')-1) AS �̸���_���̵�
from characters;


7.������ �����̿� �ش��ϴ� �迪���� �迪�̸�, ���� ������ master_id
-- ��������
-- NULL ó�� �Լ� : NVL(exp1, exp2),NVL2(exp1, exp2, exp3)
-- COALESCE() : �ּ� �ϳ��� NULL �ƴϾ�� �ϴ� .. ���� NULL �ƴ� �� ��ȯ �Լ�

select *
from characters;

SELECT c.character_name, NVL(m.character_name,'����') AS masters
FROM characters c, roles r , characters m
where c.role_id = r.role_id
and r.role_name='������'
and nvl(c.master_id,0)=m.character_id(+)
order by 1;

