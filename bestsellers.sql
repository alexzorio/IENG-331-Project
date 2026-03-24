/*
We want to know who the best suppliers are within the database. We want to add up all the value of product supplied and then rank them based
on value. We also want to rank suppliers/sellers based on the number of orders they have filled.
*/

SELECT
    c.customer_unique_id,
    SUM(op.payment_value) AS total_spent,
    COUNT(DISTINCT o.order_id) AS total_orders,
    DENSE_RANK() OVER (ORDER BY SUM(op.payment_value) DESC) AS customer_rank
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
-- We only want to count orders that weren't canceled
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY
    c.customer_unique_id
ORDER BY
    customer_rank ASC
LIMIT 100;
