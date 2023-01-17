DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
DECLARE duplicate_entry_for_key	TINYINT DEFAULT FALSE;

BEGIN
DECLARE EXIT HANDLER FOR 1602
	SET duplicate_entry_for_key = TRUE;
    
    INSERT INTO categories VALUES (DEFAULT, 'Guitars');
    
    SELECT '1 row was inserted.' AS message;
END;

IF duplicate_entry_for_key = TRUE THEN
	SELECT 'Row was not inserted - duplicate key encountered.' AS message;
END IF;
END//

CALL test();