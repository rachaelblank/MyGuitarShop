-- 1.
SELECT 
	list_price,
	discount_percent,
    ROUND (list_price * discound_percent / 100, 2) AS discount_amount
FROM products;

-- 2. 
SELECT
	order_date,
	DATE_FORMAT (order_date, '%Y') AS year_format,
    DATE_FORMAT (order_date, '%b-%e-%Y') AS abbreviated_month_format,
    DATE_FORMAT (order_date, '%1-%i-%p') AS hours_minutes_format,
	DATE_FORMAT (order_date, '%m/%e/%y %H%i') AS date_time_format
FROM orders;

-- 3. 
SELECT
	card_number,
    LENGTH (card_number) AS card_length,
    RIGHT (card_number, 4) AS last_four,
    INSERT (RIGHT (card_number, 4), 1, 0, 'XXXX-XXXX-XXXX-') AS x_format
FROM orders;

-- 4.
SELECT
	order_id,
    order_date,
    DATE_ADD (order_date, INTERVAL 2 DAY) AS approx_ship_date,
    ship_date,
	DATEDIFF (ship_date, order_date) AS days_to_ship
FROM orders,
WHERE
	YEAR(order_date) = 2012 AND MONTH(order_date) = 5;