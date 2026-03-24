# IENG-331-Project
IENG 331 Project Part 1:
First in order to run any of these files we have it set up locally to require the olist.duckdb file has to be in the same folder as all the .sql files in our project.

We have 5 main files for the part of the project. data_quality.sql is the requested data audit that covers row counts, null counts for key columns, checks for orphaned foreign keys, date range, duplicate detection for columns that duplicated rows would impact, and null counts for missing dates. The only significant issue we found was a number of null dates in the orders table. Some limitations in our data audit come from the selective choices in looking at columns. We did not audit everything for every column in the database, something we could do in the future. However for the time being we feel our audit covered all the major sections and shows a fairly healthy database with some issues with date entries in the orders table.

Then we have the individual query files.

bestcustomers.sql ranks the customers in the database based on the amount they have spent. We made sure to rank by unique_customer_id as the regular customer_id is non-specific and used for a one time transaction in the database to reference specific orders. The highest ranked customer had a total spent of 13664.08 in what we are assuming is dollars.

bestsellers.sql ranks the sellers/suppliers based on the value of product they have supplied as well as the number of orders they have filled. When ranking sellers by product value the top seller supplied 226987.92 worth of product, again assuming dollars. This seller was ranked 9th by volume filling 1124 orders. The top seller ranked by volume filled 1819 orders and supplied $120702.83 worth of product leading them to be ranked 12th by value.

ABC.sql is one of the suggested queries that classifies inventory into A/B/C tiers using the pareto principle.

DeliveryTime.sql
