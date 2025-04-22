CREATE TABLE matches(
 match_date date,
 team_name varchar(20),
 team_opponent varchar(20),
 match_status varchar(10),
);
INSERT INTO matches VALUES('2004-02-13','New Zealand','South Africa','Lost'),
('2004-02-17','New Zealand','South Africa','Won'),
('2004-02-22','Sri Lanka','Australia','Won'),
('2004-02-25','Sri Lanka','Australia','Lost'),
('2004-02-25','New Zealand','South Africa','Won'),
('2004-02-27','Sri Lanka','Australia','Lost'),
('2004-02-29','Sri Lanka','Australia','Won'),
('2004-02-29','New Zealand','South Africa','Won'),
('2004-03-13','Pakistan','India','Lost'),
('2004-07-08','New Zealand','West Indies','No Result'),
('2004-07-21','Sri Lanka','Pakistan','Won');

select * from matches;


With match_cte as(
select match_date,team_name,match_status
from matches

UNION ALL

select match_date,team_opponent,
	CASE WHEN match_status='Lost' THEN 'Won' 
		WHEN  match_status='Won'THEN 'Lost'
		ELSE  match_status END 	match_status
from matches
), sec_match_cte as
(
select *,
CASE WHEN match_status ='Lost' THEN 'L'
	WHEN match_status ='Won' THEN 'W'
	WHEN match_status ='No result' THEN 'N'
	WHEN match_status ='Tie' THEN 'T'
	ELSE 'U' END short_status,
ROW_NUMBER() OVER(PARTITION BY team_name ORDER BY match_date DESC) rnk
from match_cte
)
select team_name,reverse(STRING_AGG(short_status,'-')) latest_result
from sec_match_cte
WHERE rnk<=3
GROUP BY team_name;