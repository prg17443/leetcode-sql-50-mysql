-- Question 19 : 1211. Queries Quality and Percentage
-- https://leetcode.com/problems/queries-quality-and-percentage/?envType=study-plan-v2&envId=top-sql-50
-- We define query quality as: The average of the ratio between query rating and its position.
-- We also define poor query percentage as: The percentage of all queries with rating less than 3.
-- Write a solution to find each query_name, the quality and poor_query_percentage.Both quality and poor_query_percentage should be rounded to 2 decimal places.
-- Key Point : For each query name, calculate average rating (quality) and the percentage of poor queries (rating < 3).
SELECT 
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(SUM(rating < 3) / COUNT(rating) * 100, 2) AS poor_query_percentage
FROM
    Queries
GROUP BY query_name;
