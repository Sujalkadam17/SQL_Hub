-- 1193. Monthly Transactions I
-- Write an SQL query to find for each month and country, the number of transactions and their total amount,
--  the number of approved transactions and their total amount.
-- Return the result table in any order.

select concat(year(trans_date),'-',lpad(month(trans_date),2,0)) as month ,
    country , count(id) as trans_count ,
    count(CASE WHEN state = 'approved' then 1 END) as approved_count,
    sum(amount) as trans_total_amount,
    sum(CASE WHEN state = 'approved' then amount else 0 END) 
    as approved_total_amount
from Transactions
group by country , month;