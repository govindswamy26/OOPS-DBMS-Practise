create database DB;
use DB;
create table Course (course_id INT primary key,course_name varchar(255),description varchar(255),
start_date Date, end_date Date);
create table Module (module_id INT primary key, course_id int,module_name varchar(255), module_description varchar(255), 
Foreign key(course_id) References Course(course_id));

create table Lesson(lesson_id int primary key, module_id int,lesson_title varchar(255), lesson_content 
varchar(255), video_url varchar(255), Foreign key(module_id) References Module(module_id));

-- Student(student_id PK, name, email, registration_date)

create table Student(student_id int primary key, name varchar(255), email varchar(255), registration Date);
-- 5. Enrollment(enrollment_id PK, student_id FK, course_id FK, enroll_date)

create table Enrollment(enrollment_id int primary key, student_id int, course_id int, enroll_date Date, foreign key(student_id) references Student(student_id), foreign key(course_id) references Course(course_id));


-- Insert Courses (3 courses)
INSERT INTO Course VALUES
(1, 'Data Structures', 'Learn about arrays, linked lists, trees, and graphs.', '2025-01-01', '2025-03-01'),
(2, 'Database Systems', 'Learn SQL, normalization, and transactions.', '2025-02-01', '2025-04-01'),
(3, 'Operating Systems', 'Learn about processes, memory, and file systems.', '2025-03-01', '2025-05-01');

insert into course values 
(4, 'Computer Networks', 'Learn about ipv4, ipv6, OSI Model.', '2025-04-01', '2025-04-30');
-- Insert Modules (2 per course = 6 total)
INSERT INTO Module VALUES
(1, 1, 'Arrays & Linked Lists', 'Introduction to arrays and linked lists'),
(2, 1, 'Trees & Graphs', 'Advanced data structures'),
(3, 2, 'SQL Basics', 'Learn basic SQL commands'),
(4, 2, 'Transactions & Indexing', 'Advanced DB concepts'),
(5, 3, 'Processes & Threads', 'Introduction to processes and threads'),
(6, 3, 'Memory Management', 'Virtual memory and paging');

-- Insert Lessons (2 per module = 12 total)
INSERT INTO Lesson VALUES
(1, 1, 'Introduction to Arrays', 'Basics of arrays', 'url1'),
(2, 1, 'Linked Lists', 'Singly and doubly linked lists', 'url2'),
(3, 2, 'Introduction to Trees', 'Binary trees explained', 'url3'),
(4, 2, 'Graphs', 'Graph traversal methods', 'url4'),
(5, 3, 'SELECT Queries', 'Using SELECT, WHERE, ORDER BY', 'url5'),
(6, 3, 'Joins', 'INNER JOIN and OUTER JOIN', 'url6'),
(7, 4, 'Transactions', 'ACID properties explained', 'url7'),
(8, 4, 'Indexes', 'Clustered and non-clustered indexes', 'url8'),
(9, 5, 'Processes', 'Process lifecycle', 'url9'),
(10, 5, 'Threads', 'Multithreading basics', 'url10'),
(11, 6, 'Paging', 'Memory paging explained', 'url11'),
(12, 6, 'Segmentation', 'Memory segmentation', 'url12');

-- Insert Students (5 students)
INSERT INTO Student VALUES
(1, 'Alice', 'alice@example.com', '2025-01-10'),
(2, 'Bob', 'bob@example.com', '2025-01-12'),
(3, 'Charlie', 'charlie@example.com', '2025-01-15'),
(4, 'David', 'david@example.com', '2025-01-20'),
(5, 'Eva', 'eva@example.com', '2025-01-25');

-- Insert Enrollments (students enrolled in courses)
INSERT INTO Enrollment VALUES
(1, 1, 1, '2025-01-11'),
(2, 2, 1, '2025-01-13'),
(3, 3, 2, '2025-01-16'),
(4, 4, 2, '2025-01-21'),
(5, 5, 3, '2025-01-26'),
(6, 1, 3, '2025-01-11'),
(7, 1, 2, '2025-01-13'),
(8, 4, 1, '2025-01-21'),
(9, 5, 2, '2025-01-26');


select * from Course;
select * from Lesson;
select * from Module;
select * from Student;
select * from Enrollment;

-- count student per course

select c.course_name, count(student_id) 
from enrollment e join  course c  on e.course_id = c.course_id
group by e.course_id;

-- 2. List all lessons in a specific course.

select L.lesson_title from Lesson L 
join Module M on M.module_id = L.module_id 
join Course C on C.course_id = M.course_id
where c.course_name = 'Data Structures';


-- 3. Show students enrolled in more than 2 courses.

select s.name from Student s join Enrollment e on s.student_id = e.student_id
group by e.student_id, s.name having count(e.student_id) >= 2;

-- 4  Show modules along with the number of lessons.

select m.module_name, count(l.lesson_id) as no_of_lessons 
from module m join lesson l  on m.module_id = l.lesson_id 
group by m.module_name, m.module_id; 

-- 5 Find students enrolled after a specific date.
select s.name from Student s 
join Enrollment e on s.student_id = e.student_id where e.enroll_date > '2025-01-11';

-- 6 List courses with no enrollments.

select c.course_name from Course c 
left join Enrollment e on c.course_id = e.course_id where e.course_id IS NULL;
