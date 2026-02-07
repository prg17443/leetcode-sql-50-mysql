-- Question 28 : 619. Biggest Single Number
-- https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50
-- A single number is a number that appeared only once in the MyNumbers table. Find the largest single number. If there is no single number, report null.
-- Key Point : GROUP BY --> HAVING COUNT(*) = 1 --> MAX()
SELECT 
    MAX(num) AS num
FROM
    (SELECT DISTINCT
        num, COUNT(num) AS counts
    FROM
        MyNumbers
    GROUP BY num
    HAVING counts = 1) AS t;