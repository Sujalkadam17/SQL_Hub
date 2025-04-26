CREATE TABLE call_logs(
 call_id INT,
 caller VARCHAR(100),
 receiver VARCHAR(100),
 duration INT
);

INSERT INTO call_logs VALUES(10,'Anushka','Divya',100),
(12,'Priyanka','Prithvi',20),
(15,'Aryan','Divya',50),
(20,'Divya','Aryan',30),
(23,'Anushka','Divya',5),
(40,'Divya','Anushka',20),
(37,'Aryan','Divya',80);

select * from call_logs;

with log_cte as
(
select CASE WHEN caller<receiver then caller ELSE receiver END caller,
		CASE WHEN caller<receiver then receiver ELSE caller END receiver,
		duration 
from call_logs
)
select caller,receiver, SUM(duration) total_duartion
from log_cte
group by caller,receiver;
