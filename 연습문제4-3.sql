--1.

SELECT first_name, count(*)
FROM employees
Group BY first_name
HAVING count(*)>=2
ORDER BY COUNT(*);

--2. 
SELECt department_id, SUM(salary) AS "±Þ¿©ÃÑ¾×", ROUND(AVG(salary))"Æò±Õ±Þ¿©"
FROM employees
GROUP BY department_id
HAVING avg(salary)>=8000
ORDER BY department_id;

--3.
SELECT TO_CHAR(hire_date,'YYYY'),count(*)
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY')
ORDER BY 1;