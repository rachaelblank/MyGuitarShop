DROP TABLE IF EXISTS Product_Audit;

CREATE TABLE Product_Audit
(
	audit_id			INT		NOT NULL,
    product_id			INT		NOT NULL,
    category_id			int		NOT NULL,
    product_code		VARCHAR(10),
    product_name		VARCHAR(100),
    description			VARCHAR(255),
    list_price			FLOAT(10),
    discount_percent 	FLOAT(10),
    date_updated		TIMESTAMP,
    PRIMARY KEY (audit_id)
);

DROP TRIGGER IF EXISTS products_before_update;

DELIMITER //

CREATE TRIGGER products_after_update
BEFORE UPDATE ON products
	FOR EACH ROW
BEGIN
	INSERT INTO Product_Audit
		(audit_id, product_id, product_code, product_name, description, list_price, discount_percent, date_updated)
        VALUES
        ('', OLD.product_id, OLD.product_code, OLD.product_name, OLD.description, OLD,list_price, OLD.discount_percent, CURRENT_timestamp);
END //


-- Test with Update
UPDATE products
SET product_code = test
WHERE product_id = 2;	