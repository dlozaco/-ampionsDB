
CREATE DATABASE ñampionDB;


CREATE OR REPLACE TABLE Scores(
	idScore INT(11) AUTO_INCREMENT NOT NULL,
	goalsTeam1 INT(11) NOT NULL,
	goalsTeam2 INT(11) NOT NULL,
	PRIMARY KEY(idScore)
);

CREATE OR REPLACE TABLE Players(
	idPlayer INT(11) AUTO_INCREMENT NOT NULL,
	NAME VARCHAR(256) NOT NULL,
	UNIQUE(NAME),
	PRIMARY KEY(idPlayer)
);

CREATE OR REPLACE TABLE teams(
	idTeam INT(11) AUTO_INCREMENT NOT NULL,
	PRIMARY KEY(idTeam)
);

CREATE OR REPLACE TABLE TeamsPlayers(
	idTeam INT(11) NOT NULL,
	idPlayer INT(11) NOT NULL,
	FOREIGN KEY (idPlayer) REFERENCES Players(idPlayer),
	FOREIGN KEY (idTeam) REFERENCES teams(idTeam)
);

CREATE OR REPLACE TABLE MMatchs(
	idMMatch INT(11) AUTO_INCREMENT NOT NULL,
	date_match DATE NOT NULL,
	idTeam1 INT(11) NOT NULL,
	idTeam2 INT(11) NOT NULL, 
	idScore INT(11) NOT NULL,
	idMVP INT(11) NOT NULL,
	PRIMARY KEY (idMMatch),
	FOREIGN KEY(idTeam1) REFERENCES teams(idTeam),
	FOREIGN KEY(idTeam2) REFERENCES teams(idTeam),
	FOREIGN KEY(idScore) REFERENCES Scores(idScore),
	FOREIGN KEY(idMVP) REFERENCES players(idPlayer)
);

DELIMITER //
CREATE OR REPLACE TRIGGER tCheckTeams
BEFORE INSERT ON MMatchs FOR EACH ROW
BEGIN
	IF(NEW.idTeam1 != NEW.idTeam2) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Team1 and Team2 are different!!";
	END IF;
END //
DELIMITER ;

CREATE OR REPLACE TABLE Goals(
	idMMatch INT(11) NOT NULL,
	idTeam INT(11) NOT NULL,
	idGoalPlayer INT(11) NOT NULL,
	FOREIGN KEY(idMMatch) REFERENCES MMatchs(idMMatch),
	FOREIGN KEY(idTeam) REFERENCES teams(idTeam),
	FOREIGN KEY(idGoalPlayer) REFERENCES players(idPlayer)

);

CREATE OR REPLACE TABLE Assistences(
	idMMatch INT(11) NOT NULL,
	idTeam INT(11) NOT NULL,
	idAssistencePlayer INT(11) NOT NULL,
	FOREIGN KEY(idMMatch) REFERENCES MMatchs(idMMatch),
	FOREIGN KEY(idTeam) REFERENCES teams(idTeam),
	FOREIGN KEY(idAssistencePlayer) REFERENCES players(idPlayer)
);

