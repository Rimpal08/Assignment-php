-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- INSERT queries : 
-- Insert into departments
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Finance'),
(4, 'Marketing');

-- Insert into employees
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES
(1, 'John', 'Doe', 2, 80000, '2020-05-01'),
(2, 'Jane', 'Smith', 3, 75000, '2019-04-15'),
(3, 'Alice', 'Johnson', 1, 60000, '2021-06-30'),
(4, 'Bob', 'Brown', 2, 85000, '2018-11-20'),
(5, 'Eve', 'Davis', 4, 70000, '2020-01-10');
-- INSERT queries end


-- SELECT queries :
SELECT * FROM employees;

-- WHERE query example :
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 70000;

-- LIKE query example :
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'J%';

-- AND, OR and NOT subqueries examples :
SELECT first_name, last_name, salary
FROM employees
WHERE department_id = 2 AND salary > 80000;

SELECT first_name, last_name
FROM employees
WHERE NOT department_id = 1;


-- GROUP BY query example :
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- HAVING query example :
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 70000;

-- UPDATE query example :
UPDATE employees
SET salary = 90000
WHERE employee_id = 4;

-- DELETE query example :
DELETE FROM employees
WHERE employee_id = 5;

-- LIMIT and OFFSET query example :
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 2;

-- Skip the first record and fetch the next two
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 2 OFFSET 1;

-- Subquery example :
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);