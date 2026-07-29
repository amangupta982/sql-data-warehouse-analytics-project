# 📊 SQL Data Analytics & Data Warehousing Project

![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-blue?style=for-the-badge&logo=microsoftsqlserver)
![Data Analytics](https://img.shields.io/badge/Analytics-Data%20Warehousing-brightgreen?style=for-the-badge)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

A comprehensive, end-to-end **SQL Data Analytics and Data Warehousing** project built with T-SQL (Microsoft SQL Server). This repository contains clean, modular SQL scripts covering database setup, exploratory data analysis (EDA), magnitude analysis, advanced window functions, time-series analysis, data segmentation, part-to-whole analysis, and production-ready reporting views.

---

## 📌 Table of Contents

- [Project Overview](#-project-overview)
- [Database Architecture & Schema](#-database-architecture--schema)
- [Repository Structure](#-repository-structure)
- [Analytical Modules & Scripts](#-analytical-modules--scripts)
- [Key Business Insights & Capabilities](#-key-business-insights--capabilities)
- [Getting Started & Setup Guide](#-getting-started--setup-guide)
- [License](#-license)
- [Author](#-author)

---

## 📌 Project Overview

Modern businesses rely on transactional data stored across enterprise data warehouses to extract actionable metrics. This project models a **Gold Schema** relational data warehouse (`DataWarehouseAnalytics`) and runs complex analytical queries to evaluate key business performance metrics (KPIs).

### Highlights:
- **Star Schema Architecture**: Consists of centralized sales facts linked to customer and product dimensions.
- **Full Analytical Pipeline**: From raw database creation and bulk data loading to advanced RFM customer segmentation and product performance reporting views.
- **Advanced T-SQL Queries**: Uses Window Functions (`ROW_NUMBER`, `DENSE_RANK`, `LAG`, `LEAD`, `SUM() OVER`), Common Table Expressions (CTEs), Subqueries, Aggregate Functions, and Conditional Logic (`CASE WHEN`).

---

## 🏗️ Database Architecture & Schema

The data warehouse uses a **Star Schema** within the `gold` schema:

```
                  +-----------------------+
                  |  gold.dim_customers   |
                  +-----------------------+
                  | PK: customer_key      |
                  | customer_id           |
                  | customer_number       |
                  | first_name, last_name |
                  | country, gender       |
                  | birthdate, create_date|
                  +-----------+-----------+
                              |
                              | 1:N
                              v
+---------------------+   N:1 +-----------------------+
|  gold.dim_products  | <-----+    gold.fact_sales     |
+---------------------+       +-----------------------+
| PK: product_key     |       | FK: order_number      |
| product_id          |       | FK: product_key       |
| product_name        |       | FK: customer_key      |
| category, subcategory       | order_date, ship_date |
| cost, product_line  |       | sales_amount          |
| start_date          |       | quantity, price       |
+---------------------+       +-----------------------+
```

### Table Definitions

1. **`gold.dim_customers`**: Customer demographic profiles, location (country), marital status, gender, and registration dates.
2. **`gold.dim_products`**: Product catalog detailing categories, subcategories, unit costs, maintenance types, and product lines.
3. **`gold.fact_sales`**: Sales transactions containing financial measures (sales amount, quantity, price) and order dates.

---

## 📁 Repository Structure

```text
sql-data-analytics-project/
├── datasets/
│   ├── DataWarehouseAnalytics.bak   # Database backup file for quick restoration
│   └── flat-files/                  # CSV source datasets
│       ├── dim_customers.csv
│       ├── dim_products.csv
│       └── fact_sales.csv
├── scripts/                         # Analytical SQL Scripts (00 to 13)
│   ├── 00_init_database.sql         # Database schema creation & bulk loading
│   ├── 01_database_exploration.sql     # Metadata and schema inspection
│   ├── 02_dimensions_exploration.sql   # Unique dimension values inspection
│   ├── 03_date_range_exploration.sql   # Time boundaries & span analysis
│   ├── 04_measures_exploration.sql     # Core metrics (Sales, Orders, Quantity)
│   ├── 05_magnitude_analysis.sql       # Category & country aggregation
│   ├── 06_ranking_analysis.sql         # Top/Bottom performers ranking
│   ├── 07_change_over_time_analysis.sql # Trends & YoY growth analysis
│   ├── 08_cumulative_analysis.sql      # Running totals & moving averages
│   ├── 09_performance_analysis.sql     # Year-over-Year (YoY) target analysis
│   ├── 10_data_segmentation.sql        # Customer & Product cost tiering
│   ├── 11_part_to_whole_analysis.sql   # Category contribution % to revenue
│   ├── 12_report_customers.sql         # Customer 360 analytical view
│   └── 13_report_products.sql          # Product 360 analytical view
├── LICENSE                          # MIT License
└── README.md                        # Documentation
```

---

## 🔍 Analytical Modules & Scripts

| Script Name | Analysis Category | Focus & SQL Techniques Used |
|---|---|---|
| [`00_init_database.sql`](scripts/00_init_database.sql) | Database Setup | Drops/Creates `DataWarehouseAnalytics` DB, builds `gold` schema tables, and bulk inserts CSV data. |
| [`01_database_exploration.sql`](scripts/01_database_exploration.sql) | DB Exploration | Queries INFORMATION_SCHEMA / System Views for metadata, table structures, and row counts. |
| [`02_dimensions_exploration.sql`](scripts/02_dimensions_exploration.sql) | Data Profiling | Explores distinct values across customer countries, product categories, and subcategories. |
| [`03_date_range_exploration.sql`](scripts/03_date_range_exploration.sql) | Temporal Range | Identifies minimum & maximum dates, dataset span, and age calculations. |
| [`04_measures_exploration.sql`](scripts/04_measures_exploration.sql) | Metric Aggregations | Calculates key KPIs: total revenue, total quantity sold, average unit price, total orders. |
| [`05_magnitude_analysis.sql`](scripts/05_magnitude_analysis.sql) | Magnitude & Grouping | Groups total sales and item volumes by product line, category, subcategory, and country. |
| [`06_ranking_analysis.sql`](scripts/06_ranking_analysis.sql) | Ranking Analysis | Leverages `ROW_NUMBER()` and `DENSE_RANK()` window functions to isolate top/bottom customers and products. |
| [`07_change_over_time_analysis.sql`](scripts/07_change_over_time_analysis.sql) | Trend & Time Series | Analyzes annual and monthly sales velocity, order frequency trends, and growth patterns. |
| [`08_cumulative_analysis.sql`](scripts/08_cumulative_analysis.sql) | Cumulative Metrics | Computes running totals and rolling 3-month moving averages using `SUM() OVER (ORDER BY ...)`. |
| [`09_performance_analysis.sql`](scripts/09_performance_analysis.sql) | Performance Tracking | Measures Year-over-Year (YoY) performance comparison using `LAG()` window functions and benchmark targets. |
| [`10_data_segmentation.sql`](scripts/10_data_segmentation.sql) | Data Segmentation | Categorizes customers (VIP, Regular, Budget) and products based on spending thresholds and cost tiers. |
| [`11_part_to_whole_analysis.sql`](scripts/11_part_to_whole_analysis.sql) | Share of Total | Calculates percentage contribution of product categories and countries relative to total sales. |
| [`12_report_customers.sql`](scripts/12_report_customers.sql) | Reporting View | Constructs `gold.report_customers` view aggregating Customer 360 KPIs (Recency, Lifespan, Avg Spend). |
| [`13_report_products.sql`](scripts/13_report_products.sql) | Reporting View | Constructs `gold.report_products` view aggregating Product 360 KPIs (Revenue, Profit Margin, Orders). |

---

## 💡 Key Business Insights & Capabilities

1. **Customer 360 Analytics**:
   - **RFM Metrics**: Evaluates Recency (months since last purchase), Order Frequency, and Monetary Spend per customer.
   - **Customer Lifecycle**: Measures lifespan in months and average monthly value.
   - **Demographic Segmentation**: Segments customers across age groups, countries, and VIP spending tiers.

2. **Product Performance & Profitability**:
   - **Revenue vs. Cost**: Evaluates total revenue generated per product against base costs to calculate overall profitability.
   - **Pareto / Part-to-Whole Analysis**: Identifies core categories driving the vast majority of revenue.

3. **Time-Series & Growth Forecasting**:
   - **YoY Growth**: Tracks annual revenue variations and flags growth or contraction trends.
   - **Cumulative Tracking**: Real-time evaluation of year-to-date (YTD) running sales totals.

---

## 🚀 Getting Started & Setup Guide

### Prerequisites
- **Database Engine**: Microsoft SQL Server (2019 or later) or Azure SQL Database.
- **SQL Client**: SQL Server Management Studio (SSMS), Azure Data Studio, or DBeaver.

### Installation & Execution Options

#### Option 1: Execute Scripts sequentially
1. Clone or download this repository.
2. Open your preferred SQL client and connect to your SQL Server instance.
3. Open and run [`scripts/00_init_database.sql`](scripts/00_init_database.sql) to create the database, schema, tables, and populate data.
   > *Note: Update the file path in `BULK INSERT` statements to point to the local location of your CSV files.*
4. Execute analytical scripts (`01_database_exploration.sql` through `13_report_products.sql`) as desired.

#### Option 2: Restore from Backup File (`.bak`)
1. Place [`datasets/DataWarehouseAnalytics.bak`](datasets/DataWarehouseAnalytics.bak) in your SQL Server default backup directory.
2. Restore the database using SSMS or the following T-SQL command:
   ```sql
   RESTORE DATABASE DataWarehouseAnalytics
   FROM DISK = 'C:\path\to\datasets\DataWarehouseAnalytics.bak'
   WITH MOVE 'DataWarehouseAnalytics' TO 'C:\path\to\DataWarehouseAnalytics.mdf',
        MOVE 'DataWarehouseAnalytics_log' TO 'C:\path\to\DataWarehouseAnalytics_log.ldf',
        REPLACE;
   ```

---

## 🛡️ License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details. You are free to use, modify, and distribute this code for personal or commercial projects.

---

## 👤 Author

**Aman Gupta**
- **GitHub**: [@AmanGupta](https://github.com/) *(Update with your profile link)*
- **Project**: SQL Data Analytics & Data Warehousing

---
*If you find this repository helpful for learning or building data analytics solutions, feel free to star ⭐️ the repository!*
