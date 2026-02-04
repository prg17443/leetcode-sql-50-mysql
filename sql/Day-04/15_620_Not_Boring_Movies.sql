-- ******* Basic Aggregate Function *******
-- Question 15.: 620. Not Boring Movies
--  https://leetcode.com/problems/not-boring-movies/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".Return the result table ordered by rating in descending order.
-- Key logic : Filters movies with odd IDs, excludes those marked 'boring', and returns the results sorted by rating in descending order.
SELECT 
    id, movie, description, rating
FROM
    Cinema
WHERE
    id % 2 = 1 AND description <> 'boring'
ORDER BY rating DESC;