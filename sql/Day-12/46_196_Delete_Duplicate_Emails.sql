-- Question 46 : 196. Delete Duplicate Emails
-- https://leetcode.com/problems/delete-duplicate-emails/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id. 
-- For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
-- Key point : Compare table with itself--> If: Same email AND Larger id ➜ Delete that row
DELETE p1 FROM Person p1
        JOIN
    Person p2 ON p1.id > p2.id AND p1.email = p2.email;
-- ---- OR ---- --
-- Key Point : Find duplicates by email--> Delete rows where id is not the minimum

DELETE FROM Person
WHERE id NOT IN (
  SELECT MIN(id)
  FROM Person
  GROUP BY email
);