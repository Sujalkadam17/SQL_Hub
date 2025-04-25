CREATE TABLE sale_details(
 item_id INT,
 item_name VARCHAR(100),
 item_unit_price INT,
 item_quantity INT,
 item_sale_date DATE
)

INSERT INTO sale_details VALUES(50,'Tomatoes',40,8,'2023-03-12'),
(50,'Tomatoes',45,23,'2022-07-25'),
(50,'Tomatoes',40,8,'2023-04-06'),
(50,'Tomatoes',44,9,'2022-08-08'),
(50,'Tomatoes',35,45,'2022-11-28'),
(50,'Tomatoes',41,1,'2022-12-22'),
(50,'Tomatoes',40,31,'2023-02-01'),
(50,'Tomatoes',41,8,'2022-09-07'),
(50,'Tomatoes',40,2,'2022-11-27'),
(50,'Tomatoes',39,15,'2023-04-15'),
(50,'Tomatoes',47,8,'2022-12-08'),
(50,'Tomatoes',40,4,'2023-01-09'),
(50,'Tomatoes',49,6,'2021-03-31'),
(50,'Tomatoes',48,1,'2022-01-14'),
(50,'Tomatoes',40,12,'2023-02-21'),
(50,'Tomatoes',34,31,'2023-03-29'),
(50,'Tomatoes',49,6,'2023-03-31');

select * from sale_details;

Declare @input_date DATE;
SET @input_date='2023-04-13';

select * 
from sale_details
WHERE year(item_sale_date)=year(@input_date) AND 
		item_sale_date<=@input_date
ORDER BY item_sale_date;
