-- 619. Biggest Single Number
-- A single number is a number that appeared only once in the MyNumbers table.
-- Find the largest single number. If there is no single number, report null.

with cte as (
    select num 
    from MyNumbers 
    group by num 
    having  count(num) = 1
) select max(num) as num 
    from cte;
