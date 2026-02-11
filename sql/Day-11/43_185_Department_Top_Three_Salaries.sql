-- Question 43 : 185. Department Top Three Salaries
-- https://leetcode.com/problems/department-top-three-salaries/submissions/1902299429/?envType=study-plan-v2&envId=top-sql-50
-- A company's executives are interested in seeing who earns the most money in each of the company's departments. 
-- A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
-- Write a solution to find the employees who are high earners in each of the departments.Return the result table in any order.
-- Key Point : DENSE_RANK() --> ranking <= 3 --> Final ORDER BY --> Join to get department name
SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT 
        *,
        DENSE_RANK() OVER (
            PARTITION BY departmentId 
            ORDER BY salary DESC
        ) AS ranking
    FROM Employee
) AS e
JOIN Department d 
    ON e.departmentId = d.id
WHERE e.ranking <= 3
ORDER BY 
    Department,
    Salary DESC;
