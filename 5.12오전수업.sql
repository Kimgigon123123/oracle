-- �Խ��� (TML_BOARD) BOARD_NO (number) key, Board_title, board_content, writer, write_date
DROP TABLE BOARD;


create TABLE BOARD (
    Board_no number PRIMARY KEY,
    Board_title varchar2(100) NOT NULL,
    Board_content varchar2(2000) NOT NULL,
    writer varchar2(100),
    write_date varchar2(20)
);
rollback;
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('1', '����1', '����1', '�ۼ���1', '1��1��');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('2', '����2', '����2', '�ۼ���2', '1��2��');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('3', '����3', '����3', '�ۼ���3', '1��3��');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('4', '����4', '����4', '�ۼ���4', '1��4��');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('5', '����5', '����5', '�ۼ���5', '1��5��');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('6', '������2', '���ֿ�2', '�ۼ���6', '1��6��');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('7', '������2', '���ֿ�2', '�ۼ���7', '1��7��');

commit;
select * from board WHERE board_no Like '%2%' OR BOard_title Like '%2%' or board_content like '%2%' ;

-- �� ���ڸ� ��ȸ�� ���� �ϳ��� java�ڵ�� ������, => title, content �Է¹޾� �� insert ��Ŵ
SELECT max(board_no)+1 from board;

--UPDATE TABLE�� SET �ٲ��÷� = �ٲܰ� WHERE ����
--UPDATE �� DELETE�� ������ ������ ������ ������ ��ü�࿡ ���� ������ �߻���. (����)
UPDATE "HANUL"."BOARD" SET BOARD_TITLE = '����1����' WHERE board_no = 1;

DELETE FROM "HANUL"."BOARD" WHERE BOARD_NO=2;