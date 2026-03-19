-- Telling the script to use the olist file and making a shortcut to reference it
ATTACH 'olist.duckdb' AS olist;
-- Print all the table names in the schema, remove the semicolon if you want to see all the table names
SHOW TABLES FROM olist
