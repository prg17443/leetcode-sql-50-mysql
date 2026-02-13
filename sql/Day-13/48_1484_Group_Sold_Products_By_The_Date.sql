-- Question 48 : 1484. Group Sold Products By The Date
-- https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find for each date the number of different products sold and their names. The sold products names for each date should be sorted lexicographically.
-- Return the result table ordered by sell_date.
-- Key Point : GROUP BY sell_date → group rows per day--> COUNT(DISTINCT product) → unique product count--> GROUP_CONCAT(DISTINCT ... ORDER BY ...) → sorted unique product list
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product
        ORDER BY product ASC
        SEPARATOR ',') AS products
FROM
    Activities
GROUP BY sell_date
ORDER BY sell_date;