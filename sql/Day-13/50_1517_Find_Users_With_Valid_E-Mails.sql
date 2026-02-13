-- Question 50 : 1517. Find Users With Valid E-Mails
-- https://leetcode.com/problems/find-users-with-valid-e-mails/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to find the users who have valid emails. A valid e-mail has a prefix name and a domain where:
-- The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
-- The domain is '@leetcode.com'. Return the result table in any order.
-- Key Point : Use REGEXP to validate email format. (^ → start of string; [A-Za-z] → first char must be letter; [A-Za-z0-9_.-]* → allowed characters; @leetcode\\.com → exact domain; $ → end of string)
SELECT 
    user_id, name, mail
FROM
    Users
WHERE
    REGEXP_LIKE(mail,
            '^[A-Za-z]+[A-Za-z0-9_.-]*@leetcode[.]com$',
            'c');