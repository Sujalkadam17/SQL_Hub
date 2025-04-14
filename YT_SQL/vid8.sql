-- gym attendance 


CREATE TABLE gym_log(
 entry_date DATE,
 did_attend CHAR(1)
);

INSERT INTO gym_log VALUES('2023-01-01','Y'),
('2023-01-02','Y'),
('2023-01-03','Y'),
('2023-01-04','N'),
('2023-01-05','N'),
('2023-01-06','Y'),
('2023-01-07','N'),
('2023-01-08','N'),
('2023-01-09','N');

select * from gym_log;

WITH gym_cte AS
(
 select *,ROW_NUMBER() OVER(PARTITION BY did_attend ORDER BY entry_date) rnk,
 DATEADD(DAY,-ROW_NUMBER() OVER(PARTITION BY did_attend ORDER BY entry_date),entry_date) group_date
 from gym_log
) select MIN(entry_date) start_date , MAX(entry_date) end_date, 
CASE WHEN did_attend='Y' THEN 'Attended' ELSE 'Not attened' END attend_status
from gym_cte
GROUP BY did_attend,group_date;