-- customer_id, customer_name, segment, city, state, country, postal_code, market, region

WITH source AS (
    SELECT * FROM {{ ref('stg_super_store_data') }}
),

ranked_customers AS (
    SELECT 
        customer_id,
        customer_name,
        segment,
        city,
        state,
        country,
        postal_code,
        market_region,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date DESC
        ) as rn
    FROM source
)

SELECT 
    customer_id,
    customer_name,
    segment,
    city,
    state,
    country,
    postal_code,
    market_region
FROM ranked_customers
WHERE rn = 1