CREATE TABLE employee_details(
 emp_id INT,
 emp_name VARCHAR(100),
 emp_age INT,
 emp_gender CHAR(1),
 emp_dept VARCHAR(100)
);

INSERT INTO employee_details VALUES(127,'Kapil',28,'M','HR'),
(156,'Taruni',26,'F','Sales'),
(35,'Dhananjay',27,'M','IT'),
(67,'Vikas',31,'M','IT'),
(211,'Amol',24,'M','HR'),
(103,'Kishore',58,'M','Sales'),
(35,'Kiran',33,'F','Executive'),
(87,'Roopa',29,'F','IT'),
(16,'Sonakshi',47,'F','Executive'),
(73,'Suhani',25,'F','IT'),
(183,'Kundan',38,'M','Sales'),
(25,'Parinita',41,'F','Executive');

select * from employee_details;
WITH cte as
(
select emp_dept,count(1) total_emp, SUM(CASE WHEN emp_gender='M' THEN 1 ELSE 0 END) male_indicator,
			SUM(CASE WHEN emp_gender='F' THEN 1 ELSE 0 END) female_indicator
from employee_details
GROUP BY emp_dept
)
select *, CASE WHEN total_emp=male_indicator THEN 'Male dominant'
						WHEN total_emp=female_indicator THEN 'Female dominant'
						ELSE 'NONE' END majority
from cte;
