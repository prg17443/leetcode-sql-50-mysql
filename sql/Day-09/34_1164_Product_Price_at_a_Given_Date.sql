-- Question 34 - 1164. Product Price at a Given Date
-- https://leetcode.com/problems/product-price-at-a-given-date/description/?envType=study-plan-v2&envId=top-sql-50
-- Initially, all products have price 10.
-- Write a solution to find the prices of all products on the date 2019-08-16.  Return the result table in any order.
-- Key Point : Inner query depends on outer row --> Filter change_date <= given_date-->ORDER BY change_date DESC-->LIMIT 1 → latest price-->IFNULL(..., 10) → default price-->DISTINCT product_id → one row per product
SELECT DISTINCT
    product_id,
    IFNULL((SELECT 
                    new_price
                FROM
                    products p2
                WHERE
                    p2.product_id = p1.product_id
                        AND change_date <= '2019-08-16'
                ORDER BY change_date DESC
                LIMIT 1),
            10) AS price
FROM
    Products p1;

-- OR -- 

SELECT 
    p.product_id, IFNULL(pr.new_price, 10) AS price
FROM
    (SELECT DISTINCT
        product_id
    FROM
        Products) p
        LEFT JOIN
    (SELECT 
        product_id, MAX(change_date) last_change_date
    FROM
        products
    WHERE
        change_date <= '2019-08-16'
    GROUP BY product_id) AS t ON p.product_id = t.product_id
        LEFT JOIN
    Products pr ON pr.product_id = t.product_id
        AND pr.change_date = t.last_change_date;