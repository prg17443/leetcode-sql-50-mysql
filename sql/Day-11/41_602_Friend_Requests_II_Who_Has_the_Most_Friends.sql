-- Question 41 : 602. Friend Requests II: Who Has the Most Friends
-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find the people who have the most friends and the most friends number.
-- The test cases are generated so that only one person has the most friends.
-- Being friends is bidirectional. If you accept someone's adding friend request, both you and the other person will have one more friend.
-- Key Point : UNION ALL → GROUP BY → COUNT → MAX.
SELECT 
    id, COUNT(*) AS num
FROM
    ((SELECT 
        requester_id AS id
    FROM
        RequestAccepted) UNION ALL (SELECT 
        accepter_id AS id
    FROM
        RequestAccepted)) AS t
GROUP BY id
ORDER BY num DESC
LIMIT 1;