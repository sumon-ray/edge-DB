-- Part A

-- 🔹 1. Create a view TopStudents (average grade > 3.5)
CREATE VIEW TopStudents AS
SELECT 
    S.student_id,
    S.name,
    AVG(E.grade) AS average_grade
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.student_id, S.name
HAVING AVG(E.grade) > 3.5;

-- 🔹 2. Stored Procedure to increase grade by 0.5 (max 4.0)

CREATE PROCEDURE IncreaseGradeByCourse(IN input_course_id INT)
BEGIN
    UPDATE Enrollments
    SET grade = LEAST(grade + 0.5, 4.0)
    WHERE course_id = input_course_id;
END 

-- 🔹 3. Correlated subquery: Students who got the highest grade in any course
SELECT DISTINCT S.student_id, S.name
FROM Enrollments E
JOIN Students S ON S.student_id = E.student_id
WHERE E.grade = (
    SELECT MAX(E2.grade)
    FROM Enrollments E2
    WHERE E2.course_id = E.course_id
);

-- =============================================
-- Part B 

SELECT 
    D.department_name,
    COUNT(DISTINCT S.student_id) AS total_students,
    AVG(E.grade) AS average_grade,
    COUNT(DISTINCT C.course_id) AS number_of_courses
FROM Departments D
JOIN Students S ON D.department_id = S.department_id
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON D.department_id = C.department_id
GROUP BY D.department_id, D.department_name
HAVING COUNT(DISTINCT C.course_id) >= 2
ORDER BY average_grade DESC;
