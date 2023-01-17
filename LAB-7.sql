-- 1.
SELECT category
FROM categories
WHERE category_id IN
(SELECT DISTINCT category_id
FROM products)
ORDER BY category_name;

-- 2.
SELECT product_name, list_price
FROM products
WHERE list_price > 
	(SELECT AVG(list_price)
    FROM products
    WHERE list_price > 0)
ORDER BY list_price DESC;

-- 3. 
SELECT category_name
FROM categories c 
WHERE NOT EXISTS
	(SELECT *
    FROM products p
    WHERE p.category_id = c.category_id);
    
-- 4.
SELECT c.email_address, i.order_id, SUM((i.item_price - i.discount_amount) * i.quantity) AS order_total
FROM order_items i
	JOIN orders o 
    ON i.order_id = o.order_id
    JOIN customer c 
    ON o.customer_id = c.customer_id
GROUP BY c.email_address, i.order_id;

SELECT email_address, MAX(item_total) AS largest_order
FROM 
	(SELECT c.email_address, i.order_id, SUM((i.item_price - i.discount_amount) * i.quantity) AS order_total
	FROM order_items i 
		JOIN orders o
        ON i.order_id = o.order_id
        JOIN customers c
        ON o.customer_id = c.customer_id
		GROUP BY c.email_address, i.order_id)
        AS email_orders
GROUP BY email_address;

-- 5. 
SELECT p1.product_name, p1.discount_percent
FROM products p1
WHERE NOT EXISTS
	(SELECT * 
    FROM products p2
    WHERE p2.discount_percent = p1.discount_percent
    AND p2.product_name != p1.product_name)
ORDER BY product_name;

-- 6. 
SELECT c.email_address, id.order_id, ord.oldest_order
FROM customer c
	JOIN 
	(SELECT o.customer_id, min(o.order_date) AS ldest_order
    FROM orders o
    GROUP BY o.customer_id) AS ord
    ON c.customer_ID = ord.customer_id
    JOIN orders id
    ON ord.oldest_order = id.order_date