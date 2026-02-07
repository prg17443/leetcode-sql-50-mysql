-- ------ Advanced Select and Joins ------ --
-- Question 30 : 1731. The Number of Employees Which Report to Each Employee
-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, 
-- and the average age of the reports rounded to the nearest integer. Return the result table ordered by employee_id.
-- Key Point : Self JOIN --> GROUP BY manager --> COUNT + AVG
SELECT 
    m.employee_id,
    m.name,
    COUNT(e.reports_to) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM
    Employees e
        JOIN
    Employees m ON e.reports_to = m.employee_id
GROUP BY e.reports_to
ORDER BY m.employee_id;