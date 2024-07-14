-- Windows Function

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
GROUP BY gender  
;

SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id  
;

# gives same info but the partition will show everyone
# used if you want to show more info about each person

# why using group by won't work
SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender  
;

# if we dont use partition, the group by uses by first name, 
# THERE IS NO WAY TO SAY I JUST WANT TO SEPARATE OUT AND GROUP BY GENDER
# Partition by allow us to group by gender independently

SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_total
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id  
;
# order by will show the increasing sum of salary 
#whenever the next person (ordered by their employee_id) is counted
# in this case, the total is broken up by their gender

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION  BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION  BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION  BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id  
;
#row num is unique
# rank literally ranks by the salary so if it is a tie (duplicate values), they share same rank and 
# next one the position counting how many values shared the same rank (like how competition ranks athletes)
# dense_rank ignores how many came before that shared the same rank, just give next numerical number