-- 1.
SELECT list_price,
	FORMAT (list_price, 1) AS decimal_list_price,
    CONVERT (list_price, SIGNED) AS integer_list_price,
    CAST (list_price AS SIGNED) AS integer_list_price_2
FROM products;
    
-- 2.
SELECT date_added,
	CAST (date_added AS DATE) AS date_add,
    CAST(date_added AS CHAR (7)) AS char_add,
    CAST (date_added AS TIME) AS time_add
FROM products;
