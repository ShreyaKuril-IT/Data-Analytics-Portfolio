-- Project :- Online Learning Platform

-- 1.	List all courses a specific student is enrolled in.
-- 2.	Calculate the course completion rate (percentage of enrollments with a completion_date).
-- 3.	Find the instructor with the most courses.
-- 4.	Identify students who have enrolled in more than 5 courses.
-- 5.	Calculate the total revenue generated per course category.
-- 6.	List all modules for a specific course in sequence order.
-- 7.	Find courses that have no enrolled students.
-- 8.	Calculate the average number of enrollments per course.
-- 9.	Identify the most popular course category.
-- 10.	Find students who have not completed any courses they enrolled in.


create database online_learning_platform;
use online_learning_platform;

create table students (
student_id int auto_increment primary key,
name varchar(30),
email varchar(50),
country varchar(30),
signup_date date);

INSERT INTO students (student_id, name, email, country, signup_date) 
VALUES
(1, 'Asha Verma', 'asha.verma1@example.com', 'India', '2024-01-15'),
(2, 'Ravi Kapoor', 'ravi.kapoor2@example.com', 'India', '2024-02-10'),
(3, 'Neha Sharma', 'neha.sharma3@example.com', 'Canada', '2024-03-05'),
(4, 'Vikram Singh', 'vikram.singh4@example.com', 'USA', '2024-03-22'),
(5, 'Pooja Patel', 'pooja.patel5@example.com', 'India', '2024-04-01'),
(6, 'Sanjay Rao', 'sanjay.rao6@example.com', 'Nepal', '2024-04-18'),
(7, 'Meera Iyer', 'meera.iyer7@example.com', 'UK', '2024-05-02'),
(8, 'Arjun Nair', 'arjun.nair8@example.com', 'India', '2024-05-19'),
(9, 'Kavya Menon', 'kavya.menon9@example.com', 'Canada', '2024-06-11'),
(10, 'Rahul Gupta', 'rahul.gupta10@example.com', 'India', '2024-06-27'),
(11, 'Simran Kaur', 'simran.kaur11@example.com', 'UK', '2024-07-14'),
(12, 'Ankit Joshi', 'ankit.joshi12@example.com', 'India', '2024-08-03'),
(13, 'Tanya Reddy', 'tanya.reddy13@example.com', 'USA', '2024-08-21'),
(14, 'Mohit Desai', 'mohit.desai14@example.com', 'India', '2024-09-10'),
(15, 'Sana Khan', 'sana.khan15@example.com', 'Canada', '2024-09-23'),
(16, 'Deepak Yadav', 'deepak.yadav16@example.com', 'India', '2024-10-05'),
(17, 'Isha Bhat', 'isha.bhat17@example.com', 'UK', '2024-10-22'),
(18, 'Karan Mehra', 'karan.mehra18@example.com', 'India', '2024-11-01'),
(19, 'Ritu Chawla', 'ritu.chawla19@example.com', 'Nepal', '2024-11-18'),
(20, 'Nilesh Sharma', 'nilesh.sharma20@example.com', 'India', '2024-12-01');

select * from students;

create table instructors (
instructor_id int auto_increment primary key,
name varchar(30),
bio Text,
expertise varchar(80));

INSERT INTO instructors (instructor_id, name, bio, expertise) 
VALUES
(101, 'Dr. A. Natarajan', 'Dr. A. Natarajan is a seasoned database specialist with 15+ years of experience in SQL tuning and architecture.', 'Databases'),
(102, 'Ms. Shreya Kapoor', 'Shreya is a data scientist who loves turning messy data into insights and dashboards.', 'Data Science'),
(103, 'Mr. Ramesh Iyer', 'Ramesh is a full-stack web developer focused on modern frontend and backend technologies.', 'Web Development'),
(104, 'Prof. Lata Bose', 'Prof. Lata has published research in machine learning and teaches ML fundamentals and applications.', 'Machine Learning'),
(105, 'Mr. Sameer Kulkarni', 'Sameer is a cloud engineer with hands-on experience in AWS and DevOps practices.', 'Cloud'),
(106, 'Dr. Neelam Rao', 'Dr. Neelam specializes in software engineering, design patterns, and project management.', 'Software Engineering'),
(107, 'Ms. Priyanka Sethi', 'Priyanka builds interactive data visualizations and teaches tools like Tableau and D3.', 'Data Visualization'),
(108, 'Mr. Atul Deshmukh', 'Atul is an expert in backend systems, PL/SQL programming and database procedures.', 'Databases'),
(109, 'Ms. Ananya Jain', 'Ananya works on NLP projects and teaches practical ML model-building.', 'Machine Learning'),
(110, 'Mr. Vikram Chauhan', 'Vikram is a DevOps practitioner who focuses on CI/CD, containerization, and monitoring.', 'DevOps');

