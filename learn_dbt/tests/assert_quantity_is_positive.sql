-- Fails if any row has a quantity less than or equal to 0
SELECT 
    row_id,
    quantity
FROM {{ ref('fact_orders') }}
WHERE quantity <= 0