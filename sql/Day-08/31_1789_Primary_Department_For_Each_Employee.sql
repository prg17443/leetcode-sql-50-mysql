-- Question 31 : 1789. Primary Department for Each Employee
-- https://leetcode.com/problems/primary-department-for-each-employee/description/?envType=study-plan-v2&envId=top-sql-50
-- Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.
-- Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department. Return the result table in any order.
-- Key Point : Pick primary_flag = 'Y'-->If only one dept -> pick it-->GROUP BY employee_id-->HAVING COUNT(*) = 1-->Use OR condition-->Handle multi vs single records
SELECT 
    employee_id, department_id
FROM
    Employee
WHERE
    primary_flag LIKE 'Y'
        OR employee_id IN (SELECT 
            employee_id
        FROM
            Employee
        GROUP BY employee_id
        HAVING COUNT(*) = 1);

-- OR -- 
SELECT 
    employee_id, department_id
FROM
    Employee
GROUP BY employee_id
HAVING COUNT(employee_id) = 1 
UNION ALL SELECT 
    employee_id, department_id
FROM
    Employee
WHERE
    primary_flag = 'Y';