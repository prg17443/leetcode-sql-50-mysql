-- ------- Sorting And Grouping -------
-- Question 23 : 2356. Number of Unique Subjects Taught by Each Teacher
-- https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to calculate the number of unique subjects each teacher teaches in the university. Return the result table in any order.
-- Key Logic : Group by teacher_id and count distinct subject_id.
SELECT 
    teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM
    Teacher
GROUP BY teacher_id;