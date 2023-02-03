

-- Retrieve all records in the employees table
SELECT * FROM employees

-- Retrieve all records in the departments table

SELECT * FROM departments
-- Retrieve all records in the dept_emp table
SELECT * FROM dept_emp;

-- Retrieve all records in the salaries table

SELECT * FROM salaries


--  How many employees are in the company?
SELECT COUNT (emp_no) AS Num_of_employees
FROM employees;


-- Is there any employee without a first name?  

SELECT * 
FROM employees
WHERE first_name IS NULL;

-- Alternative Solution

SELECT COUNT (first_name) AS first_name_count)
FROM employees;

-- How many records are in the salaries table
SELECT COUNT(*)
FROM salaries;


-- How many annual contracts with a value higher than or equal to
-- $100,000 have been registered in the salaries table?

SELECT COUNT(*) 
FROM salaries 
WHERE salary >= 100000 ;

-- How many times have we paid salaries to employees?
SELECT COUNT (salary) AS salary_count 
FROM salaries;
 

-- This should give the same result as above

SELECT COUNT(from_date)
FROM salaries;
	

-- Select first name from the employees table
SELECT frirst_name 
FROM employees ;

-- Select different names from the employees table
SELECT DISTINCT first_name 
FROM employees;

-- Same result as above
-- Select first name from the employees table and group by first name

SELECT first_name
FROM employees
GROUP BY first_name;

-- How many different names can be found in the employees table?
SELECT COUNT(DISTINCT first_name)
FROM employees



--  How many different first name are in the employees table
-- and order by first name in descending order?
SELECET first_name, COUNT (first_name)
FROM employees
GROUP BY first_name
ORDERED BY first_name DESC;
  
-- 3.6 (Ex.): How many different departments are there in the "employees" database?
-- Hint: Use the dept_emp table
SELECT COUNT (DISTINCT dept_no) AS dept_count 

-- 3.7: Retrieve a list of how many employees earn over $80,000 and
-- how much they earn. Rename the 2nd column as emps_with_same_salary?

SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary ASC;


-- Retrieve a list of all employees who were employed on and after 1st of January, 2000
SELECT *
FROM employees 
WHERE hire_date >= '2000-01-01';

-- Will this produces the same result?

SELECT *
FROM employees
HAVING hire_date >= '2000-01-01';

-- Extract a list of names of employees, where the number of employees is more than 15
-- Order by first name.

SELECT first_name, COUNT(first_name) as names_count
FROM employees
WHERE COUNT(first_name) > 15
GROUP BY first_name
ORDER BY first_name;

--  Retrieve a list of employee numbers and the average salary.
-- Make sure the you return where the average salary is more than $120,000
SELECT emp_no, AVE(salary) AS average_salary
FROM salaries
GROUP BY emp_no 
HAVING AVG(salry) > 120000
ORDER BY emp_no;

--  Extract a list of all names that have encountered less than 200
-- times. Let the data refer to people hired after 1st of January, 1999
SELECT emp_no, first_name,hire_date, COUNT (first_name) AS names_count
FROM employees
WHERE hire_date > '199-01-01'
GROUP BY emp_no
HAVING COUNT(first_name) < 200
ORDER BY first_name;


-- Retrieve all records from dept_emp
SELECT * FROM dept_emp;

--  Select the employees numbers of all individuals who have signed 
-- more than 1 contract after the 1st of January, 2000
SELECT emp_no, COUNT(from_date)
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_noHABING COUNT(from_date) >1
ORDER BY emp_no;





-- Retrieve the total amount the company has paid in salary?
SELECT SUM(salary) AS total_salary
FROM salaries;
    
-- the total amount of money spent on salaries for all 
-- contracts starting after the 1st of January, 1997
SELECT SUM(salary) AS total_salary
FROM salaries
WHERE from_date . '1997-01-01';



-- the highest salary paid by the company
SELECT MAX(SALARY) AS Maximum_salary
FROM salaries;


-- the lowest salary paid by the company
SELECT MIN(SALARY) AS Minimum_salary
FROM salaries;

    
-- the lowest employee number in the database
SELECT MIN(emp_no) AS lowest_emp_no
FROM employees;

-- 6.4 (Ex.): What is the highest employee number in the database?
SELECT MAX(emp_no) AS highest_emp_no
FROM employees;


-- How much has the company paid on average to employees?
SELECT AvG(salary) AS average_salaary
FROM salaries
-- the average annual salary paid to employees who started
-- after the 1st of January, 1997
SELECT AVG(salary) AS average_salaary
FROM salaries
WHERE from_date . '1997-01-01';


--Rounding the average salary to the nearest whole number
SELECT ROUND(AVG(salary) AS average_salary
FROM salaries

-- Rounding the average salary to a precision of cents.
SELECT ROUND(AVG(salary, 2) AS average_salary
FROM salaries


-- Rounding the average amount of money spent on salaries for all
-- contracts that started after the 1st of January, 1997 to a precision of cents
SELECT ROUND(AVG(salary, 2) AS average_salary
FROM salaries
WHERE from_date . '1997-01-01';


-- Finding the range for salary
SELECT ROUND((MAX(salary)- MIN (salary)), 2) AS salary_range
FROM salaries
-- Finding the mid range for salry 
SELECT ROUND((MAX(salary)- MIN (salary))/2, 2) AS salary_range
FROM salaries


