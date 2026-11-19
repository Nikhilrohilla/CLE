-- Query 1: Rank trips by fare amount

SELECT
    payment_type,
    fare_amount,
    total_amount,

    RANK() OVER (
        ORDER BY fare_amount DESC
    ) AS fare_rank

FROM yellow_tripdata

WHERE fare_amount > 0

ORDER BY fare_rank

LIMIT 20;

-- Query 2: Calculate running total of taxi revenue

WITH daily_revenue AS
(
    SELECT
        DATE(tpep_pickup_datetime) AS pickup_date,
        SUM(total_amount) AS daily_revenue
    FROM yellow_tripdata
    GROUP BY DATE(tpep_pickup_datetime)
)

SELECT
    pickup_date,
    daily_revenue,

    SUM(daily_revenue) OVER (
        ORDER BY pickup_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total_revenue

FROM daily_revenue

ORDER BY pickup_date;


-- Query 3: Top 3 highest-fare trips per payment type

WITH ranked_trips AS
(
    SELECT
        payment_type,
        fare_amount,
        total_amount,
        trip_distance,

        ROW_NUMBER() OVER (
            PARTITION BY payment_type
            ORDER BY fare_amount DESC, total_amount DESC
        ) AS trip_rank

    FROM yellow_tripdata

    WHERE fare_amount > 0
      AND payment_type IS NOT NULL
)

SELECT
    payment_type,
    fare_amount,
    total_amount,
    trip_distance,
    trip_rank

FROM ranked_trips

WHERE trip_rank <= 3

ORDER BY payment_type, trip_rank;