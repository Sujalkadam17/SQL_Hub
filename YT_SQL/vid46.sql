CREATE TABLE emp_info(
 emp_id INT,
 emp_name VARCHAR(100),
 emp_location VARCHAR(100),
 emp_salary INT,
 emp_dept_id INT
);

INSERT INTO emp_info VALUES(100,'Ankit','Jaipur',5000,100),
(150,'Suraj','Guwahati',8300,100),
(213,'Divya','Surat',3000,100),
(263,'Arnab','Guwahati',4500,200),
(560,'Sudhir','Raipur',6500,200),
(140,'Prakriti','Raipur',8000,100),
(744,'Tanvi','Mysuru',3100,200),
(467,'Atul','Raipur',8700,100);

select * from emp_info;
with avg_cte as
(
select emp_dept_id ,avg(emp_salary) average_salary
from emp_info
GROUP BY emp_dept_id
)
select e.*,a.average_salary
from emp_info e inner join avg_cte a
on e.emp_dept_id=a.emp_dept_id AND e.emp_salary>a.average_salary;