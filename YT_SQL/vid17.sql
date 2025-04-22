CREATE TABLE user_nums( num int );

INSERT INTO user_nums VALUES(1),(2),(4),(5),(7),(8),(11);

select * from user_nums;
with temp_cte as
(
	select min(num) start_num , max(num) end_num
	from user_nums
), num_cte as
(
 select start_num num, end_num from temp_cte
 union all
 select num+1 as num ,end_num from num_cte where num<end_num
)
select n.num missing_nums
from user_nums u right join num_cte n
on u.num=n.num
where u.num is null;