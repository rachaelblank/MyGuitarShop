/* 1. Write a SELECT statement that returns four columns from the Products table: product_code, product_name, 
list_price, and discount_percent. Then, run this statement to make sure it works correctly. */
SELECT product_code, product_name, list_price, discount_percent
FROM products
/* Add an ORDER BY clause to this statement that sorts the result set by list price in descending sequence. */
ORDER BY list_price DESC;


/* 2. Write a SELECT statement that returns one column from the Customers table named full_name
that joins the last_name and first_name columns.
Format this column with the last name, a comma, a space, and the first name */
SELECT CONCAT(last_name, ',' , first_name) AS full_name
FROM customers
/*Sort the result set by last name in ascending sequence. */
/*Return only the customers whose last name begins with letters from M to Z. */
WHERE last_name >= "M"
ORDER BY last_name ASC;
/* WHERE needs to go before ORDER BY */

/* 3. Write a SELECT statement that returns these columns from the Products table: product_name, list_price, date_added */
SELECT product_name, list_price, date_added
FROM products
/* Return only the rows with a list price that’s greater than 500 and less than 2000 */
WHERE list_price > 500 AND list_price < 2000
/* Sort the result set in descending sequence by the date_added column. */
ORDER BY date_added DESC; 


/* 4. Write a SELECT statement that returns these columns from the Products table: product_name, list_price,
discount_percent, discount_amount, discount_price.
Round the discount_amount and discount_price columns to 2 decimal places.*/
SELECT product_name, list_price, discount_percent, ROUND(list_price*discount_percent/100, 2) AS 'discount_amount',
list_price-'discount_amount' AS 'discount_price'
FROM products
/* Sort the result set by discount price in descending sequence. */
ORDER BY discount_price DESC
/* Use the LIMIT clause so the result set contains only the first 5 rows.  */
LIMIT 5;


/* 5. Write a SELECT statement that returns these column names and data from the Order_Items table: 
item_id, item_price, discount_amount, quantity, price_total, discount_total, item_total */
SELECT  item_id, item_price, discount_amount, quantity, quantity*item_price AS price_total, 
discount_amount*quantity AS discount_total, (item_price-discount_amount)*quantity AS item_total
FROM order_items
/* Only return rows where the item_total is greater than 500. */
WHERE  (item_price-discount_amount)*quantity > 500
/* Sort the result set by item total in descending sequence */
ORDER BY item_total DESC;


/* 6. Write a SELECT statement that returns these columns from the Orders table:  
order_id, order_date, ship_date */
SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date IS null;

/* 7. Write a SELECT statement without a FROM clause that uses the NOW function to create a row with these columns:
today_unformatted, today_formatted. 
The today_unformatted column should show the results of the NOW function with out any formatting.
The today_formatted column should show the results of the NOW function in the format DD-Mon-YYYY.  
DD for the day number, Mon for an abbreviated month, YYYY for a four digit year */
SELECT NOW() AS 'today_unformatted', DATE_FORMAT(NOW(), '%d-%b-%Y') AS 'today_formatted';

/* 8. Write a SELECT statement without a FROM clause that creates a row with these columns and (values): 
price (100), tax_rate (.07), tax_amount (The price column multiplied by the tax_rate column), 
total (The price plus the tax_amount) */
SELECT 100 AS price, .07 AS tax_rate, 100*.07 AS tax_amount, 100+ (100*.07) AS total; 