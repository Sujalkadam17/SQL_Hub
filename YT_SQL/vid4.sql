CREATE TABLE student(
 enroll_no int PRIMARY KEY IDENTITY(1,1),
 name varchar(100),
 class varchar(100),
 total_marks int 
);

INSERT INTO student VALUES('Kishore Verma','VII',867),
('Dhruv Malhotra','VI',674),
('Vaishali Goyal','VII',877),('Shivam Naidu','VI',850),
('Rashmika Goswami','VII',934),('Pankaj Mukherjee','VI',687),
('Radhika Khanna','VI',850),('Abhishek Naini','VII',933);

select * from student;

with student_cte as
(
	select *,dense_rank() over(PARTITION BY class ORDER BY total_marks DESC) rnk
	from student
) select enroll_no,name,class,total_marks,
	CASE WHEN rnk= 1 THEN 'Topper' ELSE Cast(rnk as varchar) END rank
	from student_cte;