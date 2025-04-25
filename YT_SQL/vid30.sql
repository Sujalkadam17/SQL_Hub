CREATE TABLE user_info(
 id INT,
 name VARCHAR(100),
 location VARCHAR(100),
 age INT
);

INSERT INTO user_info VALUES(130,'Govinda','Mumbai',59),
(580,'Madhuri','Pune',56),
(200,'Amit','Kanpur',80),
(580,'Madhuri','Pune',56),
(398,'Raghav','Delhi',34),
(130,'Govinda','Mumbai',59),
(200,'Amit','Kanpur',80),
(130,'Govinda','Mumbai',59),
(580,'Madhuri','Pune',56),
(398,'Raghav','Delhi',34),
(398,'Raghav','Delhi',34);

select * from user_info;

WITH dup_cte as
(
select id,name,location,age, ROW_NUMBER() OVER(PARTITION BY id order by (SELECT NULL))  rnk
from user_info 

)
delete from dup_cte where rnk>1;