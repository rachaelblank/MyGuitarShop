SELECT COUNT(*) AS number_of_products 
FROM products;
/* This produces 10 for the number of products*/

SELECT last_name 
FROM customers 
ORDER BY last_name, first_name ASC;
/* This produces Brown for the first listed last name */

SELECT count(*) AS "Price Located" 
FROM order_items 
WHERE item_price > 699.99;
/* This produces 5 for where the price is located */