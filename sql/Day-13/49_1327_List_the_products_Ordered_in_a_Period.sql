-- Question 49 : 1327. List the Products Ordered in a Period
-- https://leetcode.com/problems/list-the-products-ordered-in-a-period/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount. Return the result table in any order.
-- Key Point :JOIN Products and Orders --> Filter date (e.g., '2020-02-01' to '2020-02-29') --> GROUP BY product --> HAVING SUM(unit) ≥ 100
SELECT 
    product_name, SUM(unit) AS unit
FROM
    Products p
        JOIN
    Orders o ON p.product_id = o.product_id
WHERE
    order_date >= '2020-02-01'
        AND order_date < '2020-03-01'
GROUP BY product_name
HAVING unit >= 100;