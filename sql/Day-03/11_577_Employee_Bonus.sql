-- Question 11. 577. Employee Bonus
-- https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to report the name and bonus amount of each employee who satisfies either of the following: The employee has a bonus less than 1000. The employee did not get any bonus.
-- Key Logic : Left Join, Is Null
SELECT 
    name, bonus
FROM
    Employee e
        LEFT JOIN
    Bonus b ON e.empId = b.empId
WHERE
    bonus < 1000 OR bonus IS NULL;