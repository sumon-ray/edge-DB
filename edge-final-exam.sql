-- Part A

-- 1. Create Students table with constraints
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    dob DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- 2. Insert two students
INSERT INTO Students (student_id, name, email, dob, department_id)
VALUES 
    (101, 'John Doe', 'john@example.com', '2002-06-15', 2),
    (102, 'Jane Smith', 'jane@example.com', '2001-10-30', 1);

-- 3. Retrieve students born after 2002, ordered by name descending
SELECT * 
FROM Students
WHERE dob > '2002-01-01'
ORDER BY name DESC;

-- 4. Total number of students in each department
SELECT department_id, COUNT(*) AS total_students
FROM Students
GROUP BY department_id;

-- 5. Delete students born before 2000
DELETE FROM Students
WHERE dob < '2000-01-01';



                -- Part B – Intermediate SQL 

-- 1. Retrieve student name and department name
SELECT S.name, D.department_name
FROM Students S
JOIN Departments D ON S.department_id = D.department_id;

-- 2. Average grade of each course (only those > 3.0)
SELECT C.course_name, AVG(E.grade) AS average_grade
FROM Enrollments E
JOIN Courses C ON E.course_id = C.course_id
GROUP BY C.course_name
HAVING AVG(E.grade) > 3.0;

-- 3. Students not enrolled in any course
SELECT S.student_id, S.name
FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.enrollment_id IS NULL;

-- 4. Course name and number of enrolled students (highest to lowest)
SELECT C.course_name, COUNT(E.student_id) AS student_count
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name
ORDER BY student_count DESC;

-- 5. Students whose grade is above average of that course
SELECT DISTINCT S.student_id, S.name
FROM Enrollments E
JOIN Students S ON E.student_id = S.student_id
JOIN (
    SELECT course_id, AVG(grade) AS avg_grade
    FROM Enrollments
    GROUP BY course_id
) AS A ON E.course_id = A.course_id
WHERE E.grade > A.avg_grade;