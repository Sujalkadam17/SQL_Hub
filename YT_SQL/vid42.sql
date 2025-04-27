CREATE TABLE hire_info(
 hire_id INT,
 hire_date DATE,
 hire_name VARCHAR(100),
 hire_mail VARCHAR(500)
);

INSERT INTO hire_info VALUES(3903,'2023-02-27','Rupesh','rupesh.cool@gmail.com'),
(3951,'2022-08-11','Vishal','vishgamer@gmail.com'),
(2396,'2021-01-19','Pushpanjali','pushpa123@gmail.com'),
(2396,'2021-02-26','Diwakar','iamsuper@gmail.com'),
(4014,'2023-04-01','Mukul','mukumar@gmail.com'),
(2396,'2022-12-16','Ishita','ishthechamp@gmail.com'),
(1049,'2021-01-03','Tanmay','tanmay_raikar@gmail.com'),
(2945,'2023-03-20','Roshni','roshni519@gmail.com'),
(3905,'2023-08-30','Suhani','suhani1995@gmail.com');

select * from hire_info;

WITH cte as
(
select *,DATEPART(QUARTER,hire_date) quarter,
		CASE WHEN DATEPART(QUARTER,hire_date) = 1 THEN FORMAT(hire_date,'yyyy-01-01') 
			 WHEN DATEPART(QUARTER,hire_date) = 2 THEN FORMAT(hire_date,'yyyy-04-01') 
			 WHEN DATEPART(QUARTER,hire_date) = 3 THEN FORMAT(hire_date,'yyyy-07-01') 
			 WHEN DATEPART(QUARTER,hire_date) = 4 THEN FORMAT(hire_date,'yyyy-10-01')
			 END start_quarter,
		
		CASE WHEN DATEPART(QUARTER,hire_date) = 1 THEN FORMAT(hire_date,'yyyy-03-31') 
			 WHEN DATEPART(QUARTER,hire_date) = 2 THEN FORMAT(hire_date,'yyyy-06-30') 
			 WHEN DATEPART(QUARTER,hire_date) = 3 THEN FORMAT(hire_date,'yyyy-09-31') 
			 WHEN DATEPART(QUARTER,hire_date) = 4 THEN FORMAT(hire_date,'yyyy-12-31')
			 END end_quarter

from hire_info
)
select start_quarter,end_quarter,count(1) total_hire
from cte
GROUP BY start_quarter,end_quarter
order by start_quarter;
