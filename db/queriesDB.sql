
SELECT p.name, COUNT(*)
FROM players p
JOIN goals g ON p.idPlayer = g.idGoalPlayer
GROUP BY (p.name)
ORDER BY COUNT(*) DESC;