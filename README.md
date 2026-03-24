# IENG-331-Project
IENG 331 Project Part 1:
First in order to run any of these files we have it set up locally to require the olist.duckdb file has to be in the same folder as all the .sql files in our project.

We have 5 main files for the part of the project. data_quality.sql is the requested data audit that covers row counts, null counts for key columns, checks for orphaned foreign keys, date range, duplicate detection for columns that duplicated rows would impact, and null counts for missing dates.

Then we have the individual query files.

bestcustomers.sql ranks the customers in the database based on the amount they have spent. We made sure to rank by unique_customer_id as the regular customer_id is non-specific and used for a one time transaction in the database to reference specific orders.

bestsellers.sql ranks the sellers/suppliers based on the value of product they have supplied as well as the number of orders they have filled.

ABC.sql is one of the suggested queries that classifies inventory into A/B/C tiers using the pareto principle.

DeliveryTime.sql
