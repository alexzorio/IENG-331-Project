/*
This part will sort the data into ABC inventory clasification. This will be based on the parteo principle

*/
ATTACH 'olist.duckdb' AS olist;
WITH ProductRevenue AS (
    -- Step 1: Calculate total revenue per product
    SELECT
        product_id,
        SUM(price) as total_revenue
    FROM olist.order_items
    GROUP BY 1
),
RunningTotals AS (
    -- Step 2: Use a window function to get cumulative revenue
    SELECT
        product_id,
        total_revenue,
        SUM(total_revenue) OVER (ORDER BY total_revenue DESC) as cumulative_revenue,
        SUM(total_revenue) OVER () as grand_total
    FROM ProductRevenue
)
-- Step 3: Assign the Tiers
SELECT
    product_id,
    total_revenue,
    (cumulative_revenue / grand_total) * 100 as pct_of_total,
    CASE
        WHEN (cumulative_revenue / grand_total) <= 0.80 THEN 'A'
        WHEN (cumulative_revenue / grand_total) <= 0.95 THEN 'B'
        ELSE 'C'
    END as abc_tier
FROM RunningTotals
ORDER BY total_revenue DESC;
