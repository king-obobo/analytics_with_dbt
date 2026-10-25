-- product_id, product_name, category, sub_category

SELECT 
    product_id,
    MAX(product_name) AS product_name,
    MAX(category) AS category,
    MAX(sub_category) AS sub_category
FROM {{ ref('stg_super_store_data') }}
GROUP BY product_id