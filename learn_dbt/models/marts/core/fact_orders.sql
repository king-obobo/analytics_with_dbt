-- row_id, sales, quantity, discount, profit, product_id, order_id

SELECT 
    row_id,
    sales,
    quantity,
    discount,
    profit,
    product_id,
    order_id
FROM {{ ref('stg_super_store_data') }}