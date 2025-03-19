-- 197. Rising Temperature
-- Write a solution to find all dates
--  id with higher temperatures compared to its previous dates (yesterday).

select w.id
from Weather w
cross join Weather w1
where datediff(w.recordDate,w1.recordDate) = 1
        and w.temperature > w1.temperature
        ;