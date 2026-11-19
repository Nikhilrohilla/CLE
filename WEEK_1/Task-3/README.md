# Week 1 – Task 3: SQL Window Functions

## Project Overview

This task focuses on understanding and implementing **SQL Window Functions** using the NYC Yellow Taxi January 2016 dataset in MySQL.

Window functions perform calculations across a set of related rows without combining them into a single row, unlike regular aggregate functions with `GROUP BY`.

The objective is to analyze taxi fares, calculate cumulative revenue, and identify the highest-fare trips for each payment type.

## Tools and Technologies

- **Database:** MySQL
- **IDE:** Visual Studio Code
- **Database Client:** MySQL Workbench / SQLTools
- **Dataset:** NYC Yellow Taxi Trip Data – January 2016

## Database and Table

- Database Name: `NYC`
- Table Name: `yellow_tripdata`

## SQL Queries Performed

### Query 1: Rank Trips by Fare Amount

**Objective:** Rank taxi trips based on their fare amount in descending order and display the top 20 trips with positive fares.

**Concepts Used:**
- `RANK()` Window Function
- `OVER()` Clause
- `ORDER BY`
- `WHERE`
- `LIMIT`

**Learning:** The `RANK()` function assigns a ranking to each trip based on its fare amount. Trips with the same fare receive the same rank, and the next rank may be skipped.

### Query 2: Calculate Running Total of Taxi Revenue

**Objective:** Calculate daily taxi revenue and then calculate the cumulative revenue over time, ordered by pickup date.

**Concepts Used:**
- Common Table Expression (CTE)
- `WITH`
- `DATE()`
- `SUM()`
- `OVER()`
- `ORDER BY`
- `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`

**Learning:** The query first calculates total revenue for each day. The windowed `SUM()` then adds each day's revenue to the revenue from all previous days to produce a running total.

### Query 3: Find the Top 3 Highest-Fare Trips per Payment Type

**Objective:** Identify the three highest-fare trips for each payment type.

**Concepts Used:**
- Common Table Expression (CTE)
- `ROW_NUMBER()` Window Function
- `PARTITION BY`
- `ORDER BY`
- `WHERE`
- `IS NOT NULL`

**Learning:** `PARTITION BY payment_type` divides the records into separate groups for each payment type. `ROW_NUMBER()` assigns a unique rank within each group based on fare amount and total amount. The outer query selects only the first three trips from each group.

## Key SQL Window Functions Learned

| Function / Clause | Purpose |
|---|---|
| `RANK()` | Assigns ranks to rows, allowing ties |
| `ROW_NUMBER()` | Assigns a unique sequential number to each row |
| `SUM() OVER()` | Calculates a sum across a window of rows |
| `OVER()` | Defines the window used for a calculation |
| `PARTITION BY` | Divides rows into separate groups |
| `ORDER BY` | Defines the order of rows within a window |
| `ROWS BETWEEN` | Defines the range of rows included in a window calculation |

## Learning Outcomes

After completing this task, I gained practical experience in:

- Understanding SQL Window Functions.
- Ranking taxi trips based on fare amount.
- Calculating cumulative revenue using a running total.
- Using CTEs to simplify complex SQL queries.
- Applying `PARTITION BY` to perform calculations separately for each payment type.
- Understanding the difference between `RANK()` and `ROW_NUMBER()`.
- Performing Top-N analysis within groups.

## Conclusion

This task provided hands-on experience with SQL Window Functions using the NYC Yellow Taxi dataset. It strengthened my understanding of ranking, cumulative calculations, partitioning, and analytical SQL queries, which are important concepts in data analysis and data engineering.