# Milestone 1 Grade

| Criterion | Score | Max |
|-----------|------:|----:|
| Data Quality Audit | 3 | 3 |
| Query Depth & Correctness | 2 | 3 |
| Business Reasoning & README | 3 | 3 |
| Git Practices | 3 | 3 |
| Code Walkthrough | 3 | 3 |
| **Total** | **14** | **15** |

## Data Quality Audit (3/3)
Thorough and systematic audit in `data_quality.sql`. Covers: schema introspection (table list, column metadata), row counts for all 9 tables via UNION ALL, null checks for all primary and foreign keys, orphaned FK detection for every FK relationship in the schema, null counts for all 5 date columns in the orders table, duplicate row detection across the 4 order-related tables, and a date range summary. The audit is well-commented with clear explanations of methodology. The student correctly identified null delivery dates as the main data issue.

## Query Depth & Correctness (2/3)
All 4 analysis files execute without errors against the database.

- **ABC.sql**: Runs cleanly. 2 CTEs (`ProductRevenue`, `RunningTotals`). Uses window functions (`SUM() OVER` for cumulative and grand total), `CASE/WHEN` for tiering. Solid implementation of ABC/Pareto classification.
- **bestcustomers.sql**: Runs cleanly. 0 CTEs (single SELECT). Uses `DENSE_RANK()` window function, 3-table join, `WHERE` filter on order status. Correct use of `customer_unique_id`. Functional but shallow structure.
- **bestsellers.sql**: Runs cleanly. 0 CTEs (single SELECT). Uses two `DENSE_RANK()` window functions in one query (dual ranking by value and volume is a nice touch), 3-table join. Good reasoning around the two ranking dimensions.
- **DeliveryTime.sql**: Runs cleanly. 0 CTEs (single SELECT). Uses `date_diff`, `ROUND`, conditional `COUNT` for late percentage, 4-table join, `HAVING` clause for statistical significance. Practical and well-constructed.

The analysis queries are all well-reasoned and correct, but only `ABC.sql` uses CTEs (2), and none reach the 3-CTE threshold. `bestcustomers.sql` and `bestsellers.sql` in particular would have benefited from CTE structure to show intermediate steps.

## Business Reasoning & README (3/3)
The README provides a clear narrative for each file with specific actionable business questions and actual findings with numbers (e.g., top customer spent $13,664.08; top seller by value supplied $226,987.92 worth of product and ranked 9th by volume). The student explains the rationale behind query design choices (e.g., using `customer_unique_id` over `customer_id`, the dual-ranking approach for sellers, the HAVING threshold for statistical significance). Limitations are acknowledged for both the data audit (selective column coverage) and the ABC analysis (tiers don't capture unit counts or cost). The explanation for the negative delivery time values shows genuine analytical thinking.

## Git Practices (3/3)
31 commits with detailed, descriptive messages showing clear incremental progression — from initial schema exploration through each feature of the data quality audit, then into each analysis query, with separate polish/comment commits and README iterations. Exemplary commit hygiene.
