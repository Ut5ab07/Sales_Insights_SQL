/* Time-Based Analysis */

/* Daily Revenue Trend */

SELECT
p.payment_date,
SUM(p.amount_paid) OVER( ORDER BY o.order_date)

FROM payments AS p
JOIN orders AS o
ON p.order_id = o.order_id;


/* Monthly Revenue */

SELECT
payment_date,
EXTRACT(MONTH FROM payment_date) AS month,
SUM (amount_paid) OVER( ORDER BY payment_date)
FROM payments
;


/* Monthly Order Count */

SELECT 
EXTRACT (MONTH FROM order_date) AS month,
COUNT(order_id) OVER()
FROM orders;


/* Best Revenue Day */

SELECT 
o.order_date, p.amount_paid,
SUM (p.amount_paid) OVER(ORDER BY p.amount_paid DESC NULLS LAST)
FROM orders AS o
JOIN payments AS p
ON o.order_id = p.payment_id
;


/* Revenue Growth */

SELECT 
	payment_date, amount_paid,
	LAG(amount_paid) OVER(ORDER BY payment_date) AS previous_day_revenue,
	amount_paid - LAG(amount_paid) OVER (ORDER BY payment_date) AS revenue_change
FROM payments;


/*--------------------------------------------------------------------------------*/


/* Customer Analysis */

/* Customer Lifetime Value */

SELECT 
c.customer_id, c.name,
COALESCE (p.amount_paid,0) AS amount_paid,
SUM(p.amount_paid) OVER (ORDER BY c.customer_id) AS total_spending
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.customer_id
JOIN payments AS p ON p.order_id = o.order_id


/* Rank Customers by Spending */

SELECT
c.customer_id, c.name,
p.amount_paid,

RANK() OVER (ORDER BY p.amount_paid DESC NULLS LAST) AS rank

FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN payments AS p ON p.order_id = o.order_id
;


/* First Order Date per Customer */

SELECT 
customer_id, name,
order_date AS first_order_date
FROM(
SELECT 
c.customer_id,c.name,o.order_date,

ROW_NUMBER() OVER( 
	PARTITION BY c.customer_id
	ORDER BY o.order_date
) AS rn

FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
)t
WHERE rn =1
;


/* Days Between Signup and First Order */  

SELECT
customer_id,
name,
order_date - signup_date AS days_to_first_purchase

FROM (
	SELECT c.customer_id,
	c.name,
	c.signup_date,
	o.order_date,
		ROW_NUMBER() OVER(
		PARTITION BY c.customer_id
		ORDER BY o.order_date
	)AS rn
	
	FROM customers AS c
	JOIN orders AS o
	ON c.customer_id = o.order_id
)t
WHERE rn=1;


/* Repeat Customers */

SELECT
c.customer_id,
c.name,
COUNT(o.order_id) OVER(PARTITION BY c.customer_id) AS total_repeatiion	
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
;




