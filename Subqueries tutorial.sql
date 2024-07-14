-- subqueries
SELECT *
FROM employee_demographics
WHERE employee_id IN 
			      (SELECT employee_id
                         FROM employee_salary
                         WHERE dept_id = 1
);

SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;

SELECT AVG(max_age)
FROM 
(SELECT gender, 
AVG(age) AS avg_age, 
MAX(age) AS max_age, 
MIN(age) AS min_age, 
COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender) AS Agg_table
;

#must name the new table
#there is no age column in new table so the sys cannot perform agg
# but using `` will let sys just take the value NOT perform agg of agg of age
# but if you rename it, then just use the new name, no need ``