-- Fails if any row has a negative sales amount
SELECT 
    row_id,
    sales
FROM {{ ref('fact_orders') }}
WHERE sales < 0