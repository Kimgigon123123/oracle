-- 연습문제 3-4

SELECT employee_id,first_name,department_id,NVL2(manager_id,To_char(manager_id),'NO Manager') AS manager
FROM employees;

-- 연습문제 3-5

--1.
SELECT employee_id,first_name,Job_id,
    DECODE (JOB_ID, 'AD_PRES','A',
                    'ST_MAN', 'B',
                    'IT_PROG','C',
                    'SA_REP', 'D',
                    'ST_CLERK', 'E',
                    'X') AS "등급"
FROM employees;
                    


--2.

SELECT employee_id,first_name,hire_date,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) AS 근무년수,
CASE WHEN TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)<16 THEN '16년 미만'
     WHEN TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)<18 THEN '18년 미만'
     WHEN TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)<20 THEN '20년 미만'
    
     ELSE '20년 이상'
END AS "근속상태"
FROM EMPLOYEES;