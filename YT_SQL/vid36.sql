CREATE TABLE stocks(
 stock_id int,
 stock_name varchar(50),
 stock_date date,
 stock_price decimal(10,2)
);

INSERT INTO stocks VALUES(100,'Vikas Lifecare','2022-09-06',5.10),
(100,'Vikas Lifecare','2022-09-07',5.00),
(100,'Vikas Lifecare','2022-09-08',5.25),
(100,'Vikas Lifecare','2022-09-09',5.10),
(100,'Vikas Lifecare','2022-09-12',5.15),
(120,'Globalspace Technologies','2022-08-30',42.00),
(120,'Globalspace Technologies','2022-09-01',42.65),
(120,'Globalspace Technologies','2022-09-02',43.65),
(120,'Globalspace Technologies','2022-09-05',47.05),
(120,'Globalspace Technologies','2022-09-06',44.15),
(120,'Globalspace Technologies','2022-09-20',39.75),
(191,'Zomato Ltd','2022-09-22',63.30),
(191,'Zomato Ltd','2022-09-23',60.80);

select * from stocks;

WITH stocks_cte as
(
select b.stock_id, b.stock_name,b.stock_date buy_date, b.stock_price buy_price,
		s.stock_date sell_date, s.stock_price sell_price,
		(s.stock_price - b.stock_price) single_share_profit
from stocks b inner join stocks s
on b.stock_id=s.stock_id and b.stock_date<s.stock_date
),rnk_cte as
(
select *, DENSE_RANK() OVER(PARTITION BY stock_id ORDER BY single_share_profit DESC) rnk
from stocks_cte
)
select stock_id,stock_name,buy_date,buy_price,sell_date,sell_price,single_share_profit
from rnk_cte
where rnk=1 and single_share_profit>0;

