# SQL-Data-Warehouse-Project
Building a modern data warehouse with SQL Server, including ETL processes, data modeling and analytics solutions.


# Data Architecture
For this project I implemented thr Medallion Architecture ie: Bronze, Silver, Gold
layers:



<img width="1002" height="651" alt="DATA ARCHITECTURE" src="https://github.com/user-attachments/assets/802632ed-4d93-44f8-98fc-9425edfa5c37" />



1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

# Project Overview
This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

# Project Requirements
# Building the Data Warehouse (Data Engineering)
# Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

# Specifications
- Data Sources: Import data from two source systems (ERP and CRM) provided as CSV files.
- Data Quality: Cleanse and resolve data quality issues prior to analysis.
- Integration: Combine both sources into a single, user-friendly data model designed for analytical queries.
- Scope: Focus on the latest dataset only; historization of data is not required.
- Documentation: Provide clear documentation of the data model to support both business stakeholders and analytics teams.


# BI: Analytics & Reporting (Data Analysis)
Objective
Develop SQL-based analytics to deliver detailed insights into:

- Customer Behavior
- Product Performance
- Sales Trends
These insights empower stakeholders with key business metrics, enabling strategic decision-making.

## Repository Structure

```text
data-warehouse-project/
│
├── datasets/                       # Data is loaded into the target tables using a Full Load methodology
│
├── docs/                           # Project documentation and architecture details
│   ├── data_architecture.drawio    # Overall project architecture
│   ├── data_catalog.md             # Dataset catalog with field descriptions and metadata
│   └── naming-conventions.md       # Naming guidelines for tables, columns, and files
│
├── scripts/                        # SQL scripts for ETL and transformations
│   ├── bronze/                     # Extracting and loading raw data
│   ├── silver/                     # Cleaning and transforming data
│   └── gold/                       # Analytical and reporting models
│
├── tests/                          # Data quality checks and test scripts
│
├── README.md                       # Project overview and setup instructions
└── LICENSE                         # License information

# About Me
My name is Salome Wambui a student pursuing Mathematics and Computer Science. I am an aspiring Big Data Scientist. I am enthusastic to learn and apply my skills to solve real world challenges!
