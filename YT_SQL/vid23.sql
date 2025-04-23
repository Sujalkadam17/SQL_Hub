
with cte as
(
select 0 as num1, 1 as num2 , 1 as total_nos
union all 
select num2 as num1 , num1+num2 as num1,total_nos+1 as total_nos FROM cte where total_nos<8
)
select * from cte;
