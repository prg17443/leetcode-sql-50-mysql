-- Question 20: 1193. Monthly Transactions I
-- https://leetcode.com/problems/monthly-transactions-i/description/?envType=study-plan-v2&envId=top-sql-50
--Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.
-- Key Logic : Extract month --> Group by month & country --> Count all --> Conditionally count approved --> Sum all --> Conditionally sum approved
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(state) AS trans_count,
    SUM(state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE
        WHEN state = 'approved' THEN amount
        ELSE 0
    END) AS approved_total_amount
FROM
    Transactions
GROUP BY month , country;