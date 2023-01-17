DROP TRIGGER IF EXISTS products_before_insert;

DELIMITER //

CREATE TRIGGER products_before_insert
	BEFORE UPDATE ON products
	FOR EACH ROW
BEGIN
	IF NEW.date_added IS NULL THEN
		SET NEW.date_added = curdate();
	END IF;
END //

-- Test
INSERT INTO products
	VALUES(1, "Harp", 300, NULL);