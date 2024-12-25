



DELIMITER //
CREATE OR REPLACE PROCEDURE pInsertPlayer()
BEGIN
	DELETE FROM players;

	INSERT INTO players(idPlayer, NAME) VALUES
		(1, 'David'), (2, 'Sancho'), (3, 'Marco'), (4, 'El Mago'), (5, 'Sufi'), (6, 'Leo'), (7, 'Pobi'), (8, 'Jose'), 
		(9, 'Bobuto'), (10, 'Isaias'), (11, 'Oren'), (12, 'Sedano'), (13, 'Hugo'), (14, 'Lusi'), 
		(15, 'Dabilito'), (16, 'Ilias'), (17, 'Sofia'); 
END //
DELIMITER ;

CALL pInsertPlayer;




