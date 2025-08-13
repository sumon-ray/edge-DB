

-- =========================================
-- PART A – Basic SQL
-- =========================================

-- Q1 (3 marks) Create Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) DEFAULT 'Dhaka'
);

-- Insert sample data
INSERT INTO Departments VALUES
(101, 'Finance', 'Dhaka'),
(102, 'HR', 'Dhaka'),
(103, 'IT', 'Chattogram');

-- Q2 (3 marks) Insert given department record
INSERT INTO Departments (dept_id, dept_name, location)
VALUES (104, 'IT', 'Chattogram');

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    designation VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert sample data into Employees
INSERT INTO Employees VALUES
(1, 'Rahim', 'Manager', 75000, 101),
(2, 'Karim', 'Developer', 55000, 103),
(3, 'Salma', 'HR Officer', 48000, 102),
(4, 'Nadia', 'Developer', 65000, 103),
(5, 'Babul', 'Accountant', 50000, 101);

-- Q3 (3 marks) Retrieve all employees earning more than 50,000
SELECT * 
FROM Employees
WHERE salary > 50000;

-- Q4 (3 marks) Display all distinct job designations
SELECT DISTINCT designation
FROM Employees;

-- Q5 (3 marks) Delete all employees working in department 103
DELETE FROM Employees
WHERE dept_id = 103;

-- =========================================
-- PART B – Intermediate SQL 
-- =========================================

-- Create Projects table
CREATE TABLE Projects (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(50) NOT NULL,
    dept_id INT,
    budget DECIMAL(15,2),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert sample data into Projects
INSERT INTO Projects VALUES
(201, 'ERP Upgrade', 103, 3000000),
(202, 'Recruitment Drive', 102, 1500000),
(203, 'Budget Planning', 101, 2500000),
(204, 'Data Migration', 103, 4000000),
(205, 'Security Audit', 103, 2000000);

-- Create Assignments table
CREATE TABLE Assignments (
    emp_id INT,
    proj_id INT,
    hours_worked INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Projects(proj_id)
);

-- Insert sample data into Assignments
INSERT INTO Assignments VALUES
(1, 203, 100),
(2, 201, 120),
(2, 204, 80),
(4, 201, 90),
(4, 205, 70);

-- Q6 (4 marks) emp_name, dept_name, location for all employees
SELECT e.emp_name, d.dept_name, d.location
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- Q7 (4 marks) Employees not assigned to any project
SELECT e.*
FROM Employees e
LEFT JOIN Assignments a ON e.emp_id = a.emp_id
WHERE a.emp_id IS NULL;

-- Q8 (4 marks) Average salary per department, only > 60,000
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000;

-- Q9 (4 marks) proj_name and total hours worked
SELECT p.proj_name, SUM(a.hours_worked) AS total_hours
FROM Projects p
JOIN Assignments a ON p.proj_id = a.proj_id
GROUP BY p.proj_name;

-- Q10 (4 marks) Employees earning more than their department's average
SELECT e.emp_name, e.salary, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

-- =========================================
-- PART C – Applied Query
-- =========================================

-- Q11 High-budget project departments
SELECT d.dept_name,
       COUNT(p.proj_id) AS number_of_projects,
       SUM(p.budget) AS total_budget
FROM Departments d
JOIN Projects p ON d.dept_id = p.dept_id
GROUP BY d.dept_name
HAVING COUNT(p.proj_id) > 2
   AND SUM(p.budget) > 5000000
ORDER BY total_budget DESC;

