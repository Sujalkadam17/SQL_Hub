-- 1045. Customers Who Bought All Products
-- Write a solution to report the customer ids 
-- from the Customer table that bought all the products in the Product table.

select customer_id 
from Customer
group by customer_id
having count(distinct(product_key)) = (select count(distinct(product_key)) as total_prd
                                from Product);