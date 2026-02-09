-- Question 36 : 1907. Count Salary Categories
-- https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to calculate the number of bank accounts for each salary category. The salary categories are: "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.
-- The result table must contain all three categories. If there are no accounts in a category, return 0.
-- Key Point : Fixed 3 salary labels (manual rows) --> Use SUM(condition) for counting-->UNION ALL to stack categories --> Each query scans same table

SELECT 
    'Low Salary' AS Category,
    SUM(income < 20000) AS accounts_count
FROM
    Accounts 
UNION ALL SELECT 
    'Average Salary', SUM(income BETWEEN 20000 AND 50000)
FROM
    Accounts 
UNION ALL SELECT 
    'High Salary', SUM(income > 50000)
FROM
    Accounts;
