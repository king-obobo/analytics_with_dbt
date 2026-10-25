SELECT 
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(shipping_cost), 2) AS avg_shipping_cost,
    ROUND(SUM(shipping_cost), 2) AS total_shipping_cost
FROM {{ ref('rpt_clean_table') }}
GROUP BY ship_mode
ORDER BY total_orders DESC