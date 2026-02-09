-- Question 33 : 180. Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50
-- Find all numbers that appear at least three times consecutively. Return the result table in any order.
-- Key Point : For Window Function - Use LAG() --> Compare with previous 2 rows-->Return distinct num
-- For 2nd option : Need 3 consecutive rows--> Use id difference = 1-->Self-join table 3 times-->Check num equality with AND-->Return distinct num
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num,
           LAG(num,1) OVER (ORDER BY id) AS prev1,
           LAG(num,2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1 AND num = prev2;
-- OR --
SELECT DISTINCT
    L1.num AS ConsecutiveNums
FROM
    Logs L1
        JOIN
    Logs L2 ON L1.id = L2.id - 1
        JOIN
    Logs L3 ON L2.id = L3.id - 1
WHERE
    L1.num = L2.num AND L2.num = L3.num;
