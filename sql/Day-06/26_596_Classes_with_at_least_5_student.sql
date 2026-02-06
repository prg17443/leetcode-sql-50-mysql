-- Question 26 : 596. Classes With at Least 5 Students
-- https://leetcode.com/problems/classes-with-at-least-5-students/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find all the classes that have at least five students.Return the result table in any order.
-- Key Point : Groupby , Having
SELECT 
    class
FROM
    Courses
GROUP BY class
HAVING COUNT(student) >= 5;