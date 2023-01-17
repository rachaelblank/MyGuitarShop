DROP TRIGGER IF EXISTS products_before_update;

DELIMITER //

CREATE TRIGGER products_before_update
	BEFORE UPDATE ON products
	FOR EACH ROW
BEGIN
    IF NEW.discount_percent > 100 THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = 'The discount percent cannot be greater than 100';
	ELSEIF NEW.discount_percent < 0 THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = 'The discount percent cannot be less than 0';
	ELSEIF NEW.discount_percent < 1 THEN
		SET NEW.discount_percent = (NEW.discount_percent * 100);
	ELSE
		SET NEW.discount_percent = (NEW.discount_percent);
	END IF;
END//

-- Test with an UPDATE (fail)
UPDATE products
SET discount_percent = -1
WHERE product_id = 2;

-- Test with an UPDATE (fail)
UPDATE products
SET discount_percent = 110
WHERE product_id = 2;

-- Test with an UPDATE (pass)
UPDATE products
SET discount_percent = 1.5
WHERE product_id = 2;

-- Test with an UPDATE (pass)
UPDATE products
SET discount_percent = 5
WHERE product_id = 2;