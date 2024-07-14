-- CTEs (common table expressions)

WITH CTE_example (Gender, Avg_sal, Max_sal, Min_sal, Count_sal) AS
(
SELECT gender, AVG(salary) , MAX(salary) , MIN(salary), COUNT(salary) 
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(Avg_sal)
FROM CTE_example
;

#same function as subquery 
# but if you do it avg(savg_sal) from (select.... from agg_table) it is harder to read
# easier to read the table you are forming first and what u want to abstract later
# must use cte immediately after, cos it is not a real permanent table

# can write the new names at the top with the CTE

WITH CTE_example AS
(
SELECT EMPLOYEE_ID, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary >50000
)
SELECT *
FROM CTE_example 
JOIN CTE_example2
  ON CTE_example.employee_id = CTE_example2.employee_id
;