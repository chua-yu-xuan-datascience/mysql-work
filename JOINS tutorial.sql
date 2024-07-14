-- Joins
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
   on sal.employee_id = dem.employee_id
;
#missing id=2

-- OUTER JOINS
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
   ON sal.employee_id = dem.employee_id
;

-- SELF JOIN
SELECT emp1.employee_id AS EMP_SANTA,
emp1.first_name AS FIRST_NAME_SANTA,
emp1.last_name AS LAST_NAME_SANTA,
emp2.employee_id AS EMP,
emp2.first_name AS FIRST_NAME,
emp2.last_name AS LAST_NAME
FROM employee_salary emp1
JOIN employee_salary AS emp2
   ON emp1.employee_id+1 = emp2.employee_id
;

-- JOINING MULTIPLE TABLES TOGETHER
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
   on sal.employee_id = dem.employee_id
INNER JOIN parks_departments AS pd
   on sal.dept_id = pd.department_id;
