------BASIC JOINS------
-- Question 6. 1378. Replace Employee ID With The Unique Identifier 
-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.Return the result table in any order.
-- Key Logic : Left Joins
SELECT 
    unique_id, name
FROM
    Employees e
        LEFT JOIN
    EmployeeUNI e1 ON e.id = e1.id;
