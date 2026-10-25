-- order_id, order_date, ship_date, ship_mode, customer_id, shipping_cost, order_priority

SELECT 
    order_id,
    MAX(order_date) AS order_date,
    MAX(ship_date) AS ship_date,
    MAX(ship_mode) AS ship_mode,
    MAX(customer_id) AS customer_id,
    SUM(shipping_cost) AS shipping_cost,
    MAX(order_priority) AS order_priority
FROM {{ ref('stg_super_store_data') }}
GROUP BY order_id