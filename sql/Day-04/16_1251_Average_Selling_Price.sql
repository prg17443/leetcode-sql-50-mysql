-- Question 16 : 1251. Average Selling Price
-- https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.
-- Key point : Ifnull,left join,Group by

SELECT 
    p.product_id,
    ROUND(IFNULL(SUM(price * units)/SUM(units), 0),
            2) AS average_price
FROM
    Prices p
        LEFT JOIN
    UnitsSold u ON p.product_id = u.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY product_id;  