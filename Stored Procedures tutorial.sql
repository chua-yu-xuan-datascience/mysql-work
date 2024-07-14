-- Stored Procedures

SELECT * 
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT * 
FROM employee_salary
WHERE salary >= 50000;
#this proc is then stored under parks and recreation

CALL large_salaries();

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
    SELECT * 
    FROM employee_salary
    WHERE salary>=50000;
    SELECT * 
    FROM employee_salary
    WHERE salary>=10000;
END $$
DELIMITER ;

CALL large_salaries2();
# when we dont use delimiter, the ; will tell when the procedure ends 
# and the second part is not recorded as part of the large_salaries2
# so we use delimiter to tell the comp to recognise $$ as the end of our query
# so the ; can be used to separate the statements but not end the boundary of the proc
# then the end $$ says it is the end of making the proc
# delimiter ; to change it back to ; if not we are gonna be using $$ all the time

DELIMITER $$
CREATE PROCEDURE large_salaries3(p_employee_id INT)
BEGIN
    SELECT salary
    FROM employee_salary
    WHERE employee_id=p_employee_id
    ;
END $$
DELIMITER ;

CALL large_salaries3(1);

# huggymuffin is just a parameter, can be called anything (like x/i)
# this param is smth from the table that you want to find things by
# here, we want to find the salary of someone using their employee_id
# when you call it, you must call it with a value that matches that you specify it to be 
#(INT in this case)