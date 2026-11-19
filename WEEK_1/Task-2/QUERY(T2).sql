SHOW DATABASES;

USE NYC;

SHOW TABLES;
 -- Query 1: Basic Data Exploration
DESCRIBE NYC.yellow_tripdata;
SELECT *
FROM yellow_tripdata
LIMIT 10;
SELECT COUNT(*) AS total_records
FROM yellow_tripdata;

--Query 2: Find Trips with Distance Greater Than 10 Miles

SELECT  trip_distance,fare_amount, total_amount 
FROM yellow_tripdata
WHERE trip_distance > 10
LIMIT 100;

-- Query 3: Find trips with high fares

SELECT *
FROM yellow_tripdata
WHERE fare_amount >= 50
ORDER BY fare_amount DESC
LIMIT 20;

-- Query 4: Calculate total revenue by payment type

SELECT
    payment_type,
    COUNT(*) AS total_trips,
    SUM(total_amount) AS total_revenue,
    AVG(fare_amount) AS average_fare
FROM yellow_tripdata
GROUP BY payment_type
ORDER BY total_revenue DESC;

-- Query 5: Find payment types having more than 1000 trips

SELECT
    payment_type,
    COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY payment_type
HAVING COUNT(*) > 1000
ORDER BY total_trips DESC;

-- Query 6: Daily trip analysis for January 2016

SELECT
    DATE(tpep_pickup_datetime) AS pickup_date,
    COUNT(*) AS total_trips,
    AVG(fare_amount) AS average_fare,
    SUM(total_amount) AS total_revenue

FROM yellow_tripdata

WHERE tpep_pickup_datetime >= '2016-01-01'
  AND tpep_pickup_datetime < '2016-02-01'

GROUP BY DATE(tpep_pickup_datetime)

ORDER BY pickup_date;

-- Query 7: Daily trip analysis using CTE

WITH daily_trips AS
(
    SELECT
        DATE(tpep_pickup_datetime) AS pickup_date,
        COUNT(*) AS total_trips
    FROM yellow_tripdata
    GROUP BY DATE(tpep_pickup_datetime)
)

SELECT
    pickup_date,
    total_trips
FROM daily_trips
WHERE total_trips > 100000
ORDER BY total_trips DESC;

-- Query 8: Top 5 revenue-generating days

WITH daily_revenue AS
(
    SELECT
        DATE(tpep_pickup_datetime) AS pickup_date,
        COUNT(*) AS total_trips,
        SUM(total_amount) AS total_revenue
    FROM yellow_tripdata
    GROUP BY DATE(tpep_pickup_datetime)
)

SELECT
    pickup_date,
    total_trips,
    total_revenue
FROM daily_revenue
ORDER BY total_revenue DESC
LIMIT 5;

-- Query 9: Join daily trips and daily revenue

WITH daily_trips AS
(
    SELECT
        DATE(tpep_pickup_datetime) AS pickup_date,
        COUNT(*) AS total_trips
    FROM yellow_tripdata
    GROUP BY DATE(tpep_pickup_datetime)
),

daily_revenue AS
(
    SELECT
        DATE(tpep_pickup_datetime) AS pickup_date,
        SUM(total_amount) AS total_revenue
    FROM yellow_tripdata
    GROUP BY DATE(tpep_pickup_datetime)
)

SELECT
    t.pickup_date,
    t.total_trips,
    r.total_revenue

FROM daily_trips t

INNER JOIN daily_revenue r
    ON t.pickup_date = r.pickup_date

ORDER BY r.total_revenue DESC;

-- Query 10: Compare pickup and dropoff counts by coordinates

WITH pickup_counts AS
(
    SELECT
        pickup_longitude,
        pickup_latitude,
        COUNT(*) AS total_pickups
    FROM yellow_tripdata
    WHERE pickup_longitude IS NOT NULL
      AND pickup_latitude IS NOT NULL
      AND pickup_longitude <> 0
      AND pickup_latitude <> 0
    GROUP BY pickup_longitude, pickup_latitude
),

dropoff_counts AS
(
    SELECT
        dropoff_longitude,
        dropoff_latitude,
        COUNT(*) AS total_dropoffs
    FROM yellow_tripdata
    WHERE dropoff_longitude IS NOT NULL
      AND dropoff_latitude IS NOT NULL
      AND dropoff_longitude <> 0
      AND dropoff_latitude <> 0
    GROUP BY dropoff_longitude, dropoff_latitude
)

SELECT
    p.pickup_longitude,
    p.pickup_latitude,
    p.total_pickups,
    d.total_dropoffs

FROM pickup_counts p

INNER JOIN dropoff_counts d
    ON p.pickup_longitude = d.dropoff_longitude
   AND p.pickup_latitude = d.dropoff_latitude

ORDER BY p.total_pickups DESC
LIMIT 10;

