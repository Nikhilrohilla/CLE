# Week 1 – Task 2: SQL Queries on NYC Yellow Taxi Dataset

## Project Overview

This task focuses on performing SQL operations on the **NYC Yellow Taxi January 2016 dataset** using MySQL.

The objective is to understand and practice SQL concepts such as filtering, sorting, aggregate functions, grouping, Common Table Expressions (CTEs), and joins by analyzing real-world taxi trip data.

## Tools and Technologies

- **Database:** MySQL
- **IDE:** Visual Studio Code
- **Database Client:** MySQL Workbench / SQLTools
- **Dataset:** NYC Yellow Taxi Trip Data – January 2016

## Database and Table

- Database Name: `NYC`
- Table Name: `yellow_tripdata`

The dataset contains information about taxi trips, including pickup and drop-off timestamps, trip distance, fare amount, total amount, payment type, and pickup/drop-off coordinates.

## SQL Queries Performed

### Query 1: Basic Data Exploration

**Objective:** Explore the database, inspect the table structure, view sample records, and count total records.

**Concepts Used:**
- `SHOW DATABASES`
- `USE`
- `SHOW TABLES`
- `DESCRIBE`
- `SELECT`
- `LIMIT`
- `COUNT()`

### Query 2: Find Trips with Distance Greater Than 10 Miles

**Objective:** Retrieve trips where the trip distance is greater than 10 miles.

**Concepts Used:**
- `WHERE`
- Comparison operator (`>`)
- `LIMIT`

### Query 3: Find Trips with High Fares

**Objective:** Retrieve trips with a fare amount greater than or equal to $50 and display the highest fares first.

**Concepts Used:**
- `WHERE`
- `ORDER BY`
- `DESC`
- `LIMIT`

### Query 4: Calculate Total Revenue by Payment Type

**Objective:** Analyze taxi trips based on payment type and calculate the total number of trips, total revenue, and average fare for each payment type.

**Concepts Used:**
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `ORDER BY`

### Query 5: Find Payment Types Having More Than 1,000 Trips

**Objective:** Identify payment types that have more than 1,000 trips.

**Concepts Used:**
- `GROUP BY`
- `COUNT()`
- `HAVING`
- `ORDER BY`

### Query 6: Daily Trip Analysis for January 2016

**Objective:** Calculate the number of trips, average fare, and total revenue for each pickup date in January 2016.

**Concepts Used:**
- `DATE()`
- Date filtering
- `WHERE`
- `GROUP BY`
- `COUNT()`
- `AVG()`
- `SUM()`

### Query 7: Daily Trip Analysis Using CTE

**Objective:** Use a Common Table Expression to calculate daily trip counts and identify dates with more than 100,000 trips.

**Concepts Used:**
- `WITH`
- Common Table Expression (CTE)
- `GROUP BY`
- `COUNT()`
- `HAVING` is not used; filtering is performed with `WHERE` in the outer query.

### Query 8: Find the Top 5 Revenue-Generating Days

**Objective:** Calculate daily trip counts and revenue, then identify the five days with the highest total revenue.

**Concepts Used:**
- CTE
- `SUM()`
- `COUNT()`
- `ORDER BY`
- `DESC`
- `LIMIT`

### Query 9: Join Daily Trips and Daily Revenue

**Objective:** Create two separate CTEs for daily trip counts and daily revenue, then combine them using the pickup date.

**Concepts Used:**
- Multiple CTEs
- `INNER JOIN`
- Table aliases
- `ON`
- `ORDER BY`

### Query 10: Compare Pickup and Drop-off Counts by Coordinates

**Objective:** Calculate pickup and drop-off counts using geographical coordinates, remove NULL and zero coordinate values, and compare matching locations.

**Concepts Used:**
- Multiple CTEs
- `IS NOT NULL`
- Comparison operators
- `GROUP BY`
- `INNER JOIN`
- `ORDER BY`
- `LIMIT`

## Key SQL Concepts Learned

| SQL Concept | Purpose |
|---|---|
| SELECT | Retrieve data from a table |
| WHERE | Filter records based on conditions |
| ORDER BY | Sort query results |
| LIMIT | Restrict the number of returned rows |
| COUNT() | Count records |
| SUM() | Calculate total values |
| AVG() | Calculate average values |
| GROUP BY | Group records based on columns |
| HAVING | Filter grouped results |
| CTE | Create temporary named query results |
| INNER JOIN | Combine matching records from two query results |
| DATE() | Extract the date from a datetime value |

## Learning Outcomes

After completing this task, I gained practical experience in:

- Exploring databases and understanding table structures.
- Filtering taxi trip records using different conditions.
- Analyzing revenue and trip counts using aggregate functions.
- Performing date-wise analysis on taxi trip data.
- Writing and using CTEs to organize complex SQL queries.
- Combining aggregated results using INNER JOIN.
- Analyzing pickup and drop-off locations using geographical coordinates.

## Conclusion

This task provided hands-on experience with SQL using a real-world NYC Yellow Taxi dataset. It helped strengthen my understanding of SQL querying, data aggregation, CTEs, and joins while performing practical data analysis using MySQL.