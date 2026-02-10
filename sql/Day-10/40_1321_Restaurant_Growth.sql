-- Question 40 : 1321. Restaurant Growth
-- https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50
-- Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
-- Return the result table ordered by visited_on in ascending order.
-- Key Point : First, group by date → get daily total revenue --> Use a 7-day sliding window average with window functions.

SELECT 
    visited_on,
    
    SUM(day_amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,

    ROUND(
        AVG(day_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS average_amount

FROM (
    SELECT 
        visited_on,
        SUM(amount) AS day_amount
    FROM Customer
    GROUP BY visited_on
) AS t

ORDER BY visited_on
LIMIT 10000 OFFSET 6;



