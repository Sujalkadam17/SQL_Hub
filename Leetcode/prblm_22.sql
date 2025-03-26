-- 596. Classes More Than 5 Students
-- Write a solution to find all the classes that have at least five students.

select class from
(
select class, count(student) as st
from Courses
group by class 
) as cls
where st >=5;

--2nd solution (optimized)
--select class from courses group by class having count(student) >= 5;