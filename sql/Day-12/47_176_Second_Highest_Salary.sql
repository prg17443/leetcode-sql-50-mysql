-- Question 47 : 176. Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).
-- Key Point : Use DISTINCT--> Sort descending--> Use LIMIT 1 OFFSET 1
SELECT 
    (SELECT DISTINCT
            salary
        FROM
            Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1) AS SecondHighestSalary;
