DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
DECLARE product_name_var	VARCHAR(50);
DECLARE list_price_var		DECIMAL(9,2);
DECLARE row_not_found		TINYINT DEFAULT FALSE;
DECLARE s_var 				VARCHAR(400) DEFAULT ''; 

DECLARE product_cursor CURSOR FOR
	SELECT
		product_name,
        list_price
	FROM
		products
	WHERE
		list_price > 700
	ORDER BY
		list_price DESC;
        
DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET row_not_found = TRUE;
    
OPEN product_cursor;

FETCH product_cursor INTO product_name_var, list_price_var;

WHILE row_not_found = FALSE DO
	SET s_var = CONCAT(s_var,'"', product_name_var, '","', list_price_var, '"|');
    FETCH product_cursor INTO product_name_var, list_price_var;
END WHILE;

SELECT s_var AS message;
END//

CALL test();