CREATE TABLE user_queue(
 user_id INT,
 user_name VARCHAR(100),
 weight INT,
 queue_position INT
);

INSERT INTO user_queue VALUES(101,'Ramesh',105,1),
(109,'Suresh',50,2),
(306,'Mahesh',130,3),
(147,'Ganesh',40,4),
(107,'Rajiv',80,5),
(281,'Karan',75,6),
(103,'Sohan',110,7);


 select *from user_queue;

 WITH lift_cte as
(
select  *,SUM(weight) over(order by queue_position) running_weight
from user_queue 
),weight_cte as
(
	select *,CASE WHEN running_weight<=400 THEN 'Y' ELSE 'N' END can
	from lift_cte
)
select * from user_queue
WHERE queue_position= (SELECT MAX(queue_position) re_que 
							from weight_cte where can='Y');