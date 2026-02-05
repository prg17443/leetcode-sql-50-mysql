-- Question 22 : 550. Game Play Analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50
-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.
-- Key Logic :Among all players, find how many returned to play exactly one day after their very first login, and divide by the total number of players.
SELECT 
    ROUND(COUNT(DISTINCT a.player_id) / (SELECT 
                    COUNT(DISTINCT player_id)
                FROM
                    Activity),
            2) AS fraction
FROM
    Activity a
        JOIN
    (SELECT 
        player_id, MIN(event_date) AS first_login
    FROM
        Activity
    GROUP BY player_id) AS a1 ON a.player_id = a1.player_id
WHERE
    a.event_date = DATE_ADD(a1.first_login, INTERVAL 1 DAY);