select * from instructors;

create table courses (
course_id int auto_increment primary key,
course_title varchar(50),
instructor_id int,
category varchar(50),
price int,
foreign key(instructor_id) references instructors(instructor_id));

INSERT INTO courses (course_id, course_title, instructor_id, category, price) VALUES
(1001, 'SQL Basics', 101, 'Databases', 299.00),
(1002, 'Advanced SQL & Performance Tuning', 101, 'Databases', 599.00),
(1003, 'Intro to Data Science', 102, 'Data Science', 999.00),
(1004, 'Python for Data Science', 102, 'Data Science', 799.00),
(1005, 'Data Visualization with Python', 107, 'Data Visualization', 549.00),
(1006, 'Web Development - HTML & CSS', 103, 'Web Development', 399.00),
(1007, 'JavaScript Essentials', 103, 'Web Development', 449.00),
(1008, 'Frontend Development Bootcamp', 103, 'Web Development', 699.00),
(1009, 'Machine Learning Fundamentals', 104, 'Machine Learning', 1299.00),
(1010, 'Deep Learning Intro', 104, 'Machine Learning', 1499.00),
(1011, 'NLP Basics', 109, 'Machine Learning', 899.00),
(1012, 'Cloud Computing Basics', 105, 'Cloud', 599.00),
(1013, 'AWS & DevOps Essentials', 110, 'DevOps', 849.00),
(1014, 'Docker & Kubernetes', 110, 'DevOps', 999.00),
(1015, 'Software Engineering - I', 106, 'Software Engineering', 699.00),
(1016, 'Software Engineering - II', 106, 'Software Engineering', 749.00),
(1017, 'PL/SQL Programming Mastery', 108, 'Databases', 649.00),
(1018, 'Database Design & Normalization', 108, 'Databases', 499.00),
(1019, 'Project Management Basics', 106, 'Software Engineering', 499.00),
(1020, 'Agile & Scrum Foundation', 106, 'Software Engineering', 599.00);

INSERT INTO courses (course_id, course_title, instructor_id, category, price) VALUES
(1021, 'NoSQL for Beginners', 101, 'Databases', 599),
(1022, 'Introduction to Big Data', 102, 'Data Science', 899),
(1023, 'REST APIs with Node.js', 103, 'Web Development', 799);

select * from courses;

create table enrollments (
enrollment_id int auto_increment primary key,
student_id int,
course_id int,
enrollment_date date,
completion_date date,
foreign key(student_id) references students(student_id),
foreign key(course_id) references courses(course_id));

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date, completion_date) 
VALUES
(4001, 1, 1001, '2024-02-10', '2024-03-05'),
(4002, 2, 1003, '2024-03-15', NULL),
(4003, 3, 1002, '2024-04-01', '2024-05-09'),
(4004, 4, 1004, '2024-04-20', NULL),
(4005, 5, 1006, '2024-05-02', '2024-06-01'),

(4006, 6, 1007, '2024-05-18', NULL),
(4007, 7, 1005, '2024-06-03', '2024-06-28'),
(4008, 8, 1009, '2024-06-25', NULL),
(4009, 9, 1010, '2024-07-05', NULL),
(4010, 10, 1012, '2024-07-21', '2024-08-15'),

(4011, 11, 1013, '2024-08-02', NULL),
(4012, 12, 1008, '2024-08-17', '2024-09-10'),
(4013, 13, 1011, '2024-09-01', NULL),
(4014, 14, 1014, '2024-09-12', NULL),
(4015, 15, 1015, '2024-09-29', '2024-10-20'),

