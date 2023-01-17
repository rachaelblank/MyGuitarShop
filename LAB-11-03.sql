-- 3.
INSERT INTO user VALUES
	(1, 'johnsmith@gmail.com', 'John', 'Smith'),
    (2, 'janedoe@gmail.com', 'Jane', 'Doe');
    
INSERT INTO products VALUES
	(1, 'Local Music Vol 2'),
    (2, 'Local Music Vol 1');
    
INSERT INTO downloads VALUES
	(1, 1, NOW(), 'pedals_are_falling.mp3', 2),
    (2, 2, NOW(), 'turn_signalg.mp3', 1),
    (3, 2, NOW(), 'one_horse_town.mp3', 2);