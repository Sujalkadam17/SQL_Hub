CREATE TABLE team_info(
 team_name VARCHAR(100)
);

INSERT INTO team_info VALUES('India'),
('Australia'),('South Africa'),('New Zealand'),('Sri Lanka'),('England'),('Bangladesh'),('West Indies');

select * from team_info;

select t1.team_name team1,t2.team_name team2
from team_info t1 inner join team_info t2
on t1.team_name<t2.team_name
order by team1;