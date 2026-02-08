-- Question 32 : 610. Triangle Judgement
-- https://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&envId=top-sql-50
-- Report for every three line segments whether they can form a triangle. Return the result table in any order.
-- Key Point : 👉 A triangle is valid only if sum of any two sides > third side.
SELECT 
    x,
    y,
    z,
    (CASE
        WHEN
            (x + y > z) AND (y + z > x)
                AND (z + x > y)
        THEN
            'Yes'
        ELSE 'No'
    END) AS triangle
FROM
    Triangle;