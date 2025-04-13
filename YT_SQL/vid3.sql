with cte as(
	select 1 num
	union all 
	select num+1 from cte where num<5000
)
select num from cte
option(maxrecursion 5000);
