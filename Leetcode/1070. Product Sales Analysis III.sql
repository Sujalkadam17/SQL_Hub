--1070. Product Sales Analysis III
--Write a solution to select the product id, year, quantity, and price for the first year of every product sold.
--using window function
with cte as(
    select product_id , year , quantity , price ,
    first_value(year) over(Partition by product_id order by year ) as fy
    from Sales
) select product_id , year as first_year , quantity , price from cte
where year = fy

--using join
WITH first_year_cte AS (
    SELECT 
        product_id, 
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)
SELECT 
    s.product_id, 
    f.first_year, 
    s.quantity, 
    s.price
FROM Sales s
JOIN first_year_cte f
ON s.product_id = f.product_id AND s.year = f.first_year;
