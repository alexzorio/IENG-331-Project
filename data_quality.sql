-- Telling the script to use the olist file and making a shortcut to reference it *Requires the file to be in the same folder
-- Remove comment once per running queries
ATTACH 'olist.duckdb' AS olist;

-- Print all the table names in the main schema
SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'main'
        AND table_name NOT IN ('current_notebook_id','has_onboarded','notebook_versions','notebooks')
    ORDER BY table_name;
-- Show all column names, their data type, which table they belong to, and if they accept null values. duckdb has default max number of rows shown
-- as 40. If you want to change it use ".maxrows xxx"
SELECT table_name, column_name, data_type, is_nullable
    FROM information_schema.columns
    ORDER BY table_name, ordinal_position;

-- Row counts for all tables, making a new table row_counts to store all the new information. Going through each table one by one and linking the counts together in a new table
SELECT
    'category translation' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.category_translation
UNION ALL
SELECT
    'customers' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.customers
UNION ALL
SELECT
    'geolocation' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.geolocation
UNION ALL
SELECT
    'order items' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.order_items
UNION ALL
SELECT
    'order payments' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.order_payments
UNION ALL
SELECT
    'order reviews' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.order_reviews
UNION ALL
SELECT
    'orders' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.orders
UNION ALL
SELECT
    'products' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.products
UNION ALL
SELECT
    'sellers' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.sellers
ORDER BY table_name;
