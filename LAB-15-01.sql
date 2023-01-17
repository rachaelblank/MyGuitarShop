DROP PROCEDURE IF EXISTS insert_category;

DELIMITER //

CREATE PROCEDURE insert_category
(
	category_id_var		INT,
    category_name_var	VARCHAR(50)
)
BEGIN
	DECLARE sql_error TINYINT DEFAULT FALSE;
    
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
	
    START TRANSACTION;
    
    UPDATE categories
    SET category_id = category_id_var
    WHERE category_name = category_name_var;
    
    IF sql_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END//

-- Fail
CALL update_category (1, 'Guitars');    

-- Pass
CALL update_category (6, 'Harps');