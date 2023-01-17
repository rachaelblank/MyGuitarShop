DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
DECLARE sql_error TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTIONS
	SET sql_error = TRUE;
    
START TRANSACTION;

DELETE FROM addresses WHERE customer_id = 8;
DELETE FROM orders WHERE customer_id = 8;
DELETE FROM customers WHERE customer_id = 8;

IF sql_error = FALSE THEN
	COMMIT;
    SELECT 'The transaction was commited.';
ELSE
	ROLLBACK;
    SELECT 'The transaction was rolled back.';
END IF;
END//

CALL test();