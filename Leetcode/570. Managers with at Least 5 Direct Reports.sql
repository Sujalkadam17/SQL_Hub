-- 570. Managers with at Least 5 Direct Reports
-- Write a solution to find managers with at least five direct reports.
with cte as (
   select e1.name,
          count(e1.id) as total
     from employee e
     join employee e1
   on e.managerid = e1.id
    group by e1.id
)
select name
  from cte
 where total >= 5;
