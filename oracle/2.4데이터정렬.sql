--2.4 ������ ����
-- ���� ������� �ʴ°� ���� == > ���� ���� (�����ͺ��̽� ������, ��Ƽ������(=����ȭ),Ʃ��)
-- �⺻������ �ش� ���̺��� �ĺ���(=�����ϰ�/�ߺ����� �ʴ� �����͸� �����ϴ� � ��)
-- ex> ����� ��� �ֹι�ȣ 
--SELECT *
--FROM employees
--ORDER BY �÷��� [ASC|DESC] ;-- [] : �ɼ� , ASC (=�⺻��)
-- ASC : Aseending / �������� : ������ -- > ū��
-- DESC : Descending / �������� : ū�� -- > ������
-- ORDER BY�� �ʹ� ���� ������� �ʴ°� �Ƿ� ���� ��� ����ȴ�.
-- �����ͺ��̽� ���ο��� ���̺� �ۼ��Ҷ� �⺻������ ���̺��� �ĺ��ڸ� �������� ���� �ǰ� ���ִµ�,
-- �߸� ��ȸ�ϰ� �Ǹ� �Ƿ� ��ȸ�ӵ��� ������ �� ����
-- 1) �����ͺ��̽� ���ο��� ���� [���� DB ������ ���� �پ�ϱ�~ ����]
-- 2) ���ø����̼� (�񵿱���� -- JSON ������ ����)
-- ==========================================================
-- desc or describe : ���̺��� ���� ��ȸ(=���̺��� �÷� ����, �ڷ���, ���̰�)
-- ���� : SELECT ���� ���Ͽ��� ��ȸ�� ����� Ư�� Į���� �������� ���� ��������, �������� ����
-- �� SELECT���� ���� �������� ORDER BY�� �ۼ��Ѵ�(��ġ�Ѵ�)



--SELECT *
--FROM employees
--order by employee_id ASC;
--WHERE ������; -- Wrong!!!
--
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--WHERE

[����2-40] 80�� �μ��� ��������� ����, �̸��� ������������ �����Ѵ�.
--�������� : ������ --> ū��
SELECT employee_id,first_name,salary,department_id
FROM employees
WHERE department_id=80
ORDER BY first_name ASC; -- ��������(�⺻��)

[����2-41] 80�� �μ��� ��������� ����, �̸��� ������������ �����Ѵ�.
--�������� : ū�� --> ������
SELECT employee_id,first_name,salary,department_id
FROM employees
WHERE department_id=80
ORDER BY first_name DESC;

[����2-42] 60�� �μ��� ��������� ���� ��޿��� ������������ �����Ѵ�.
SELECT employee_id,first_name,salary*12 AS ANNUAL_SALARY,department_id
FROM employees
WHERE department_id=80
ORDER BY ANNUAL_SALARY;

--============================================
--ORDER BY ���� �÷��� �Ǵ� �÷��� Alias(=��Ī,���)�� �̿��� ���� ����
--    "     �÷��� ��ġ���� �̿���
--============================================

SELECT employee_id,first_name,salary,department_id
FROM employees
WHERE department_id=80
ORDER BY 2 ASC; // = ORDER BY first_name ASC


--p.16 ORDER BY ���Ĵ��;
-- ���Ĵ�� �÷��� 1���� �ƴ϶��?
-- ��) �̸��� ��������, �޿��� �������� �����Ѵٸ�
SELECT employee_id,last_name,salary,department_id
FROM employees
ORDER BY last_name , salary DESC;
--�̸��� �޿��� �ϳ��� ���� �������� �����ؼ� ����