-- Department table
CREATE TABLE Department (
 dept_id INT PRIMARY KEY,
 dept_name VARCHAR(100)
);

-- Course table with a foreign key to Department
CREATE TABLE Course (
 course_id INT PRIMARY KEY,
 course_name VARCHAR(100),
 dept_id INT,
 FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert data into Department
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Mathematics'),
(5, 'Physics');

-- Insert data into Course
INSERT INTO Course (course_id, course_name, dept_id) VALUES
(101, 'Advanced Programming', 1),
(102, 'Database Systems', 1),
(103, 'Web Development', 1),
(104, 'Machine Learning', 1), -- CS now has 4 courses
(201, 'Robotics', 2),
(202, 'Materials Science', 2),
(203, 'Heat Transfer', 2), -- Mechanical now has 3 courses
(301, 'Circuit Analysis', 3),
(302, 'Digital Signal Processing', 3),
(401, 'Calculus III', 4),
(501, 'Quantum Mechanics', 5); -- Physics has 1 course


Select * from Course;
Select * from Department;


SELECT
    d.dept_name,
    (SELECT COUNT(c.course_id) FROM Course c WHERE c.dept_id = d.dept_id) AS num_courses
FROM
    Department d;


SELECT dept_name
FROM Department
WHERE dept_id IN (
 SELECT dept_id
 FROM Course
 GROUP BY dept_id
 HAVING COUNT(course_id) > 2
);

-- Grant SELECT-only access on the courses table to a specific user

GRANT SELECT ON Course TO readonly_user;
