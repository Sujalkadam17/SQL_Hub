-- 1174. Immediate Food Delivery II
-- If the customers preferred delivery date is the same as the order date, 
-- then the order is called immediate; otherwise, it is called scheduled.
-- The first order of a customer is the order with the earliest order date that the customer made. 
-- It is guaranteed that a customer has precisely one first order.
-- Write a solution to find the percentage of immediate orders in the first orders of all customers, 
-- rounded to 2 decimal places.

WITH FirstOrder AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
),
FirstOrderDetails AS (
    SELECT
        f.customer_id,
        f.first_order_date,
        d.customer_pref_delivery_date
    FROM FirstOrder f
    JOIN Delivery d
    ON f.customer_id = d.customer_id AND f.first_order_date = d.order_date
)
SELECT
    ROUND(
        SUM(CASE WHEN first_order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
        2
    ) AS immediate_percentage
FROM FirstOrderDetails;


