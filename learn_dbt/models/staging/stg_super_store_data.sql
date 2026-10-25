SELECT 
    -- IDs
    CAST("Row ID" AS VARCHAR(50)) AS row_id,
    CAST("Order ID" AS VARCHAR(50)) AS order_id,
    CAST("Customer ID" AS VARCHAR(50)) AS customer_id,
    CAST("Product ID" AS VARCHAR(50)) AS product_id,

    -- Dates
    CAST("Order Date" AS DATE) AS order_date,
    CAST("Ship Date" AS DATE) AS ship_date,

    -- Others
    LOWER(CAST("Ship Mode" AS VARCHAR(50))) AS ship_mode,
    LOWER(CAST("Customer Name" AS VARCHAR(50))) AS customer_name,
    LOWER(CAST("Segment" AS VARCHAR(50))) AS segment,
    LOWER(CAST("City" AS VARCHAR(50))) AS city,
    LOWER(CAST("State" AS VARCHAR(50))) AS state,
    LOWER(CAST("Country" AS VARCHAR(50))) AS country,
    LOWER(CAST("Postal Code" AS VARCHAR(50))) AS postal_code,
    LOWER(CAST("Market" AS VARCHAR(50))) AS market,
    LOWER(CAST("Region" AS VARCHAR(50))) AS region,
    LOWER(CAST("Category" AS VARCHAR(50))) AS category,
    LOWER(CAST("Sub-Category" AS VARCHAR(50))) AS sub_category,
    LOWER(CAST("Product Name" AS VARCHAR(50))) AS product_name,
    CAST("Sales" AS NUMERIC(10, 2)) AS sales,
    CAST("Quantity" AS INTEGER) AS quantity,
    CAST("Discount" AS NUMERIC(10, 2)) AS discount,
    CAST("Profit" AS NUMERIC(10, 2)) AS profit,
    CAST("Shipping Cost" AS NUMERIC(10, 2)) AS shipping_cost,
    LOWER(CAST("Order Priority" AS VARCHAR(50))) AS order_priority

FROM {{ source('raw_data', 'global_superstore2') }}