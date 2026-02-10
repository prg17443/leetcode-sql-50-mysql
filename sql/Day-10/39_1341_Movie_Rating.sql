-- Question 39 : 1341. Movie Rating
-- https://leetcode.com/problems/movie-rating/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to: Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
-- Key Points : 1) User with most ratings--> GROUP BY user_id--> COUNT(*)--> Order by count DESC, then name ASC-->LIMIT 1
-- 2️) Highest rated movie in Feb 2020 : Filter created_at in '2020-02'--> GROUP BY movie_id--> AVG(rating)--> Order by avg DESC, then title ASC ---> LIMIT 1

(SELECT 
    name AS results
FROM
    Users u
        JOIN
    MovieRating m ON u.user_id = m.user_id
GROUP BY u.user_id , u.name
ORDER BY COUNT(*) DESC , name ASC
LIMIT 1) UNION ALL (SELECT 
    title
FROM
    Movies m1
        JOIN
    MovieRating m2 ON m1.movie_id = m2.movie_id
WHERE
    created_at >= '2020-02-01'
        AND created_at < '2020-03-01'
GROUP BY m1.movie_id , m1.title
ORDER BY AVG(m2.rating) DESC , m1.title ASC
LIMIT 1); 
