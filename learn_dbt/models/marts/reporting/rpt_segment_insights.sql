SELECT 
    segment,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(sales) AS total_sales,
    ROUND(SUM(sales) / COUNT(DISTINCT customer_id), 2) AS avg_spend_per_customer
FROM {{ ref('rpt_clean_table') }}
GROUP BY segment
ORDER BY total_sales DESC