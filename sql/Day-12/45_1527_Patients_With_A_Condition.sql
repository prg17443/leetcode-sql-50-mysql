-- Question 45 : 1527. Patients With a Condition
-- https://leetcode.com/problems/patients-with-a-condition/description/?envType=study-plan-v2&envId=top-sql-50
-- 'conditions' contains 0 or more code separated by spaces. This table contains information of the patients in the hospital.
-- Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
-- Key Point :  Condition contains "DIAB1" --> Match start of string OR Match after a space

SELECT 
    patient_id, patient_name, conditions
FROM
    Patients
WHERE
    conditions LIKE '% DIAB1%'
        OR Conditions LIKE 'DIAB1%';