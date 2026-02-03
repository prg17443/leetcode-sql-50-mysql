-- Question 12. 1280. Students and Examinations
-- https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find the number of times each student attended each exam. Return the result table ordered by student_id and subject_name.
-- Key logic - Joins (cross And Left), Count,Group by, Order By
SELECT 
    s.student_id,
    student_name,
    s1.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM
    Students s
        JOIN
    Subjects s1
        LEFT JOIN
    Examinations e ON e.subject_name = s1.subject_name
        AND s.student_id = e.student_id
GROUP BY s.student_id , s1.subject_name
ORDER BY s.student_id , s1.subject_name;