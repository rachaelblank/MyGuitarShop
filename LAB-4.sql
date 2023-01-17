/* c = customer table, p = product table, a = address table, o = orders table, i = order items table, 
cat = categories */

/* 1. Write a SELECT statement that joins the Categories table to the Products table and returns these columns: 
category_name, product_name, list_price. */
SELECT c.category_name, p.product_name, p.list_price
FROM categories c 
JOIN products p
ON c.category_id = p.category_id
/*Sort the result set by category_name and then by product_name in ascending sequence */
ORDER BY category_name, product_name;


/* 2.Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: 
first_name, last_name, line1, city, state, zip_code. */
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM customers c 
JOIN addresses a
ON c.customer_id = a.customer_id
/* Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com. */
WHERE c.email_address = 'allen.sherwood@yahoo.com';


/* 3. Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: 
first_name, last_name, line1, city, state, zip_code */
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM customers c 
JOIN addresses a
ON c.customer_id = a.customer_id
/* Return one row for each customer, but only return addresses that are the shipping address for a customer. */
AND c.shipping_address_id = a.address_id;


/*4. Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables. 
This statement should return these columns: 
last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity. */ 
/* Use aliases for the tables. */
SELECT c.last_name, c.first_name, o.order_date, p.product_name, i.item_price, i.discount_amount, i.quantity
FROM customers c 
JOIN orders o
ON c.customer_id = o.customer_id 
JOIN order_items i
ON o.order_id = i.order_id
JOIN products p
ON i.product_id = p.product_id
/* Sort the final result set by last_name, order_date, and product_name. */
ORDER BY c.last_name, o.order_date, p.product_name;


/* 5. Write a SELECT statement that returns the product_name and list_price columns from the Products table. */
/* Return one row for each product that has the same list price as another product */
SELECT p.product_id, p.product_name, p.list_price
FROM products AS p
JOIN products AS p2
ON p.product_id <> p2.product_id
AND p.list_price = p2.list_price
/* Sort the result set by product_name.  */
ORDER BY product_name;


/* 6. Write a SELECT statement that returns these two columns: 
category_name - The category_name column from the Categories table
product_id - The product_id column from the Products table */
SELECT cat.category_name, p.product_id
FROM categories cat
LEFT JOIN products p
ON cat.category_id = p.category_id
/* Return one row for each category that has never been used */
WHERE p.product_id IS NULL;


/* 7. Use the UNION operator to generate a result set consisting of three columns from the Orders table:
ship_status - A calculated column that contains a value of SHIPPED or NOT SHIPPED
order_id - The order_id
columnorder_date - The order_date column */
/* If the order has a value in the ship_date column, the ship_status column should contain a value of SHIPPED. 
Otherwise, it should contain a value of NOT SHIPPED. */
SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT 'NOT SHIPPED', order_id, order_date
FROM orders
WHERE ship_date IS NULL
/* Sort the final result set by order_date. */
ORDER BY order_date;