DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
DECLARE i 				INT DEFAULT 1;
DECLARE factor_1 		INT DEFAULT 10;
DECLARE factore_1 		INT DEFAULT 20;
DECLARE factor_message	VARCHAR(400);

SET factor_message = CONCAT('Common factors of ', factor_1, ' and ', factor_2, ':');
WHILE ((i <= factor_1) AND (i < factor_2)) DO
	IF ((factor_1 % i = 0) AND (factor_2 % i = 0)) THEN
		SET factor_message = CONCAT(factor_message, " ", i);
        END IF;
	SET i = i + 1;
END WHILE;
    
SELECT factor_message AS message;
    
END//

CALL test();