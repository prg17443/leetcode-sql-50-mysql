-- ------ Advanced String Functions / Regex / Clause ------ --
-- Question 44 : 1667. Fix Names in a Table
-- https://leetcode.com/problems/fix-names-in-a-table/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase. Return the result table ordered by user_id.
-- Key Point : First character → UPPER() --> Remaining characters → LOWER() --> Concatenate them-->Order by user_id
SELECT 
    user_id,
    CONCAT(UPPER(LEFT(name, 1)),
            LOWER(SUBSTRING(name, 2))) AS name
FROM
    Users
ORDER BY user_id;