(4016, 16, 1016, '2024-10-05', NULL),
(4017, 17, 1017, '2024-10-19', '2024-11-22'),
(4018, 18, 1003, '2024-10-28', NULL),
(4019, 19, 1018, '2024-11-03', NULL),
(4020, 20, 1019, '2024-11-15', '2024-12-12'),

(4021, 1, 1020, '2024-12-01', NULL),
(4022, 3, 1007, '2024-12-10', NULL),
(4023, 5, 1012, '2024-12-18', NULL),
(4024, 7, 1001, '2025-01-02', NULL),
(4025, 10, 1014, '2025-01-15', '2025-02-05');

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date, completion_date) 
VALUES
(4026, 1, 1003, '2025-02-01', NULL),
(4027, 1, 1005, '2025-02-10', '2025-03-05'),
(4028, 1, 1007, '2025-03-01', NULL),
(4029, 1, 1010, '2025-03-15', NULL),

(4030, 3, 1001, '2025-02-05', NULL),
(4031, 3, 1003, '2025-02-20', '2025-03-18'),
(4032, 3, 1005, '2025-03-10', NULL),
(4033, 3, 1009, '2025-03-25', NULL);

select * from enrollments;

create table modules (
module_id int auto_increment primary key,
course_id int,
module_title varchar(50),
sequence_number int,
foreign key(course_id) references courses(course_id));

INSERT INTO modules (module_id, course_id, module_title, sequence_number) VALUES
(2001, 1001, 'SQL Basics - Introduction', 1),
(2002, 1001, 'SQL Basics - SELECT Queries', 2),

(2003, 1002, 'Advanced SQL - Indexes', 1),
(2004, 1002, 'Advanced SQL - Query Optimization', 2),

(2005, 1003, 'Data Science Intro - Overview', 1),
(2006, 1003, 'Data Science Intro - Data Cleaning', 2),

(2007, 1004, 'Python for Data Science - Basics', 1),
(2008, 1004, 'Python for Data Science - Pandas', 2),

(2009, 1005, 'Data Visualization - Matplotlib', 1),
(2010, 1005, 'Data Visualization - Seaborn', 2),

(2011, 1006, 'HTML & CSS - HTML Basics', 1),
(2012, 1006, 'HTML & CSS - CSS Styling', 2),

(2013, 1007, 'JavaScript Essentials - Syntax', 1),
(2014, 1007, 'JavaScript Essentials - DOM', 2),

(2015, 1008, 'Frontend Bootcamp - Workflow', 1),
(2016, 1008, 'Frontend Bootcamp - Components', 2),

(2017, 1009, 'ML Fundamentals - Intro', 1),
(2018, 1009, 'ML Fundamentals - Supervised Learning', 2),

(2019, 1010, 'Deep Learning - Neural Basics', 1),
(2020, 1010, 'Deep Learning - CNN Models', 2),

(2021, 1011, 'NLP Basics - Text Cleaning', 1),
(2022, 1011, 'NLP Basics - Embeddings', 2),

(2023, 1012, 'Cloud Basics - Concepts', 1),
(2024, 1012, 'Cloud Basics - Deployment', 2),

(2025, 1013, 'AWS & DevOps - CI/CD Basics', 1);

select * from modules;

create table quizzes (
quiz_id int auto_increment primary key,
module_id int,
quiz_title varchar(50),
max_score int,
foreign key(module_id) references modules(module_id));

INSERT INTO quizzes (quiz_id, module_id, quiz_title, max_score) VALUES
(3001, 2001, 'Quiz: SQL Basics - Introduction', 10),
(3002, 2002, 'Quiz: SQL Basics - SELECT Queries', 15),

(3003, 2003, 'Quiz: Advanced SQL - Indexes', 10),
(3004, 2004, 'Quiz: Advanced SQL - Query Optimization', 20),

(3005, 2005, 'Quiz: DS Intro - Overview', 10),
(3006, 2006, 'Quiz: DS Intro - Data Cleaning', 15),

