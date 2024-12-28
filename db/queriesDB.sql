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

SELECT p.name, gp.goal + ap.assistence
FROM players p
JOIN goalsplayers gp ON gp.idPlayer = p.idPlayer
JOIN assistenceplayers ap ON ap.idPlayer = p.idPlayer
LIMIT 3;

