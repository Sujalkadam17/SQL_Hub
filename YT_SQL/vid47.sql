CREATE TABLE customer_info(
 cust_id INT,
 cust_name VARCHAR(100),
 cust_mail VARCHAR(200),
 cust_location VARCHAR(100)
);

CREATE TABLE orders(
 order_id INT,
 order_date DATE,
 order_amt INT,
 order_cust_id INT,
);

INSERT INTO customer_info VALUES(100,'Manish','managpur12@gmail.com','Nagpur'),
(425,'Priyanka','priyanka1995@gmail.com','Rajkot'),
(311,'Siddharth','coolguysid@gmail.com','Ujjain'),
(351,'Pihu','iampihu@gmail.com','Madurai'),
(417,'Harsh','harshmalhotra87@gmail.com','Delhi');

INSERT INTO orders VALUES(89450,'2023-05-21',1246,100),
(89284,'2023-04-13',1246,100),
(89491,'2023-03-27',349,417),
(89673,'2023-01-11',1980,351),
(89533,'2023-03-05',299,351),
(89777,'2023-02-01',1078,351),
(89735,'2023-03-19',9050,351),
(89186,'2023-04-29',830,417);

select * from customer_info;
select * from orders;

--approach 1
/*
select c.*
from customer_info c left join orders o
on c.cust_id=o.order_cust_id
WHERE o.order_cust_id is null;

*/

-- approach 2
/*
select * 
from customer_info WHERE cust_id NOT IN (
select distinct(order_cust_id)
from orders
);
*/

--approach 3
/*
select c.*
from customer_info c
WHERE NOT EXISTS (
	select * from orders
	where order_cust_id=c.cust_id
);*/