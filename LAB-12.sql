-- 1.
CREATE VIEW customer_addresses AS
	SELECT
	c.customer_id,
    email_address,
    last_name,
    first_name,
	b.l1 AS bill_line1,
    b.l2 AS bill_line2,
    b.c AS bill_city,
    b.s AS bill_state,
    b.z AS bill_zip,
    s.l1 AS ship_line1,
    s.l2 AS ship_line2,
    s.c AS ship_city,
    s.s AS ship_state,
    s.z AS ship_zip
FROM customers c
	JOIN addresses b ON
		c.customer_id = b.customer_id
        AND c.billing_address_id = b.address_id
	JOIN addressess ON
		c.customer_id = s.customer_id
        AND c.shipping_address_id = s.address_id;
        
-- 2.
SELECT
	customer_id, last_name, first_name, bill_line1
FROM
	customer_addresses;
    
-- 3.
UPDATE customer_addresses
SET ship_line1 = "1990 Westwood Blvd."
WHERE customer_id = 8;

-- 4. 
CREATE VIEW order_item_products AS
	SELECT
		o.order_id,
        order_date,
        tax_amount,
        ship_date,
        item_price,
        discount_amount,
        (item_price - discount_amount) AS final_price,
        quantity,
        ((item_price - discount_amount) * quantity) AS item_total,
        product_name
	FROM orders
			JOIN order_items ON
				o.order_id = oi.order_id
			JOIN products p ON
				oi.product_id = p.product_id;
        
-- 5.
CREATE VIEW product_summary AS 
	SELECT
		product_name,
        SUM(order_quantity) AS order_count,
        SUN(item_total) AS order_total
	FROM order_item_products;
        
-- 6.
SELECT SUM(order_total)
FROM 
	(SELECT order_total
		FROM product_summary
        ORDER BY order_total DESC
			LIMIT 4);
FROM customers c