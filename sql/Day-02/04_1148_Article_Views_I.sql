-- Question 4. 1148. Article Views I:
-- Question Link : https://leetcode.com/problems/article-views-i/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find all the authors that viewed at least one of their own articles.Return the result table sorted by id in ascending order.
-- Key Logic: author_id = viewer_id ensures self-views

SELECT DISTINCT
    author_id AS id
FROM
    Views
WHERE
    author_id = viewer_id
ORDER BY id ASC;