/*
This part will compare the actual vs predicted delivery time for products accross different regions to identify and
problem areas where orders are taking too long all the time
The presence of

*/

ATTACH 'olist.duckdb' AS olist;
SELECT
    s.seller_state AS origin,
    c.customer_state AS destination,
    -- Positive = Late, Negative = Early
    ROUND(AVG(date_diff('day', o.order_estimated_delivery_date, o.order_delivered_customer_date)), 1) AS avg_days_late,
    -- Percentage of orders on this route that missed the deadline
    ROUND(
        (COUNT(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 END) * 100.0) / COUNT(*),
        1
    ) AS late_percent,
    COUNT(*) AS total_orders
FROM olist.orders o
JOIN olist.customers c ON o.customer_id = c.customer_id
JOIN olist.order_items oi ON o.order_id = oi.order_id
JOIN olist.sellers s ON oi.seller_id = s.seller_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY 1, 2
HAVING total_orders > 20 -- Keeps the data statistically significant
ORDER BY avg_days_late DESC; -- Puts positive (late) numbers at the top
