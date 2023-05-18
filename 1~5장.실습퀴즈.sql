--1. ��� ���̺��� 20��,30�� �μ��� �ٹ��ϴ� ����� �޿��� 2000 �ʰ��� ����� ��ȸ�Ͻÿ�

select employee_id
from employees
where department_id IN (20,30)
and salary > 2000;

--2. 30�� �μ��� �ٹ��ϴ� ����� ��ȸ�Ͽ� ���, �̸�, �����ڵ�, �μ��ڵ带 ��ȸ�ϼ���
-- �� �����ڵ尡 PU_CLERK�� ����� ��ȸ
select employee_id,first_name,job_id,department_id
from employees
where department_id=30
and job_id='PU_CLERK';

--3. employees ���̺��� �̿���, ������ ���� ����� �������� SQL���� �ۼ��غ�����!
-- �̸��� s�� ������ ������� ��ȸ�غ�����

select employee_id,first_name,job_id
from employees
where first_name like '%s';

--4. ����� �̸��� 5���� �̻��̸�, 6���� �̸��� ��������� �������� ����� �� ���ڸ��� *��ȣ�� ����ϰ� �̸��� ù���ڸ� �����ְ�
-- �������� ���ڼ���ŭ *�� ǥ���ϼ���

select employee_id AS EMPNO, rpad(substr(employee_id,1,2),4,'*') AS MASKING_EMPNO, first_name AS ENAME, rpad(substr(first_name,1,1),6,'*') AS MASKING_NAME
from employees
where length(first_name) >= 5 and length(first_name) < 6;

--5. ������̺���, ������� �Ի����� �������� 3������ ���� ������ �������� �ȴٰ� ������
-- �ش� ��¥�� convert_date��� �÷��� ����ϼ���
-- commission_pct�� ���� ����� null�� �ȴ� 0���� ����ϼ���

select employee_id, first_name, hire_date, add_months(hire_date,3) AS convert_date,nvl(commission_pct,0)
from employees;


--6. �Ŵ��� �ڵ尡 �������� �ʴ� ��� : 0000
-- �Ŵ��� �ڵ� �� ���ڸ��� 10�� ��� : 1010
-- �Ŵ��� �ڵ� �� ���ڸ��� 11�� ��� : 1111
-- �Ŵ��� �ڵ� �� ���ڸ��� 12�� ��� : 1212
-- �� �� : ������ �Ŵ��� �ڵ带 �״�� ���

select employee_id,first_name,manager_id,
case
when manager_id is null then '0000'
when substr(manager_id,1,2)=10 then '1010'
when substr(manager_id,1,2)=11 then '1111'
when substr(manager_id,1,2)=12 then '1212'
else substr(manager_id,1)
end new_mgr
from employees;

--7. ������ ���� ����� �������� SQL���� �ۼ��غ�����
-- ������� ����� �ٹ��ϼ��� 21.5��
-- �Ϸ� �ٹ� �ð��� 8�ð� ����
-- ������� ���� �޿��� �ñ��� ����Ͽ� ���,���� �Բ� ���

select employee_id, last_name, salary,trunc(salary/21.5,2) AS day_sal,  trunc(trunc(salary/21.5,2)/8,1) AS time_salary
from employees;

--8. �μ���ȣ, ��ձ޿�, �ְ�޿�, �����޿�, ������� ���

select department_id,trunc(avg(salary)),max(salary),min(salary),count(employee_id)
from employees
group by department_id
order by department_id;

--9. �����ڵ�� AA_BBBBB ����, ������ BBBBB�� ����
-- 3�� �̻��� ������ ��ȸ

--select substr(job_id,4),count(job_id)
--from employees
--group by substr(job_id,4)
--having count(substr(job_id,4))>=3;

--10.������� �Ի�⵵ ����
-- �μ����� �Ի��� ���� ��ȸ

--select to_char(hire_date,'yyyy'),department_id,count(to_char(hire_date,'yyyy'))
--from employees
--group by to_char(hire_date,'yyyy'),department_id
--order by 1;

--11. Ŀ�̼��� �޴� ����� o, �׷��� ���� ����� x�� �����ϰ� �� ���� ��ȸ

select nvl2(commission_pct,'o','x'),count(nvl2(commission_pct,'o','x'))
from employees
group by nvl2(commission_pct,'o','x');

----12. �� �μ��� �Ի� �⵵�� �����, �ְ�޿�, �����޿�, ��ձ޿��� ����ϰ� �� �μ��� �Ұ�, �Ѱ踦 ���ϼ���
--select department_id,to_char(hire_date,'yyyy'),count(employee_id),max(salary),sum(salary),avg(salary)
--from employees
--group by department_id,rollup(to_char(hire_date,'yyyy'))
--order by 1;

--13. �޿��� 2000�ʰ��� ������� �μ��ڵ�, �μ���,���,�̸�,�޿��� ��ȸ�Ͻÿ�
select e.department_id,d.department_name,employee_id,first_name,salary
from employees e , departments d
where e.salary>2000
and e.department_id = d.department_id;

--14. �μ��� ��ձ޿�, �ִ�޿�, �����޿�, ����� ��ȸ
select d.department_id,d.department_name,trunc(avg(salary)),max(salary),min(salary),count(d.department_id)
from departments d, employees e
where d.department_id = e.department_id
group by d.department_id, d.department_name
order by department_id;

--15.
select e.department_id, d.department_name, e.employee_id, e.first_name, e.job_id, e.salary
from employees e , departments d
where e.department_id = d.department_id;

--16. ���� ��ҹ��� �����ϰ� z�� �ִ� ���� ���� ������� ���, ��, �μ��ڵ�, �μ��� ��ȸ�ϼ���
select e.employee_id,e.last_name,e.department_id,d.department_name
from employees e , departments d
where e.department_id=d.department_id
and upper(e.last_name) like '%Z%';

--17. ������ ����� 149�� ������� ������ �Ʒ��� ���� ��ȸ�ϼ���
select e.employee_id, e.last_name, e.department_id,d.department_name
from employees e,departments d
where e.department_id = d.department_id(+)
and e.manager_id=149;

--18. �μ��ڵ尡 60�� ������ �μ��� ���� �μ��� ��� �޿��� 5000�̻��� �μ��� �μ��ڵ�,��� ��, �޿��հ�,�޿����,
-- �ִ�޿�, �ֱ��Ի�����, �����Ի����ڸ� ��ȸ�غ�����

select employee_id,department_id,count(employee_id),sum(salary),trunc(avg(salary)),max(salary),max(hire_date),min(hire_date)
from employees
group by employee_id,department_id
having department_id <= 60 and trunc(avg(salary))>=5000
order by 1;

--19.��������(job_id)���� ������� ������ �ľ��ϰ��� �Ѵ�. ���� ���º��� ������� 10�� �̻��� ���� ���¿�
-- ���� �����ڵ�, ������ �����, ������ ��ձ޿�, ������  �ִ�޿�, ������ �ֱ� �Ի�����, ������ �����Ի����� ��ȸ�غ�����!!

select job_id,count(job_id),trunc(avg(salary)),max(salary),max(hire_date),min(hire_date)
from employees
group by job_id
having count(job_id) >=10

