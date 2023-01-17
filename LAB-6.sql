-- 1. 
SELECT 
	COUNT(order_id), 
    SUM(tax_amount)
FROM orders;

-- 2.
SELECT cat.category_name,
	COUNT(*) AS product_count,
    MAX(p.list_price) AS most_expensive
FROM categories AS cat 
	JOIN products p
    ON cat.category_id = p.category_id
    GROUP BY cat.category_name
    ORDER BY most_expensive DESC;
    
-- 3. 
SELECT email_address, 
	SUM(item_price) * COUNT(item_id) AS price_sum,
    SUM(discount_amount) * COUNT(item_id) AS discount_sum
FROM customer c
JOIN orders ord ON c.customer_id = ord.custer_id
JOIN order_items AS o ON ord.order_id = ord.order_id
GROUP BY email_address
ORDER BY SUM(price_sum) DESC;

-- .4
SELECT 
	email_address,
    COUNT(order_id) AS count,
    SUM(item_price - discount_amount) * COUNT(order_id) AS total_amount
FROM customers c
JOIN orders ord ON c.customer_id = ord.customer_id
JOIN order_items o ON ord.order_id = o.order_id
GROUP BY email_address
HAVING COUNT(ord.order_ID) > 1
ORDER BY total_amount DESC;

-- 5. 
SELECT
	email_address,
    COUNT(order_id) AS count,
    SUM(item_price - discount_amount) * COUNT(order_id) AS total_amount
FROM customers c
JOIN orders ord ON c.customer_id = ord.customer_id
JOIN order_items o ON ord.order_id = o.order_id
WHERE item_price > 400
GROUP BY email_address
HAVING COUNT(ord.order_ID) > 1
ORDER BY total_amount DESC;

-- 6. 
SELECT 
	product_name,
    SUM(item_price - discount_amount) * COUNT(order_id) AS total_amount
FROM products p
JOIN order_items o ON p.product_id = o.product_id
GROUP BY product_name WITH ROLLUP;

-- 7.
SELECT 
	email_address,
    COUNT(DISTINCT o.product_id) AS number_of_products
FROM customers c
JOIN orders ord ON c.customer_id = ord.customer_id
JOIN order_items o ON ord.order_id = o.order_id
GROUP BY email_address
HAVING COUNT(DISTINCT o.product_id) > 1
ORDER BY email_address;