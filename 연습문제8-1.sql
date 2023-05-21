[��������8-1]

1.EMP ���̺� (������) ������ ���� �����Ͻÿ�

-- DML : INSERT, UPDATE, DELETE
INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (400, 'Johns', 'Hopkins', '2008/10/15', 5000);

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (401, 'Abraham', 'Lincoln', '2010/03/03', 12500);

INSERT INTO emp (emp_id, fname, lname, hire_date,salary)
VALUES (402, 'Tomas', 'Edison', '2013/06/21', 5000);

select emp_id, fname, lname, hire_date,salary
from emp;

2. EMP ���̺��� ��� 401�� ����� �μ��ڵ带 90, �����ڵ带 SA_MAN ���� �����ϰ� ������ ���� ������ Ȯ���Ѵ�.

UPDATE emp
set dept_id = 90,
    job_id = 'SA_MAN'
where emp_id=401;

select *
from emp;

commit;

rollback;

3. EMP ���̺��� �޿��� 8000 �̸��� ��� ����� �μ��ڵ带 80������ �����ϰ�, �޿��� employees ���̺���
80�� �μ��� ��� �޿��� ������ �����Ѵ�.
(��, ��ձ޿��� �ݿø��� ������ ����Ѵ�.)

--������ Ȯ��
SELECT *
from emp
WHERE salary < 8000;

-- employees ���̺��� 80�� �μ����� ��� �޿� ��ȸ
SELECT ROUND(AVG(salary))
from employees
where department_id = 80;

UPDATE emp
set dept_id = 80,
    salary = (select Round(AVG(salary))
                from employees
                group by department_id
                having department_id=80)
where salary < 8000;
                
4. emp ���̺��� 2010�� ���� �Ի��� ����� ������ �����Ѵ�.

delete from emp
where hire_date < '2009-12-31';