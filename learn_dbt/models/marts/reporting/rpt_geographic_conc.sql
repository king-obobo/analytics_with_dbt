SELECT 
    market_region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM {{ ref('rpt_clean_table') }}
GROUP BY market_region
ORDER BY total_sales DESC