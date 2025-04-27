CREATE TABLE emp_details(
 emp_id INT,
 emp_name VARCHAR(100),
 emp_location VARCHAR(100),
 emp_salary INT,
 emp_mgr_id INT
);

INSERT INTO emp_details VALUES(12,'Mohit','Pune',7100,40),
(19,'Pankaj','Bengaluru',7500,100),
(40,'Shikhar','Pune',7000,null),
(31,'Mrudula','Delhi',15000,40),
(89,'Yuvraj','Delhi',7000,31),
(67,'Manoj','Bengaluru',3000,40),
(100,'Soma','Chennai',8000,31),
(124,'Nagendra','Delhi',9500,12);

select * from emp_details;

select e.*,
	m.emp_name manager_name,
	m.emp_location manager_location,
	m.emp_salary manager_salary
from emp_details e inner join emp_details m
on e.emp_mgr_id=m.emp_id AND e.emp_salary>m.emp_salary;