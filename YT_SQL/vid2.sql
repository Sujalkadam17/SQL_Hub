-- solution 3
create database yt_sql;
CREATE TABLE electric_items(
id int,
type varchar(20),
status varchar(20),
time_res int
);

INSERT INTO electric_items VALUES(1,'light','on',100),
(1,'light','off',110),
(2,'fan','on',80),
(2,'fan','off',120),
(1,'light','on',150),
(1,'light','off',200);

select * from electric_items;

with electric_cte as
(
 select id ,type, CASE WHEN status='on' then -time_res else time_res end time_val
 from electric_items
)
select id,type,sum(time_val) total_duration
from electric_cte
group by id,type;