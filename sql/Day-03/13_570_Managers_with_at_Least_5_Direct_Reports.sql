-- Question 13.: 570. Managers with at Least 5 Direct Reports
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find managers with at least five direct reports.
-- Key Logic : Self join, Group By, Count, Filter
SELECT 
    e2.name
FROM
    Employee e1
        JOIN
    Employee e2 ON e1.managerId = e2.id
GROUP BY e2.id , e2.name
HAVING COUNT(e1.id) >= 5;


