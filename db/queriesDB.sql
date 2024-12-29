-- Top 3 people with the most goals
SELECT p.name, COUNT(*) AS goal
FROM players p
JOIN goals g ON p.idPlayer = g.idGoalPlayer
GROUP BY (p.name)
ORDER BY COUNT(*) DESC
LIMIT 3;


-- Top 3 people with the most assistences
SELECT p.name, COUNT(*) AS assistence
FROM players p
JOIN assistences a ON p.idPlayer = a.idAssistencePlayer
GROUP BY (p.name)
ORDER BY COUNT(*) DESC
LIMIT 3;


-- Top 3 people with the most goals + assistences
CREATE OR REPLACE VIEW goalsPlayers AS 
	SELECT p.idPlayer, COUNT(*) AS goal
	FROM players p
	JOIN goals g ON p.idPlayer = g.idGoalPlayer
	GROUP BY (p.name)
	ORDER BY COUNT(*) DESC;
	
CREATE OR REPLACE VIEW assistencePlayers AS
	 SELECT p.idPlayer, COUNT(*) AS assistence
	FROM players p
	JOIN assistences a ON p.idPlayer = a.idAssistencePlayer
	GROUP BY (p.name)
	ORDER BY COUNT(*) DESC;

SELECT p.name, ap.assistence AS gpAp
FROM players p
JOIN assistenceplayers ap ON ap.idPlayer = p.idPlayer
WHERE();

-- MVP of each game and his team
SELECT m.idMMatch, m.date_match, p.name, pt.idTeam
FROM mmatchs m
JOIN players p ON m.idMVP = p.idPlayer
JOIN teamsplayers pt ON p.idPlayer = pt.idPlayer
WHERE pt.idTeam = m.idTeam1 OR pt.idTeam = m.idTeam2;


-- Shows main information of a match
SELECT m.date_match, m.idTeam1 AS Team1, m.idTeam2 AS Team2, 
       s.goalsTeam1, s.goalsTeam2, p.NAME AS MVP
FROM MMatchs m
JOIN Scores s ON m.idScore = s.idScore
JOIN Players p ON m.idMVP = p.idPlayer;