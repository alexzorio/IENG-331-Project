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
UNION ALL
/*
Finished all the row counts, now moving onto null rates for key columns.
I am considering key columns to be ones that link information between tables. Columns that appear in multiple tables
That is why I am choosing cusomter_id, order_id, product_id, and seller_id
These are also the keys which if they are null or orphaned is a problem
These keys appear multiple times and I am going to document how many times they appear as null and in which table they were null
The structure of the table is going to be table name, the table we are looking in, info, which key it is and if it is primary (PK) or
foreign (FK) to the table we are looking in, and the number of nulls found in that column for value.
*/
SELECT
    'customers' AS table_name,
    'Null PK: customer_id' AS metric,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END)
FROM olist.customers;

SELECT * FROM olist.customers WHERE customer_id IS NULL;
