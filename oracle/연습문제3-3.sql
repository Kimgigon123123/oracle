[연습문제3-3]

--1.
SELECT employee_id,first_name,salary,trunc(months_between(SYSDATE,hire_date)) AS "근무개월수"
FROM employees
WHERE department_id=30;

--2.
SELECT employee_id,first_name,TO_CHAR(salary,'9,999,999') AS salary
from employees
WHERE salary >= 12000
ORDER BY salary DESC;

--3.
SELECT employee_id,first_name,hire_date,TO_CHAR(hire_date,'DAY') AS "업무 시작 요일"
--DAY -> 금요일, DY -> 금
FROM employees
WHERE hire_date < '2005-01-01'
ORDER BY hire_date desc;