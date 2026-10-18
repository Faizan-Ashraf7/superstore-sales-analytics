# Superstore E-Commerce Performance & Customer Intelligence

## Project Overview
This project is an end-to-end data analytics pipeline designed to extract business intelligence from e-commerce sales data. It demonstrates a complete data workflow: from raw data ingestion and cleaning in **Python**, to relational database management and querying in **SQL**, culminating in an interactive executive dashboard in **Power BI**. 

The goal of this analysis is to identify key profitability drivers, regional performance metrics, and customer segment trends to inform strategic business decisions.

## Tech Stack
* **Data Cleaning & Pipeline:** Python (Pandas, SQLite)
* **Database & Querying:** Standard SQL (Window functions, CTEs, Aggregations)
* **Data Visualization:** Power BI (DAX, Interactive Dashboards)

## Project Architecture & Workflow
1. **Data Preprocessing (`data_clean.py`):** Ingested raw CSV data, handled missing values, standardized data types, and exported a production-ready dataset.
2. **Database Engineering (`database_setup.py`):** Engineered a Python-based pipeline to load the cleaned flat file into a local SQLite relational database, enabling robust querying.
3. **Exploratory Data Analysis (`analysis_queries.sql`):** Executed complex SQL queries to extract KPIs, including Month-over-Month growth, top-performing geographical regions, and VIP customer rankings.
4. **Data Visualization (`power-bi/superstore_executive_dashboard.pbix`):** Built an interactive Power BI dashboard featuring dynamic filtering, geographic performance tracking, and product-level profitability analysis.

## Key Business Insights
* **Top-Level KPIs:** The dataset reflects **$2.30M** in total revenue and **$286.24K** in net profit.
* **Customer Demographics:** The *Consumer* segment is the primary revenue driver, accounting for over 50% of total sales, followed by the *Corporate* segment.
* **Product Profitability:** While products like Copiers and Phones drive high profit margins, categories such as Tables are operating at a net loss and require pricing or supply chain adjustments.
* **Regional Performance:** The West and East regions significantly outperform the Central and South regions in total sales volume.