(3007, 2007, 'Quiz: Python DS - Basics', 10),
(3008, 2008, 'Quiz: Python DS - Pandas', 20),

(3009, 2009, 'Quiz: Data Viz - Matplotlib', 10),
(3010, 2010, 'Quiz: Data Viz - Seaborn', 15),

(3011, 2011, 'Quiz: HTML Basics', 10),
(3012, 2012, 'Quiz: CSS Styling', 15),

(3013, 2013, 'Quiz: JavaScript Syntax', 10),
(3014, 2014, 'Quiz: JavaScript DOM', 20),

(3015, 2015, 'Quiz: Frontend Workflow', 10),
(3016, 2016, 'Quiz: Frontend Components', 20),

(3017, 2017, 'Quiz: ML Intro', 10),
(3018, 2018, 'Quiz: ML Supervised Learning', 20),

(3019, 2019, 'Quiz: Neural Network Basics', 10),
(3020, 2020, 'Quiz: CNN Models', 20),

(3021, 2021, 'Quiz: NLP Text Cleaning', 10),
(3022, 2022, 'Quiz: NLP Embeddings', 20),

(3023, 2023, 'Quiz: Cloud Concepts', 10),
(3024, 2024, 'Quiz: Cloud Deployment', 20),

(3025, 2025, 'Quiz: CI/CD Basics', 15);

select * from quizzes;

-- 1.	List all courses a specific student is enrolled in.

SELECT 
s.student_id, s.name AS student_name, c.course_id, c.course_title, c.category,
c.price, e.enrollment_date, e.completion_date  FROM enrollments e
JOIN students s  ON e.student_id = s.student_id
JOIN courses  c  ON e.course_id = c.course_id
WHERE s.student_id = 10;   

-- 2.	Calculate the course completion rate (percentage of enrollments with a completion_date).

SELECT 
    COUNT(*) AS total_enrollments,
    COUNT(completion_date) AS completed_enrollments
FROM enrollments;

SELECT 
    concat(round((COUNT(completion_date) * 100.0 / COUNT(*))),'%') AS completion_rate_percentage
FROM enrollments;

use online_learning_platform;

-- 3.	Find the instructor with the most courses.

select i.instructor_id, i.name As Instructor_name, count(c.course_id) As Total_courses
from instructors i
join courses c 
on i.instructor_id = c.instructor_id
Group by i.instructor_id, i.name
order by Total_courses desc limit 1;

-- 4.	Identify students who have enrolled in more than 5 courses.

select s.student_id, s.name As Student_Name , count(e.course_id) As Total_courses
from students s
join enrollments e on s.student_id = e.student_id
group by s.student_id, s.name
having count(e.course_id) > 5
order by total_courses desc;

-- 5.	Calculate the total revenue generated per course category.

SELECT 
    c.category,
    COUNT(*) AS total_enrollments,
    SUM(c.price) AS total_revenue
FROM enrollments e
JOIN courses c 
    ON e.course_id = c.course_id
GROUP BY 
    c.category;

-- 6.	List all modules for a specific course in sequence order.

select m.module_id, m.module_title, m.sequence_number, m.course_id
from modules m 
where m.course_id =1011
order by m.sequence_number asc;

use online_learning_platform;

-- 7.	Find courses that have no enrolled students.

select c.course_id, c.course_title, c.category, c.price from courses c 
left join enrollments e on c.course_id = e.course_id 
where e.enrollment_id is null;

-- 8.	Calculate the average number of enrollments per course.

SELECT 
    COUNT(enrollment_id) / COUNT(DISTINCT course_id) AS average_enrollments_per_course
FROM enrollments;

-- 9.	Identify the most popular course category.

select c.category, count(*) As total_enrollments from enrollments e 
join courses c on e.course_id = c.course_id
group by c.category
order by total_enrollments desc limit 1;

-- 10.	Find students who have not completed any courses they enrolled in.

SELECT
    s.student_id,
    s.name
FROM students s
LEFT JOIN enrollments e
    ON s.student_id = e.student_id
    AND e.completion_date IS NOT NULL
WHERE e.student_id IS NULL;

