/* Revenue & Order Analysis */

/* Total Revenue */
/*
SELECT
SUM(amount_paid) AS total_revenue
FROM payments;
*/

/* Total Number of Orders */
/*
SELECT
COUNT(order_id) AS total_orders
FROM order_items;
*/

/* Average Order Value */
/*
SELECT 
o.order_id, ROUND(AVG(p.amount_paid),2) AS average_order_value
FROM orders AS o
JOIN payments AS p
ON o.order_id = p.order_id
GROUP BY (o.order_id);
*/

/* Revenue By City */
/*
SELECT 
c.city, SUM(p.amount_paid)
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN payments AS p ON o.order_id = p.order_id
GROUP BY (c.city);
*/

/* Revenue By Product Category */
/*
SELECT
pr.category, SUM(p.amount_paid)
FROM products AS pr
JOIN order_items AS o ON pr.product_id = o.product_id
JOIN payments AS p ON p.order_id = o.order_id

GROUP BY (pr.category);
*/

/* Top 3 Customers by Spending */
/*
SELECT 
c.customer_id, c.name, p.amount_paid
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN payments AS p ON o.order_id = p.order_id
ORDER BY p.amount_paid DESC NULLS LAST
LIMIT 3;
*/

/* Orders by Payment Method */
/*
SELECT 
COUNT(o.order_id), COALESCE (o.payment_method,'Unkown') AS payment_method
FROM orders AS o
GROUP BY  o.payment_method
ORDER BY COUNT(o.order_id) DESC NULLS LAST;
*/


/* Cancelled Order Percentage */
/*
SELECT
	ROUND(
		(SUM (CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END)
		*100.0)
		/ COUNT(*),
		2) AS cancelled_percentage
FROM orders 
*/

/* Customers With No Orders */
/*
SELECT
customer_id, name
FROM customers
WHERE customer_id NOT IN
(SELECT customer_id FROM orders);
*/


/* Most Sold Product */
/*
SELECT 
o.product_id, p.product_name, SUM(o.quantity) AS total_product_sold
FROM order_items AS o
JOIN products AS p
ON o.product_id = p.product_id
GROUP BY p.product_id, o.product_id
ORDER BY  SUM(quantity) DESC NULLS LAST
;
*/




