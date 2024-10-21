# **SQL Concepts and Tasks: Employees and Departments Database (PostgreSQL)**

## **Introduction**

In this session, we will explore fundamental SQL concepts using **PostgreSQL** by creating and manipulating two related tables: **employees** and **departments**. The **employees** table will store information about employees, including their names, hire dates, salaries, and active status. The **departments** table will hold details about various departments within an organization. Through a series of tasks, we will practice SQL operations such as creating tables, inserting data, defining constraints, querying information, and modifying tables. This hands-on approach will enhance your understanding of SQL and its practical applications in database management using PostgreSQL.

---

### **Sample Data Table 1: `employees`**

| employee_id | first_name | last_name | hire_date  | salary   | department_id | is_active |
| ----------- | ---------- | --------- | ---------- | -------- | ------------- | --------- |
| 1           | John       | Doe       | 2021-05-10 | 50000.00 | 1             | TRUE      |
| 2           | Jane       | Smith     | 2022-03-15 | 62000.00 | 2             | TRUE      |
| 3           | Alice      | Johnson   | 2023-01-20 | 55000.00 | 1             | FALSE     |
| 4           | Bob        | Davis     | 2020-11-30 | 72000.00 | 3             | TRUE      |

---

### **Sample Data Table 2: `departments`**

| department_id | department_name | manager_id |
| ------------- | --------------- | ---------- |
| 1             | Human Resources | 1          |
| 2             | Finance         | 2          |
| 3             | Engineering     | 4          |

---

### **Task List Based on the Above Tables**

#### **Task 1: Creating Tables with Multiple Columns and Data Types**
- **Create the `employees` table** with various data types like `VARCHAR`, `DATE`, `BOOLEAN`, and `NUMERIC`.
- **Create the `departments` table** with a `SERIAL` type for the primary key and a `VARCHAR` type for the department name.
- Ensure that the `first_name`, `last_name`, and `department_name` columns are `NOT NULL`.
- Add a `PRIMARY KEY` constraint to `employee_id` and `department_id`.
- Add a `FOREIGN KEY` constraint on `department_id` in the `employees` table that references `department_id` in the `departments` table.

#### **Task 2: Inserting Data and Checking Constraints**
- Insert sample records (as shown above) into the `employees` and `departments` tables.
- Attempt to insert a record where `first_name` is `NULL` to validate the `NOT NULL` constraint.
- Try to insert a record with a non-existent `department_id` to test the `FOREIGN KEY` constraint.

#### **Task 3: Querying the Data**
1. **Basic Queries:**
   - Select all active employees.
   - Find all employees in the Finance department.

2. **Aggregate Functions:**
   - Calculate the total salary for employees in the Engineering department.
   - Determine the average salary for all employees.

3. **Sorting and Aliasing:**
   - Select employee names and salaries, aliasing `first_name` as `First Name` and `salary` as `Employee Salary`.
   - Sort employees by their hire date in descending order.

4. **NULL Filtering:**
   - List all departments where the `manager_id` is NULL (if any records exist).

5. **Using `LIKE` and `BETWEEN`:**
   - Find all employees whose `last_name` starts with "J".
   - Get employees hired between `2021-01-01` and `2022-12-31`.

#### **Task 4: Modifying Tables**
- Use `ALTER TABLE` to add a new column, `phone_number`, to the `employees` table.
- Modify the `salary` column to increase its precision if necessary.
- Drop the `is_active` column from the `employees` table.

#### **Task 5: JOIN Operations**
- Write a query to join the `employees` and `departments` tables to display the department name for each employee.
- Find all employees and their manager's name (self-join if managers are also employees).

#### **Task 6: Subqueries**
- Find the highest-paid employee using a subquery.
- Retrieve all employees whose salary is above the average salary.

#### **Task 7: Views**
- Create a view called `active_employees` that shows only active employees and their departments.
- Select all data from the created view.

#### **Task 8: Indexing**
- Create an index on the `last_name` column of the `employees` table to speed up search queries.
- Drop the index if needed.

#### **Task 9: Pagination**
- Write a query to fetch the first 2 employees ordered by `employee_id`, and then implement pagination using `LIMIT` and `OFFSET`.

---
# B3-psql-conceptual-session
