SELECT 
    o.order_id,
    o.order_date,
    o.ship_mode,
    o.ship_date,
    o.shipping_cost,
    c.customer_id,
    c.customer_name,
    c.segment,
    c.city,
    c.state,
    c.region,
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    f.sales,
    f.quantity,
    f.discount,
    f.profit
FROM {{ ref('fact_orders') }} f
LEFT JOIN {{ ref('dim_orders') }} o ON f.order_id = o.order_id
LEFT JOIN {{ ref('dim_customers') }} c ON o.customer_id = c.customer_id
LEFT JOIN {{ ref('dim_products') }} p ON f.product_id = p.product_id