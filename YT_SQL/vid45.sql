CREATE TABLE emp_in(
 emp_id INT,
 emp_name VARCHAR(100),
 emp_location VARCHAR(100),
 emp_mgr_id INT
);

INSERT INTO emp_in VALUES(230,'Bhaskar','Lucknow',null),
(431,'Satyam','Chennai',675),
(567,'Nilesh','Kolkata',155),
(247,'Priya','Delhi',675),
(155,'Abhijeet','Bengaluru',230),
(401,'Sanjay','Pune',null),
(100,'Keshav','Hyderabad',567),
(675,'Neha','Delhi',230),
(911,'Surya','Hyderabad',567),
(635,'Rishabh','Mumbai',675);

select * from emp_in;

with emp_cte as 
(
select emp_mgr_id manager_id,STRING_AGG(emp_name,',') WITHIN GROUP(ORDER BY emp_name) reportee,
	count(1) total_reportee
from emp_in
GROUP BY emp_mgr_id
)
select COALESCE(e.emp_name,'NONE') manager_name ,m.reportee,m.total_reportee
from emp_cte m left join emp_in e 
on m.manager_id=e.emp_id;