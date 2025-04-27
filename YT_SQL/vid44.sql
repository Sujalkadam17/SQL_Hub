with pattern_cte as
(
select 1 num
union all
select num+1 as num from pattern_cte where num<5
)
select REPLICATE('* ',num) pattern from pattern_cte;