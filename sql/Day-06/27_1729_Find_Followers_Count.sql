-- Question 27 : 1729. Find Followers Count
-- https://leetcode.com/problems/find-followers-count/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution that will, for each user, return the number of followers. Return the result table ordered by user_id in ascending order.
-- Key Point : Count , Group By , Order By
SELECT 
    user_id, COUNT(follower_id) AS followers_count
FROM
    Followers
GROUP BY user_id
ORDER BY user_id ASC;
