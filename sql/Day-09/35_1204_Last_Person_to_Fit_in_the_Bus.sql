-- Question 35 : 1204. Last Person to Fit in the Bus
-- http://leetcode.com/problems/last-person-to-fit-in-the-abus/description/?envType=study-plan-v2&envId=top-sql-50
-- There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.
-- Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. 
-- The test cases are generated such that the first person does not exceed the weight limit.Note that only one person can board the bus at any given turn.
-- Key Point : Use SUM(weight) OVER (ORDER BY turn)--> Running cumulative total-->Keep total_weight <= 1000-->Get last valid row (ORDER BY turn DESC LIMIT 1)

SELECT person_name
FROM (
    SELECT 
        person_name,
        turn,
        weight,
        SUM(weight) OVER (ORDER BY turn ASC) AS total_weight
    FROM Queue
) AS q
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
