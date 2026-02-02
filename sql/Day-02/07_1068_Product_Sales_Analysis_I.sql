-- Question 7. 1068. Product Sales Analysis I
-- https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
-- Key Logic : INNER JOIN (to fetch product_name using product_id)
SELECT 
    product_name, year, price
FROM
    Sales s
        INNER JOIN
    Product p ON s.product_id = p.product_id;