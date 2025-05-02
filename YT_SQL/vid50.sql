CREATE TABLE switch_info(
 emp_id INT,
 emp_name VARCHAR(100),
 emp_current_org VARCHAR(100),
 emp_current_role VARCHAR(100),
 emp_current_release_date DATE,
 emp_next_org VARCHAR(100),
 emp_next_role VARCHAR(100)
);

CREATE TABLE role_info(
 org_id INT,
 org_name VARCHAR(100),
 org_role_name VARCHAR(100),
 org_role_level INT
);

INSERT INTO role_info VALUES(25,'Deloitte USI','Senior Consultant',3),
(25,'Deloitte USI','Associate Manager',4),
(10,'Infosys Ltd','Senior Manager',6),
(25,'Deloitte USI','Consultant',2),
(25,'Deloitte USI','Business Analyst',1),
(10,'Infosys Ltd','Technology Analyst',3),
(10,'Infosys Ltd','Manager',5),
(93,'Joint Adventures Corp','Tech Specialist',4),
(25,'Deloitte USI','Senior Manager',1),
(25,'Deloitte USI','Manager',5),
(10,'Infosys Ltd','Technology Lead',4),
(93,'Joint Adventures Corp','Tech Giant',5),
(93,'Joint Adventures Corp','Tech Buddy',1),
(10,'Infosys Ltd','Senior Systems Engineer',2),
(10,'Infosys Ltd','Systems Engineer',1);

INSERT INTO switch_info VALUES(839,'Sushant','Infosys Ltd','Technology Lead','2023-06-23','Joint Adventures Corp','Tech Giant'),
(291,'Mahima','Deloitte USI','Manager','2018-01-01','Joint Adventures Corp','Tech Specialist'),
(935,'Parth','Infosys Ltd','Senior Systems Engineer','2017-08-10','Deloitte USI','Business Analyst'),
(941,'Jhanavi','Joint Adventures Corp','Tech Buddy','2020-04-17','Deloitte USI','Senior Consultant');

select * from switch_info;
select * from role_info;

select s.*,r.org_role_level old_level, r2.org_role_level new_level
from switch_info s inner join role_info r
on s.emp_current_org=r.org_name and s.emp_current_role=r.org_role_name
inner join role_info r2
on s.emp_next_org=r2.org_name and s.emp_next_role=r2.org_role_name
WHERE r.org_role_level<r2.org_role_level;