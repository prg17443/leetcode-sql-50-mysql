-- Question 8.1581. Customer Who Visited but Did Not Make Any Transactions
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
-- Key Logic : Left Join ,Is Null , Group By
SELECT 
    customer_id, COUNT(v.visit_id) AS count_no_trans
FROM
    Visits v
        LEFT JOIN
    Transactions t ON v.visit_id = t.visit_id
WHERE
    Transaction_id IS NULL
GROUP BY customer_id;