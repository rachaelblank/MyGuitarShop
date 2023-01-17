DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
DECLARE count_of_products INT;
DECLARE average_price DECIMAL(10,2);

SELECT
COUNT(*), AVG(list_price)
    INTO count_of_products, average_price FROM products;
    
IF count_of_products >= 7 THEN
	SELECT CONCAT('The number of products is greater than or equal to 7, ' , 'The average price is ', average_price)
		AS message; 
ELSE
	SELECT 'The number of products is less than 7' AS message;
END IF;
END//

CALL test();