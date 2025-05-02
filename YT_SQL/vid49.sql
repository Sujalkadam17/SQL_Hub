CREATE TABLE match_score(
 player_id INT,
 player_name VARCHAR(100),  
 player_score INT,
 match_date DATE
);

INSERT INTO match_score VALUES(18,'Virat Kohli',83,'2022-09-10'),
(63,'Suryakumar Yadav',103,'2022-03-13'),
(45,'Rohit Sharma',160,'2022-10-05'),
(8,'Ravindra Jadeja',14,'2022-06-09'),
(45,'Rohit Sharma',46,'2022-12-31'),
(18,'Virat Kohli',45,'2022-08-23'),
(8,'Ravindra Jadeja',5,'2022-04-26'),
(18,'Virat Kohli',115,'2022-11-29'),
(18,'Virat Kohli',91,'2022-06-11'),
(45,'Rohit Sharma',46,'2022-01-07'),
(18,'Virat Kohli',180,'2022-04-08');

select * from match_score;

WITH match_cte as
(
SELECT *,ROW_NUMBER() OVER (PARTITION BY player_id order by player_score DESC) rnk,
	COUNT(1) over(PARTITION BY player_id) total_match
FROM match_score
)
select player_id,player_name,player_score,match_date
from match_cte
where rnk=3 or (rnk<3 and rnk=total_match);