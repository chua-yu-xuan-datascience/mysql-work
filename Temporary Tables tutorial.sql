-- Temporary Tables

## METHOD 1
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)
);
# will not be shown in parks_and_recreation

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES ('Alex', 'Freberg', 'Lord of The Rings: The Two Towers');

SELECT *
FROM temp_table;

## METHOD 2
SELECT * FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary>=50000;

SELECT * FROM salary_over_50k;

# temp tables exist as long as your session
# you can copy salary_over_50k into a new script right now and the table still exists
# but when you exit out and come back in, it is gone