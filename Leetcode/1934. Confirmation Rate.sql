-- 1934. Confirmation Rate
-- The confirmation rate of a user is 
-- the number of 'confirmed' messages divided by 
-- the total number of requested confirmation messages. 
-- The confirmation rate of a user that did not request any 
-- confirmation messages is 0. Round the confirmation rate to 
-- two decimal places.

SELECT 
    s.user_id, 
    ROUND(
        COALESCE(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.user_id), 0), 
        2
    ) AS confirmation_rate
FROM 
    Signups s
LEFT JOIN 
    Confirmations c
ON 
    s.user_id = c.user_id
GROUP BY 
    s.user_id;
