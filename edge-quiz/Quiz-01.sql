
-- Create Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Insert sample data for Departments
INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

-- Insert sample data for Students
INSERT INTO Students VALUES
(201, 'Amin', '2002-05-14', 1),
(202, 'Karim', '2004-03-21', 2),
(203, 'Salma', '2003-12-11', 1),
(204, 'Nadia', '2005-08-30', 3);

-- Q1 (2 marks) Retrieve all students born after 2003-01-01
SELECT * 
FROM Students
WHERE dob > '2003-01-01';

-- Q2 (2 marks) Display distinct department names
SELECT DISTINCT department_name
FROM Departments;

-- Q3 (3 marks) Show the name and department_name of all students
SELECT s.name, d.department_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;

-- Q4 (3 marks) Insert a new student record
INSERT INTO Students (student_id, name, dob, department_id)
VALUES (205, 'Rafiq', '2004-11-10', 2);

-- =========================================
-- QUIZ 2 – Intermediate SQL (10 Marks)
-- =========================================

-- Drop existing tables if they exist
DROP TABLE IF EXISTS Assignments;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Create Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    designation VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Create Projects table
CREATE TABLE Projects (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Create Assignments table
CREATE TABLE Assignments (
    emp_id INT,
    proj_id INT,
    hours_worked INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Projects(proj_id)
);

-- Insert sample data for Departments
INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

-- Insert sample data for Employees
INSERT INTO Employees VALUES
(101, 'Rahim', 'Manager', 60000, 1),
(102, 'Hasan', 'Developer', 55000, 1),
(103, 'Mina', 'HR Officer', 45000, 2),
(104, 'Babul', 'Accountant', 48000, 3);

-- Insert sample data for Projects
INSERT INTO Projects VALUES
(201, 'Website Upgrade', 1),
(202, 'Recruitment Drive', 2),
(203, 'Budget Planning', 3);

-- Insert sample data for Assignments
INSERT INTO Assignments VALUES
(101, 201, 120),
(102, 201, 90),
(102, 202, 40),
(104, 203, 60);

-- Q1 (2 marks) Employees with salary greater than 50,000
SELECT *
FROM Employees
WHERE salary > 50000;

-- Q2 (3 marks) Employee and project names (JOIN)
SELECT e.emp_name, p.proj_name
FROM Employees e
JOIN Assignments a ON e.emp_id = a.emp_id
JOIN Projects p ON a.proj_id = p.proj_id;

-- Q3 (3 marks) Total number of projects handled by each department
SELECT d.dept_name, COUNT(p.proj_id) AS total_projects
FROM Departments d
LEFT JOIN Projects p ON d.dept_id = p.dept_id
GROUP BY d.dept_name;

-- Q4 (2 marks) Employees with no projects
SELECT e.*
FROM Employees e
LEFT JOIN Assignments a ON e.emp_id = a.emp_id
WHERE a.emp_id IS NULL;
