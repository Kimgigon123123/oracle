--1. ���μ��� ���� �μ��ڵ�, �μ���, �μ��� ��ġ�� �����̸��� ��ȸ�ϴ� �������� ��Į�� ���������� ����Ͽ� �ۼ��Ѵ�

select department_id,department_name,
        (select city
         from locations l
         where l.location_id=d.location_id) AS city_name
from departments d;

select d.department_id, d.department_name, l.city
from departments d , locations l
where d.location_id = l.location_id
order by 1;
