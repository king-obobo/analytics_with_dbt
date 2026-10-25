# Superstore Analytics with dbt

This repository contains a dbt project for transforming raw Superstore sales data into a clean, analytics-ready data model. The project follows a typical medallion-style flow: raw staging, core dimensions and facts, and reporting marts optimized for business analysis.

The project is located under the `learn_dbt/` folder and is designed to work with PostgreSQL, with sample profile configuration provided in `example.profile.yml`.

## Overview

The data model covers:
- Customer, product, and order dimensions
- Order fact data with sales, profit, quantity, and shipping details
- Reporting tables for KPI, geographic, shipping, and segment analysis
- Data quality tests to validate keys and core business metrics

This is a practical dbt learning project built around the Global Superstore dataset, with focus on turning raw operational data into business-facing tables for dashboards and reporting.

## Project structure

```text
dbt/
├── .venv/
├── data/
├── learn_dbt/
│   ├── dbt_project.yml
│   ├── models/
│   │   ├── schema.yml
│   │   ├── staging/
│   │   │   └── stg_super_store_data.sql
│   │   └── marts/
│   │       ├── core/
│   │       │   ├── dim_customers.sql
│   │       │   ├── dim_orders.sql
│   │       │   ├── dim_products.sql
│   │       │   └── fact_orders.sql
│   │       └── reporting/
│   │           ├── rpt_clean_table.sql
│   │           ├── rpt_descriptive_analysis.sql
│   │           ├── rpt_gographic_conc.sql
│   │           ├── rpt_segment_isights.sql
│   │           ├── rpt_shipping_mode.sql
│   │           └── rpt_top_prods_and_cat.sql
│   ├── tests/
│   │   ├── assert_quantity_is_positive.sql
│   │   └── assert_sales_not_negative.sql
│   └── README.md
├── example.profile.yml
├── guide_on_set_up.txt
├── pyproject.toml
├── uv.lock
├── .python-version
└── README.md
```

## Data model

### Staging layer
- `stg_super_store_data.sql` cleans and standardizes raw source columns, including:
  - row and order identifiers
  - customer and product identifiers
  - order and ship dates
  - sales, quantity, discount, profit, and shipping cost
  - segment, region, category, and sub-category

### Core mart layer
- `dim_customers.sql`: customer dimension
- `dim_orders.sql`: order dimension
- `dim_products.sql`: product dimension
- `fact_orders.sql`: fact table for order-level transactional metrics

### Reporting layer
- `rpt_clean_table.sql`: combined business-ready table used by downstream analyses
- `rpt_descriptive_analysis.sql`: overall KPI summary
- `rpt_gographic_conc.sql`: sales and profit by region
- `rpt_segment_isights.sql`: customer segment performance
- `rpt_shipping_mode.sql`: shipping mode metrics
- `rpt_top_prods_and_cat.sql`: top products and category/sub-category performance

## Key business questions answered

The models support analysis such as:
- Which products and categories generate the most sales and profit?
- Which customer segments spend the most?
- Which shipping methods are most common and costliest?
- Which regions contribute the most revenue?
- What is the overall profit margin across the business?

## Setup

### 1) Create and activate a Python environment

```powershell
cd "c:\Users\DELL\Desktop\dbt"
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

### 2) Install dependencies

This project declares Python and dbt dependencies in `pyproject.toml`.

Using `pip`:

```powershell
pip install --upgrade pip
pip install -e .
```

Using `uv` (if available):

```powershell
uv sync
```

### 3) Configure PostgreSQL connection

The repository includes a sample profile at `example.profile.yml`. Create your local dbt profile using it:

```powershell
mkdir "$HOME\.dbt"
Copy-Item .\example.profile.yml "$HOME\.dbt\profiles.yml"
```

Then update the values in the `profiles.yml` file with your PostgreSQL database credentials, host, schema, and port.

## Run the dbt project

From the project directory:

```powershell
cd learn_dbt
```

Validate the connection:

```powershell
dbt debug
```

Build the models:

```powershell
dbt run
```

Run tests:

```powershell
dbt test
```

Generate project documentation:

```powershell
dbt docs generate
```

Serve the docs locally:

```powershell
dbt docs serve
```

## dbt tests included

The project includes checks for:
- unique customer, order, and product identifiers
- non-null key fields
- valid relationships between fact and dimension tables
- positive sales and quantity checks

These tests are defined in `learn_dbt/models/schema.yml` and under `learn_dbt/tests/`.

## Notes

- This project is intended for analytics and reporting use cases.
- The profile configuration is intentionally template-based and must be filled with environment-specific database credentials.
- Presentation files such as `.pptx` assets are not part of the dbt workflow and are intentionally excluded from the project documentation.

## License

This project is intended for learning and internal analytics use. Update or apply your preferred project license if you plan to share or deploy it beyond a local environment.
