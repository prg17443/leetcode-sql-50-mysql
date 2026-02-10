-- Question 38 : 626. Exchange Seats
-- https://leetcode.com/problems/exchange-seats/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped. 
-- Return the result table ordered by id in ascending order.
-- Key Point : If id is odd → swap with id + 1 --->  If id is even → swap with id - 1 ---> If last row is odd with no pair → keep it unchanged
SELECT 
    id,
    CASE 
        WHEN id % 2 = 1 THEN 
            COALESCE(
                LEAD(student, 1) OVER (ORDER BY id),
                student
            )
        ELSE 
            LAG(student, 1) OVER (ORDER BY id)
    END AS student
FROM Seat
ORDER BY id;