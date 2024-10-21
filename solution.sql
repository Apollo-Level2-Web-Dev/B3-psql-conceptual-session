-- Active: 1729489322378@@127.0.0.1@5432@psql_conceptual

-- Create departement table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT
);

-- create employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    department_id INT REFERENCES departments (department_id),
    is_active BOOLEAN
);

-- insert data into departments table
INSERT INTO
    departments (department_name, manager_id)
VALUES ('Human Resources', 1),
    ('Finance', 2),
    ('Engineering', 4);

SELECT * FROM departments;

-- insert data into employees table
INSERT INTO
    employees (
        first_name,
        last_name,
        hire_date,
        salary,
        department_id,
        is_active
    )
VALUES (
        'John',
        'Doe',
        '2021-05-10',
        50000.00,
        1,
        TRUE
    ),
    (
        'Jane',
        'Smith',
        '2022-03-15',
        62000.00,
        2,
        TRUE
    ),
    (
        'Alice',
        'Johnson',
        '2023-01-20',
        55000.00,
        1,
        FALSE
    ),
    (
        'Bob',
        'Davis',
        '2020-11-30',
        72000.00,
        3,
        TRUE
    );

SELECT * FROM employees;

INSERT INTO
    employees (
        first_name,
        last_name,
        hire_date,
        salary,
        department_id,
        is_active
    )
VALUES (
        'Shafayet',
        'Bhai',
        '2021-05-10',
        50000.00,
        15,
        TRUE
    );

-- Select all active employees.
SELECT * FROM employees WHERE is_active = TRUE;

-- Find all employees in the Finance department.
SELECT e.*
FROM employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    d.department_name = 'Finance';

-- Calculate the total salary for employees in the Engineering department.
SELECT SUM(salary) AS total_salary
FROM employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    d.department_name = 'Engineering';

-- Select employee names and salaries, aliasing first_name as First Name and salary as Employee Salary.
SELECT
    first_name AS "First Name",
    salary AS "Employee Salary",
    hire_date
FROM employees
ORDER BY hire_date DESC;

-- List all departments where the manager_id is NULL
SELECT * from departments WHERE manager_id = NULL;

-- Find all employees whose last_name starts with "J".
SELECT * FROM employees WHERE last_name ILIKE 'J%';

-- Get employees hired between 2021-01-01 and 2022-12-31.
SELECT *
FROM employees
WHERE
    hire_date BETWEEN '2021-01-01' AND '2022-12-31';

-- Use ALTER TABLE to add a new column, phone_number, to the employees table.
ALTER TABLE employees ADD COLUMN phone_number VARCHAR(15);

-- update phone number
UPDATE employees
SET
    phone_number = '1234567890'
WHERE
    employee_id = 3;

-- Modify the salary column to increase its precision if necessary.
ALTER TABLE employees ALTER COLUMN salary TYPE NUMERIC(12, 2);

-- Find all employees and their manager's name (self-join if managers are also employees).
SELECT e.first_name AS employee_name, m.first_name AS manager_name
FROM employees e
    JOIN employees m ON e.employee_id = m.department_id;

-- Find the highest-paid employee using a subquery.

SELECT *
FROM employees
WHERE
    salary = (
        SELECT MAX(salary)
        FROM employees
    );

-- Retrieve all employees whose salary is above the average salary.

SELECT AVG(salary) FROM employees;

SELECT *
FROM employees
WHERE
    salary > (
        SELECT AVG(salary)
        FROM employees
    );

-- Create a view called active_employees that shows only active employees and their departments.
CREATE VIEW active_employees AS
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    e.is_active = TRUE;

SELECT * FROM active_employees;

-- Create an index on the last_name column of the employees table to speed up search queries.

SELECT * FROM employees WHERE first_name = 'Bob';

CREATE INDEX idx_first_name ON employees (first_name);

SELECT * FROM employees WHERE first_name = 'Bob';

-- Drop the index if needed.
DROP INDEX IF EXISTS idx_first_name;

-- Write a query to fetch the first 2 employees ordered by employee_id, and then implement pagination using LIMIT and OFFSET.
SELECT * FROM employees ORDER BY employee_id LIMIT 2;

SELECT * FROM employees ORDER BY employee_id LIMIT 2 OFFSET 2;