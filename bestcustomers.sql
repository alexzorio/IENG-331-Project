/*
We want to know who the best customers are within the database. First we want to add up all the spending of all the customers and then rank them based
on spending. We also want to rank customers based on the number of orders they place.
*/

-- Requires the olist.duckdb file to be in the same folder to run
ATTACH 'olist.duckdb' AS olist;
