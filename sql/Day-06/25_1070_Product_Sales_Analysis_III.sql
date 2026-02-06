-- Question 25 : 1070. Product Sales Analysis III
-- https://leetcode.com/problems/product-sales-analysis-iii/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find all sales that occurred in the first year each product was sold. For each product_id, identify the earliest year it appears in the Sales table.
-- Return all sales entries for that product in that year.
-- Return a table with the following columns: product_id, first_year, quantity, and price.
-- Key Point : For each product ---> find its first year --> return quantity + price for that year.
SELECT 
    s1.product_id, s1.year AS first_year, s1.quantity, s1.price
FROM
    Sales s1
        JOIN
    (SELECT 
        product_id, MIN(year) AS first_year
    FROM
        Sales
    GROUP BY product_id) AS s2 ON s1.product_id = s2.product_id
        AND s1.year = first_year;