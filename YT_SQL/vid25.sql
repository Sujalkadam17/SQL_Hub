CREATE TABLE emp_info(
 emp_id INT,
 emp_name VARCHAR(100),
 emp_location VARCHAR(100),
 emp_mgr_id INT
);

INSERT INTO emp_info VALUES(935,'Bhavana Kancharla','Hyderabad',530),
(530,'Vikas Kumar','Hyderabad',411),
(411,'Sudip Ghosh','Bengaluru',100),
(871,'Surbhi Goyal','Bengaluru',411),
(982,'Rajiv Shah','Delhi',935),
(453,'Girdhar Pathak','Chennai',530),
(673,'Kusum Rathore','Bengaluru',411);

select * from emp_info;

WITH emp_cte AS
(
select emp_mgr_id ,count(1) total_reportee
from emp_info
group by emp_mgr_id
having count(1)>=2
)
select e.emp_mgr_id manager_id,
		i.emp_name manager_name,
		i.emp_location manager_location,
		e.total_reportee
from emp_cte e LEFT JOIN emp_info i
on e.emp_mgr_id=i.emp_id;

