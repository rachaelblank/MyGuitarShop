DROP PROCEDURE IF EXISTS insert_products;

DELIMITER //

CREATE PROCEDURE insert_products
(
	category_id_param      	INT,
    product_code_param     	VARCHAR(50),
	product_name_param     	VARCHAR(255),
	list_price_param       	DECIMAL(9,2),
	discount_percent_param 	DECIMAL(9,2)
)
BEGIN
	IF (list_price_param < 0 or discount_percent_param < 0) THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT = 
				'This column does not accept negative numbers',
			MYSQL_ERRNO = 1264;
		END IF;
	
  INSERT INTO products
	(product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added)
  VALUES
	(DEFAULT, category_id_param, product_code_param, product_name_param, '',list_price_param, discount_percent_param, NOW());
END//

-- Pass
CALL insert_products(1, 'ProductCode', 'ProductName', 10, 2);

-- Fail
CALL insert_products(2, 'ProductCode2', 'ProductName2', -50, 5);