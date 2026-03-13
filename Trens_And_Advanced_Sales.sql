/* Time-Based Analysis */

/* Daily Revenue Trend */
/*
SELECT
p.payment_date,
SUM(p.amount_paid) OVER( ORDER BY o.order_date)

FROM payments AS p
JOIN orders AS o
ON p.order_id = o.order_id;
*/

/* Monthly Revenue */
/*
SELECT
payment_date,
EXTRACT(MONTH FROM payment_date) AS month,
SUM (amount_paid) OVER( ORDER BY payment_date)
FROM payments
;
*/

/* Monthly Order Count */
/*
SELECT 
EXTRACT (MONTH FROM order_date) AS month,
COUNT(order_id) OVER()
FROM orders;
*/

/* Best Revenue Day */
/*
SELECT 
o.order_date, p.amount_paid,
SUM (p.amount_paid) OVER(ORDER BY p.amount_paid DESC NULLS LAST)
FROM orders AS o
JOIN payments AS p
ON o.order_id = p.payment_id
;
*/

/* Revenue Growth */
/*
SELECT 
	payment_date, amount_paid,
	LAG(amount_paid) OVER(ORDER BY payment_date) AS previous_day_revenue,
	amount_paid - LAG(amount_paid) OVER (ORDER BY payment_date) AS revenue_change
FROM payments;
*/


