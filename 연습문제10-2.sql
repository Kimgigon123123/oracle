--[연습문제10-2]


1. 이메일 정보가 없는 배역들의 모든 정보를 조회
SELECT *
FROM characters
where email is null;

2. 역할이 시스에 해당하는 등장인물을 조회
역할 정보 테이블 : roles
select *
from characters
where role_id = (select role_id
                    from roles
                    where role_name ='시스');


3. 에피소드4에 출연한 배우들의 실제 이름을 조회
-- star_wars : 영화정보(에피소드 아이디,에피소드명,개봉연도)
-- characters : 등장인물정보(아이디,이름,마스터아이디,역할아이디,이메일)
--casting : 등장인물과 배우정보(에피소드 아이디, 캐릭터 아이디, 실제이름)

select *
from casting
where episode_id = 4;

4. 에피소드5에 출연한 배우들의 배역이름과 실제이름
--배역이름 : character_name    < characters 테이블>
--실제이름 : real_name               <casting 테이블>
--조인연산 : 다른 테이블의 컬럼을 가져와 마치 하나의 테이블인것처럼 데이터를 조회(수평)
--SET 연산 : 컬럼갯수, 데이터 타입만 맞으면 마치 하나의 테이블에서 데이터 조회한 결과 (수직)

SELECT ch.character_name AS 배역이름,
        ca.real_name AS 실제이름
from characters ch,casting ca
where ch.character_id = ca.character_id
and ca.episode_id=5;

5.국제표준 조인문으로 바꾸어 작성하시오
-- ANSI 조인 : inner join, outer join
-- on절 : where 조건절 대신
-- using : 컬럼의 별칭/약어 사용 X
-- 테이블 여러개 일때 : 먼저 조인한 결과에 다시 추가로 조인하는 형식
-- (+) : 오라클 아우터 조인 <---> [LEFT|RIGHT|FULL] OUTER JOIN

select c.character_name, p.real_name, r.role_name
from characters c left outer join casting p
on c.character_id = p.character_id
right outer join roles r
on c.role_id = r.role_id
and p.episode_id=2;

-- 에피소드 2편 출연자 3명의 배역명 | 실제 배우명 | 역할 이름 이 나와야 함
--characters 데이터와 casting 데이터간 불일치 : 교재 제공 vs 직접 데이터 수집/가공

--6. 문자열 함수를 이용해 characters 테이블의 배역이름,이메일,이메일아이디를 조회하시오
-- 단, 이메일이 아이디@도메인일때!
--substr() : 문자열 추출하여 반환
--instr() : 특정 문자열의 시작위치를 반환
--replace(),translate() : 치환/1:1 변환
--trim(),ltrim(),rtrim() : 문자열/기본값 공백 제거
--lpad(),rpad() : 문자열/공백 추가
--length() : 문자열 길이 반환


select character_name AS 배역이름,
        email AS 이메일,
        SUBSTR(email,1,INSTR(email,'@')-1) AS 이메일_아이디
from characters;


7.역할이 제다이에 해당하는 배역들의 배역이름, 그의 마스터 master_id
-- 서브쿼리
-- NULL 처리 함수 : NVL(exp1, exp2),NVL2(exp1, exp2, exp3)
-- COALESCE() : 최소 하나는 NULL 아니어야 하는 .. 최초 NULL 아닌 값 반환 함수

select *
from characters;

SELECT c.character_name, NVL(m.character_name,'무언가') AS masters
FROM characters c, roles r , characters m
where c.role_id = r.role_id
and r.role_name='제다이'
and nvl(c.master_id,0)=m.character_id(+)
order by 1;

