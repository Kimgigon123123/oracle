-- �������� 3-4

SELECT employee_id,first_name,department_id,NVL2(manager_id,To_char(manager_id),'NO Manager') AS manager
FROM employees;

-- �������� 3-5

--1.
SELECT employee_id,first_name,Job_id,
    DECODE (JOB_ID, 'AD_PRES','A',
                    'ST_MAN', 'B',
                    'IT_PROG','C',
                    'SA_REP', 'D',
                    'ST_CLERK', 'E',
                    'X') AS "���"
FROM employees;
                    


--2.

SELECT employee_id,first_name,hire_date,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) AS �ٹ����,
CASE WHEN TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)<16 THEN '16�� �̸�'
     WHEN TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)<18 THEN '18�� �̸�'
     WHEN TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)<20 THEN '20�� �̸�'
    
     ELSE '20�� �̻�'
END AS "�ټӻ���"
FROM EMPLOYEES;