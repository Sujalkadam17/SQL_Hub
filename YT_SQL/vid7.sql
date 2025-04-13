--Replacing NULL values man of the match


CREATE TABLE mom_2004 (
 match_no int,
 mom_player varchar(50),
 match_opponent varchar(50)
);

INSERT INTO mom_2004 VALUES 
(1, 'Virender Sehwag', 'South Africa'),
(2, 'Sourav Ganguly', 'South Africa'),
(3, NULL, 'South Africa'),
(4, 'Sachin Tendulkar', 'England'),
(5, 'Sourav Ganguly', 'England'),
(6, 'Sachin Tendulkar', 'England'),
(7, NULL, 'England'),
(8, NULL, 'Bangladesh'),
(9, 'Rahul Dravid', 'Australia'),
(10, NULL, 'Australia');

select * from mom_2004;

with mom_cte as
(
select *,COUNT(mom_player) over(order by match_no) group_no
from mom_2004
) select match_no ,FIRST_VALUE(mom_player) over(PARTITION BY group_no ORDER BY match_no) mom_player,
match_opponent
from mom_cte;

