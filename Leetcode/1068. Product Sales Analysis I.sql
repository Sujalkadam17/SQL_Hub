-- 1068. Product Sales Analysis I
-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
SELECT p.product_name , s.YEAR , s.price
FROM Sales s
INNER JOIN Product p
ON p.product_id = s.product_id;
