-- 게시판 (TML_BOARD) BOARD_NO (number) key, Board_title, board_content, writer, write_date
DROP TABLE BOARD;


create TABLE BOARD (
    Board_no number PRIMARY KEY,
    Board_title varchar2(100) NOT NULL,
    Board_content varchar2(2000) NOT NULL,
    writer varchar2(100),
    write_date varchar2(20)
);
rollback;
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('1', '제목1', '내용1', '작성자1', '1월1일');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('2', '제목2', '내용2', '작성자2', '1월2일');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('3', '제목3', '내용3', '작성자3', '1월3일');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('4', '제목4', '내용4', '작성자4', '1월4일');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('5', '제목5', '내용5', '작성자5', '1월5일');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('6', '제에목2', '내애용2', '작성자6', '1월6일');
INSERT INTO "HANUL"."BOARD" (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, WRITER, WRITE_DATE) VALUES ('7', '제에목2', '내애용2', '작성자7', '1월7일');

commit;
select * from board WHERE board_no Like '%2%' OR BOard_title Like '%2%' or board_content like '%2%' ;

-- ↓ 숫자를 조회를 따로 하나를 java코드로 가져옴, => title, content 입력받아 글 insert 시킴
SELECT max(board_no)+1 from board;

--UPDATE TABLE명 SET 바꿀컬럼 = 바꿀값 WHERE 조건
--UPDATE 와 DELETE는 조건을 별도로 만들지 않으면 전체행에 대한 수정이 발생함. (삭제)
UPDATE "HANUL"."BOARD" SET BOARD_TITLE = '제목1수정' WHERE board_no = 1;

DELETE FROM "HANUL"."BOARD" WHERE BOARD_NO=2;