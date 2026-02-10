-- ------------- SUBQUERIES ---------- --
-- Question 37 : 1978. Employees Whose Manager Left the Company
-- https://leetcode.com/problems/employees-whose-manager-left-the-company/description/?envType=study-plan-v2&envId=top-sql-50
-- Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, 
-- their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.
-- Return the result table ordered by employee_id.
-- Key Point : Use a self-join or NOT IN subquery--->Exclude NULL managers-->Filter salary < 30000
SELECT 
    e.employee_id
FROM
    Employees e
        LEFT JOIN
    Employees m ON e.manager_id = m.employee_id
WHERE
    e.salary < 30000
        AND e.manager_id IS NOT NULL
        AND m.employee_id IS NULL
ORDER BY e.employee_id;
-- ---- OR ---- --
SELECT 
    employee_id
FROM
    Employees
WHERE
    salary < 30000
        AND manager_id IS NOT NULL
        AND manager_id NOT IN (SELECT 
            employee_id
        FROM
            Employees)
ORDER BY employee_id;
