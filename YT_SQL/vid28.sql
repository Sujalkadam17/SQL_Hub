CREATE TABLE delivery(
 delivery_id INT,
 customer_id INT,
 order_date DATE,
 delivery_date DATE
);

INSERT INTO delivery VALUES(1,1,'2019-08-01','2019-08-02'),
(2,5,'2019-08-02','2019-08-02'),
(3,1,'2019-08-11','2019-08-11'),
(4,3,'2019-08-24','2019-08-26'),
(5,4,'2019-08-21','2019-08-22'),
(6,2,'2019-08-11','2019-08-13');

select * from delivery;

select CAST(100.0*SUM(CASE WHEN order_date=delivery_date  then 1 ELSE 0 END)/
	COUNT(delivery_id) as DECIMAL(5,2) ) percentage
from delivery;