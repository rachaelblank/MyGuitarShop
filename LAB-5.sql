-- 1. 
INSERT INTO categories
	(category_id, category_name)
VALUES
	(DEFAULT, 'Brass');
    
-- .2
UPDATE categories
SET category_name = 'Woodwinds'
WHERE category_id = (SELECT category_id FROM categories WHERE category_name = 'Brass');

-- 3.
DELETE FROM categories
WHERE category_id = (SELECT category_id FROM categories WHERE category_name = 'Woodwind');

-- 4.
INSERT INTO products
	(product_id, 
    category_id, 
    product_code, 
    product_name, 
    description, 
    list_price, 
    discount_percent, 
    date_added)
VALUES
	(DEFAULT, 
    4, 
    'dgx_640', 
    'Yamaha DGX 640 88-key Digital Piano', 
    'Long description to come', 
    799.99, 
    0, 
    NOW());
    
-- 5. 
UPDATE products
SET discount_percent = 35
WHERE product_id = (SELECT product_id FROM products WHERE discount_percent = 0);

-- 6. 
DELETE FROM products
WHERE category_id = 4;

-- 7.
INSERT INTO customers
	(email_address,
    password,
    first_name,
    last_name)
VALUES
	('rick@raven.com',
    "",
    'Rick',
    'Raven');
    
-- 8.
UPDATE customers
SET password = 'secret'
WHERE email_address = 'rick@raven.com';

-- 9.
UPDATE customers
SET password = 'reset'
LIMIT 100;

-- 10. 