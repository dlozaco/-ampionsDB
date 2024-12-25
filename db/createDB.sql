
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

CREATE OR REPLACE TABLE Teams(
	date_match DATE NOT NULL,
	idTeam ENUM('1', '2') NOT NULL,
	idPlayer INT(11) NOT NULL,
	PRIMARY KEY(idTeam, date_match, idPlayer),
	FOREIGN KEY (idPlayer) REFERENCES Players(idPlayer)
);

CREATE OR REPLACE TABLE MMatchs(
	idMMatch INT(11) AUTO_INCREMENT NOT NULL,
	idScore INT(11) NOT NULL,
	date_match DATE NOT NULL,
	idTeam1 ENUM('1','2') NOT NULL,
	idTeam2 ENUM('1','2') NOT NULL, 
	idMVP INT(11) NOT NULL,
	PRIMARY KEY (idMMatch),
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
	NAME VARCHAR(256) NOT NULL,
	PRIMARY KEY(idMMatch),
	FOREIGN KEY(idMMatch) REFERENCES MMatchs(idMMatch)
);


CREATE OR REPLACE TABLE Assistences(
	idMMatch INT(11) NOT NULL,
	idTeam INT(11) NOT NULL,
	NAME VARCHAR(256) NOT NULL,
	PRIMARY KEY(idMMatch),
	FOREIGN KEY(idMMatch) REFERENCES MMatchs(idMMatch)
);

CREATE OR REPLACE TABLE 
