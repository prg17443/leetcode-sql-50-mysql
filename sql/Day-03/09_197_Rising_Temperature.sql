-- Question 9. 197. Rising Temperature
-- https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
-- Key Logic : Self Join , Datediff
SELECT 
    w1.id
FROM
    Weather w1
        JOIN
    Weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE
    w1.temperature > w2.temperature;

    OR
-- Key Logic : Lag Function
SELECT id
FROM (
    SELECT id, temperature,
           LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp
    FROM Weather
) t
WHERE temperature > prev_temp;
