-- Telling the script to use the olist file and making a shortcut to reference it *Requires the file to be in the same folder
-- Remove comment once per running queries
ATTACH 'olist.duckdb' AS olist;

-- Print all the table names in the main schema
SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'main';
-- Show all column names, their data type, which table they belong to, and if they accept null values. duckdb has default max number of rows shown
-- as 40. If you want to change it use ".maxrows xxx"
SELECT table_name, column_name, data_type, is_nullable
    FROM information_schema.columns
    ORDER BY table_name, ordinal_position;

-- Row counts for all tables, making a new table row_counts to store all the new information

SELECT
    'customers' AS table_name,
    'row count' AS info,
    COUNT(*) AS value
FROM olist.customers;
