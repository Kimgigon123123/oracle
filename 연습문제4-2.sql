--1.

SELECT COUNT(commission_pct)
FROM employees;


--2.
SELECT max(hire_date)
FROM employees;

SELECT TO_CHAR(round(AVG(salary),2),'999,999')
FROM employees
WHERE department_id = 90;