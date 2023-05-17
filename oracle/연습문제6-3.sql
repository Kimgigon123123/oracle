--1. 각부서에 대해 부서코드, 부서명, 부서가 위치한 도시이름을 조회하는 쿼리문을 스칼라 서브쿼리를 사용하여 작성한다

select department_id,department_name,
        (select city
         from locations l
         where l.location_id=d.location_id) AS city_name
from departments d;

select d.department_id, d.department_name, l.city
from departments d , locations l
where d.location_id = l.location_id
order by 1;
