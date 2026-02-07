-- Question 29 : 1045. Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table. Return the result table in any order.
-- Key Point : GROUP BY customer_id --> COUNT(DISTINCT product_key) --> compare with total products
SELECT 
    customer_id
FROM
    Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT 
        COUNT(product_key)
    FROM
        Product); 