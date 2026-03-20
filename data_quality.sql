-- Telling the script to use the olist file and making a shortcut to reference it !! Requires the database file to be in the same folder !!
ATTACH 'olist.duckdb' AS olist;

-- Print all the table names in the main schema
SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'main'
        AND table_name NOT IN ('current_notebook_id','has_onboarded','notebook_versions','notebooks')
    ORDER BY table_name;
/*
Show all column names, their data type, which table they belong to, and if they accept null values.
*/
SELECT table_name, column_name, data_type, is_nullable
    FROM information_schema.columns
    WHERE table_name NOT IN ('current_notebook_id','has_onboarded','notebook_versions','notebooks')
    ORDER BY table_name, ordinal_position;

/*
Row counts for all tables, making a new table row_counts to store all the new information.
Going through each table one by one and linking the counts together in a new table.
*/
SELECT
    'category translation' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.category_translation
UNION ALL
SELECT
    'customers',
    'row count',
    COUNT(*)
FROM olist.customers
UNION ALL
SELECT
    'geolocation',
    'row count',
    COUNT(*)
FROM olist.geolocation
UNION ALL
SELECT
    'order items',
    'row count',
    COUNT(*)
FROM olist.order_items
UNION ALL
SELECT
    'order payments',
    'row count',
    COUNT(*)
FROM olist.order_payments
UNION ALL
SELECT
    'order reviews',
    'row count',
    COUNT(*)
FROM olist.order_reviews
UNION ALL
SELECT
    'orders',
    'row count',
    COUNT(*)
FROM olist.orders
UNION ALL
SELECT
    'products',
    'row count',
    COUNT(*)
FROM olist.products
UNION ALL
SELECT
    'sellers',
    'row count',
    COUNT(*)
FROM olist.sellers
ORDER BY table_name;
/*
Finished all the row counts, now moving onto null rates for columns. Directions say key columns,
I think the key columns when looking at null values are going to be customers, sellers, products, orders, and category translation.
The other columns are descriptive elements of each order, very important but data that does not make other data or references invalid.
*/
