-- BIRTHDAY ATTENDANCE

-- Given the following two tables, write a query to return the fraction of students, 
-- rounded to two decimal places, who attended school(attendance = 1) on their birthday.

create database if not exists practicedb;
use practicedb;

create table if not exists attendance (
student_id integer not null, 
school_date date, 
attendance bit(1)
);
create table if not exists students (
student_id integer not null,
school_id integer , 
grade_level integer , 
date_of_birth date
);
/*
insert into attendance (student_id, school_date, attendance)
VALUES
(1, CAST('2020-04-03' AS date), 0),
(2, CAST('2020-04-03' AS date), 1),
(3, CAST('2020-04-03' AS date), 1), 
(1, CAST('2020-04-04' AS date), 1), 
(2, CAST('2020-04-04' AS date), 1), 
(3, CAST('2020-04-04' AS date), 1), 
(1, CAST('2020-04-05' AS date), 0), 
(2, CAST('2020-04-05' AS date), 1), 
(3, CAST('2020-04-05' AS date), 1), 
(4, CAST('2020-04-05' AS date), 1);
insert into students (student_id, school_id, grade_level, date_of_birth)
VALUES
(1, 2, 5, CAST('2012-04-03' AS date)),
(2, 1, 4, CAST('2013-04-04' AS date)),
(3, 1, 3, CAST('2014-04-05' AS date)), 
(4, 2, 4, CAST('2013-04-03' AS date));
*/

select * from attendance;
select * from students;

select format(sum(attendance)/count(*),2) as birthday_attendance from students 
left join attendance 
on students.student_id = attendance.student_id
and day(students.date_of_birth) = day(attendance.school_date)
and month(students.date_of_birth) = month(attendance.school_date);
