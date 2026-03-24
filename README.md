# IENG-331-Project
IENG 331 Project Part 1:
First in order to run any of these files we have it set up locally to require the olist.duckdb file has to be in the same folder as all the .sql files in our project.

We have 5 main files for the part of the project. data_quality.sql is the requested data audit that covers row counts, null counts for key columns, checks for orphaned foreign keys, date range, duplicate detection for columns that duplicated rows would impact, and null counts for missing dates.

Then we have the individual query files.

bestcustomers.sql ranks the customers in the database based on the amount they have spent. We made sure to rank by unique_customer_id as the regular customer_id is non-specific and used for a one time transaction in the database to reference specific orders.

bestsellers.sql ranks the sellers/suppliers based on the value of product they have supplied as well as the number of orders they have filled.

ABC.sql is one of the suggested queries that classifies inventory into A/B/C tiers using the pareto principle. I chose this query to undertand which products are the money makers for the company and therefore require more attention. We made sure to take into acount the percenteage of total revenue that was taken up by each product. The revenue of each product was added together then divided by the grand total to find the percentage. Once that was done the products that made up 80% of the revenue was given the A tier, the next 15% was the B tier and the rest were put into C. The only limitation is the fact that you are only seeing 3 different sections of data and the tiers do not show how many of each product is sold or how much it cost just what perecentage they make up.

DeliveryTime.sql was used in order to compare the actual vs estimated by the region. This was investigated to undersand which areas delivery routes would need to be looked at in order to improve efficiency or conversely to give the customers a more realistic and accurate delivery time. This was done by rounding the difference beteween the estimaed and acutal delivery time for each region. These times were addded together to find a final average difference between the two values. The percentage of late orders was also found for each region. Once all the necessary tables were joined together the date was sorted to show the most delayed (positive numebers) to most early(negative numbers) for the deliveries. There were not any positive values even though some of the routes had over 50% of the products delivered late, those that were late were not as late as those that were early so that is likely why the numbers are all negative.
