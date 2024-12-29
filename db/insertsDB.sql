
CREATE OR REPLACE VIEW goalsPlayersTeam1 AS
	-- Select goal of team1
	SELECT NAME AS goal1Name
	FROM players
	where NAME = 'example 1' OR -- repeat this for each goal

CREATE OR REPLACE VIEW goalsPlayersTeam2 AS
	-- Select goals of team2
	SELECT NAME AS goal2Name
	FROM players
	where NAME = 'example 1' OR -- repeat this for each goal
	
CREATE OR REPLACE VIEW assistencesPlayersTeam1 AS
	-- Select assistences of team1
	SELECT NAME AS assistence1Name
	FROM players
	where NAME = 'example 1' OR -- repeat this for each assistence

CREATE OR REPLACE VIEW assistencesPlayersTeam2 AS
	-- Select assistences of team2
	SELECT NAME AS assistence2Name
	FROM players
	where NAME = 'example 1' OR -- repeat this for each assistence

-- Beggining of the procedure to insert the match
DELIMITER //
CREATE OR REPLACE PROCEDURE pInsertMatch7vs7(date_match DATE, idTeam1 INT(11), idTeam2 INT(11), 
	player1Team1 VARCHAR(64), player2Team1 VARCHAR(64), player3Team1 VARCHAR(64), 
	player4Team1 VARCHAR(64), player5Team1 VARCHAR(64), player6Team1 VARCHAR(64), player7Team1 VARCHAR(64),
	player1Team2 VARCHAR(64), player2Team2 VARCHAR(64), player3Team2 VARCHAR(64), 
	player4Team2 VARCHAR(64), player5Team2 VARCHAR(64), player6Team2 VARCHAR(64), player7Team2 VARCHAR(64),
	numGoalsTeam1 INT(11), numGoalsTeam2 INT(11), idMvp INT(11)
	)
BEGIN

	INSERT ON Scores(goalsTeam1, goalsTeam2) VALUES
		(numGoalsTeam1, numGoalsTeam2);
		
	INSERT ON teams(idTeam) VALUES
		(idTeam1), (idTeam2);
		
	INSERT ON teamsplayers(idTeam, idPlayer) VALUES
		(idTeam1, (SELECT idPlayer FROM players WHERE NAME == player1Team1)),
		(idTeam1, (SELECT idPlayer FROM players WHERE NAME == player2Team1)),
		(idTeam1, (SELECT idPlayer FROM players WHERE NAME == player3Team1)),
		(idTeam1, (SELECT idPlayer FROM players WHERE NAME == player4Team1)),
		(idTeam1, (SELECT idPlayer FROM players WHERE NAME == player5Team1)),
		(idTeam1, (SELECT idPlayer FROM players WHERE NAME == player6Team1)),
		(idTeam1, (SELECT idPlayer FROM players WHERE NAME == player7Team1)),
		(idTeam2, (SELECT idPlayer FROM players WHERE NAME == player1Team2)),
		(idTeam2, (SELECT idPlayer FROM players WHERE NAME == player2Team2)),
		(idTeam2, (SELECT idPlayer FROM players WHERE NAME == player3Team2)),
		(idTeam2, (SELECT idPlayer FROM players WHERE NAME == player4Team2)),
		(idTeam2, (SELECT idPlayer FROM players WHERE NAME == player5Team2)),
		(idTeam2, (SELECT idPlayer FROM players WHERE NAME == player6Team2)),
		(idTeam2, (SELECT idPlayer FROM players WHERE NAME == player7Team2));
		
	INSERT ON mmatchs(date_match, idTeam1, idTeam2, idScore, idMVP) VALUES
		(date_match, idTeam1, idTeam2, 
			(SELECT idScore 
			FROM scores 
			WHERE (goalsTeam1 = numGoalsTeam1) AND (goalsTeam2 = numGoalsTeam2)
		




END //
DELIMITER ;
	