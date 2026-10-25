SELECT 
    category,
    sub_category,
    SUM(sales) AS category_sales,
    SUM(profit) AS category_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) as margin_pct
FROM {{ ref('rpt_clean_table') }}
GROUP BY category, sub_category
ORDER BY category_sales DESC