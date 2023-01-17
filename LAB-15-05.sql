DROP PROCEDURE IF EXISTS update_product_discount

DELIMITER //

CREATE PROCEDURE update_product_discount
(
	product_id_param		INT,
    discount_percent_param	DECIMAL(9,2)
)
BEGIN
	IF discount_percent_param < 0 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT = 
				'This column does not accept negative numbers',
			MYSQL_ERRNO = 1264;
	END IF;
    
		UPDATE products
        SET discount_percent = discount_percent_param
        WHERE product_id = product_id_param;
END//

-- Pass
CALL update_product_discount(1,10.0);

-- Fail
CALL update_product_discount(1,-5.0);
    