-- 1581. Customer Who Visited but Did Not Make Any Transactions
-- Write a solution to find the IDs of the users who visited 
-- without making any transactions and the number of times they made these types of visits.
select v.customer_id , count(v.visit_id) as count_no_trans
from Visits v
left join Transactions t
on v.visit_id = t.visit_id
where t.transaction_id is null
group by v.customer_id;