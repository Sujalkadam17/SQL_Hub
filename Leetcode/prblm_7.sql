-- 1068. Product Sales Analysis I
-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
select p.product_name , s.year , s.price
from Sales s
inner join Product p
on p.product_id = s.product_id;