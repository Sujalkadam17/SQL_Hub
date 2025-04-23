CREATE TABLE gym_logs(
 entry_date DATE,
 status CHAR(1)
);

INSERT INTO gym_logs VALUES('2023-01-01','N'),('2023-01-02','Y'),('2023-01-03','Y'),
('2023-01-04','N'),('2023-01-05','N'),('2023-01-06','Y'),('2023-01-07','Y'),
('2023-01-08','Y'),('2023-01-09','N');

select * from gym_logs;

WITH gym_cte as
(
select entry_date, status,ROW_NUMBER() OVER(PARTITION BY status order by entry_date) rnk,
		DATEADD(DAY,-ROW_NUMBER() OVER(PARTITION BY status order by entry_date) ,entry_date) group_date
from gym_logs
),sec_cte as
(
select group_date,count(1) total_entries,
	DENSE_RANK() OVER(ORDER BY count(1) DESC ) group_rnk
from gym_cte
group by group_date
)
select entry_date, status
from gym_cte
where group_date in (select group_date from sec_cte where group_rnk=1);
