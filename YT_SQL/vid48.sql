CREATE TABLE orders2(
 order_id INT,
 order_date DATE,
 order_amt INT,
 order_cust_id INT
);

INSERT INTO orders2 VALUES(100,'2023-01-13',5000,10),
(562,'2023-06-16',3000,78),
(125,'2023-02-22',2220,10),
(416,'2023-02-27',200,10),
(93,'2023-01-12',8050,23),
(611,'2023-02-26',9800,10),
(734,'2023-03-11',9000,63),
(466,'2023-06-18',6500,78),
(410,'2023-01-19',1000,18),
(461,'2023-03-25',500,63),
(235,'2023-06-23',6000,78),
(257,'2023-06-24',330,78);

select * from orders2;

WITH or_cte as
(
select *,LEAD(order_date) OVER(PARTITION BY order_cust_id order by order_date)  order_date2,
		 LEAD(order_date,2) OVER(PARTITION BY order_cust_id order by order_date)  order_date3
from orders2
),cust_cte as
(
select order_cust_id,order_date order_date1,order_date2,order_date3
from or_cte
where	DATEDIFF(DAY,order_date,order_date2) <=7 and DATEDIFF(DAY,order_date,order_date3) <=7
)
select o.order_id,o.order_date,o.order_amt,o.order_cust_id
from orders2 o inner join cust_cte c
on o.order_cust_id=c.order_cust_id and o.order_date BETWEEN c.order_date1 and c.order_date3
group by o.order_id,o.order_date,o.order_amt,o.order_cust_id
order by o.order_cust_id,o.order_date;