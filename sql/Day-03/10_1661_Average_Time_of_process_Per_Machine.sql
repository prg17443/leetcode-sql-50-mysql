-- Question 10. 1661. Average Time of Process per Machine
-- https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50
-- There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
-- Key Logic : Average , Subtract ,Self Join , match start/end.

SELECT 
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM
    Activity a
        JOIN
    Activity b ON a.machine_id = b.machine_id
        AND a.activity_type = 'start'
        AND b.activity_type = 'end'
GROUP BY a.machine_id;
