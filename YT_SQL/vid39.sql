CREATE TABLE usr_det(
 id INT,
 name VARCHAR(100),
 location VARCHAR(100),
 age INT
);

INSERT INTO usr_det VALUES(101,'Kriti','Mumbai',33),
(566,'Virat','Delhi',34),
(102,'Kriti','Mumbai',33),
(200,'Amit','Kanpur',80),
(89,'Rahul','Bengaluru',50),
(539,'Karishma','Pune',49),
(103,'Kriti','Mumbai',33),
(401,'Yujvendra','Delhi',33),
(561,'Rahul','Mumbai',55),
(130,'Virat','Delhi',34),
(22,'Rahul','Mumbai',55),
(93,'Rahul','Bengaluru',50),
(137,'Virat','Delhi',34),
(501,'Karishma','Pune',49);

select * from usr_det
order by name;

WITH dup_cte as
(
select *, ROW_NUMBER() OVER(PARTITION BY name,location,age order by name) rnk
from usr_det
)
delete
from dup_cte
where rnk>1;

select * from usr_det
order by name;
