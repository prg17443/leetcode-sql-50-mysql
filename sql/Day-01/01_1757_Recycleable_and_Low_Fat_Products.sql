-- Leetcode SQL 50
-- ----SELECT---- --
-- Question 1. 1757 Recyclable and Low Fat Products;
-- https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2&envId=top-sql-50;
-- Write a solution to find the ids of products that are both low fat and recyclable.

SELECT product_id 
            FROM Products 
                   WHERE recyclable = "Y" 
                        AND low_fats = "Y";
