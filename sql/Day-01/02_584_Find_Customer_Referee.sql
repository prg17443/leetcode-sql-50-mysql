-- Question 2. 584 Find Customer Referee;
-- Question Link : https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50
-- Find the names of the customer that are either: referred by any customer with id != 2. (2.) not referred by any customer.

SELECT 
    name
FROM
    Customer
WHERE
    referee_id IS NULL OR referee_id <> 2;