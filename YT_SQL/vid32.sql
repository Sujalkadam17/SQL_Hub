CREATE TABLE motor_info(
 number_plate VARCHAR(100),
 travel_date DATE,
);

INSERT INTO motor_info VALUES('GAXXXXX 4204','2023-08-05'),
('MHXXXXX 8813','2023-08-13'),
('GAXXXXX 0019','2023-08-19'),
('KAXXXXX 1828','2023-08-29'),
('DLXXXXX 2222','2023-08-21'),
('MHXXXXX 4000','2023-08-21'),
('UPXXXXX 1317','2023-08-25'),
('MHXXXXX 9898','2023-08-23');

select * from motor_info;

WITH cte as
(
select * ,CASE WHEN RIGHT(number_plate,1)%2=0 THEN 'even' ELSE 'odd' END day_status,
	DATENAME(WEEKDAY,travel_date) travel_day
from motor_info 
)
select *, CASE WHEN (day_status='odd' and travel_day in('MONDAY','WEDNESDAY','FRIDAY') or 
				day_status='even' and travel_day not in('MONDAY','WEDNESDAY','FRIDAY'))
			  THEN 'No Challan'
			ELSE 'Challan Applicable' END challan 
from cte;
