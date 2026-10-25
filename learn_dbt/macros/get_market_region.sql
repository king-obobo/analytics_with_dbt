-- Handles concatenation with a hyphen between market and region, and converts the result to lowercase. If market and region are the same, it returns just the market value in lowercase.

{% macro get_market_region(market_col, region_col) %}
    LOWER(
        CAST(
            CASE 
                WHEN {{ market_col }} = {{ region_col }} THEN {{ market_col }}
                ELSE CONCAT({{ market_col }}, ' - ', {{ region_col }})
            END 
        AS VARCHAR(100))
    )
{% endmacro %}