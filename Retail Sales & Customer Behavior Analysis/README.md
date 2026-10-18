# Retail Sales & Customer Behavior Analysis

## Overview

This project analyzes retail sales performance, customer purchasing behavior, and product performance using transaction data from January 2025 to September 2026.

The dataset includes **16,500 transactions, 1,400 customers, and 220 products** across nine retail stores.

The objective is to understand revenue trends, evaluate sales channels, identify valuable customer segments, and assess product performance to support business decision-making.

## Project Work

### 1. Data Exploration & Validation
- Explored five related datasets and their relationships.
- Checked missing values, duplicates, invalid records, and date inconsistencies.
- Validated data integrity and transaction statuses.

### 2. Sales Analysis
- Analyzed monthly revenue trends and sales channel performance.
- Calculated total revenue, transaction counts, and average basket value.
- Examined refunded and cancelled transactions.

### 3. Customer Analysis
- Analyzed purchasing frequency and customer spending.
- Applied RFM analysis using Recency, Frequency, and Monetary metrics.
- Classified customers into activity and value-based segments.
- Identified high-value and inactive customers.

### 4. Product Analysis
- Evaluated category revenue and sales contribution.
- Identified top-performing products by revenue and quantity.
- Compared product sales value and volume.

### 5. Dashboard Development
- Built a relational data model.
- Created DAX measures and calculated columns.
- Developed a three-page interactive dashboard with KPI cards, charts, tables, and slicers.

## Tools & Technologies

- **SQL Server** — Data exploration, validation, and analysis.
- **Power BI** — Data visualization and interactive dashboard development.
- **DAX** — KPI calculations and customer segmentation.
- **Data Modeling** — Table relationships and filtering.

## Business Questions

1. How does revenue change over time?
2. Which sales channels generate the highest revenue?
3. How does average basket value differ between online and in-store purchases?
4. Who are the highest-spending and most frequent customers?
5. How can customers be segmented based on purchasing behavior?
6. Which customers are active, at risk, or inactive?
7. Which products and categories generate the highest revenue and sales volume?

## Dashboard

![Retail Sales & Customer Behavior Dashboard](images/dashboard.gif)

The dashboard consists of three interactive pages:

### 1. Sales & Channel Overview
Revenue trends, sales channels, average basket value, and transaction performance.

### 2. Customer Behavior & Segmentation
Customer activity, purchasing frequency, spending patterns, and RFM segmentation.

### 3. Product & Category Performance
Category revenue, product rankings, sales volume, and category comparisons.

## Key Business Insights

- **Sales Channels:** In-store sales generated approximately **80.6% of total revenue**, while online sales contributed 19.4%. Average basket values were nearly identical, indicating that transaction volume was the primary driver of the revenue difference.
- **Customer Activity:** Identified **414 at-risk customers** and **379 inactive customers** based on purchase recency, highlighting opportunities to investigate customer retention.
- **Product Performance:** Baby Care was the highest revenue-generating category, contributing approximately **SAR 314K (20.98%)** of total completed sales.
- **Revenue vs. Volume:** Product rankings differed between revenue and units sold, showing the importance of evaluating both metrics when assessing product performance.

## Project Files

- [Dataset](data/)
- [Data Exploration](sql/Data_Exploration.sql)
- [Relationship Validation](sql/Relationship_Validation.sql)
- [Sales, Customer & Product Analysis](sql/Sales_Customer_Product_Analysis.sql)
- [Power BI Dashboard](powerbi/retail.pbix)

## Business Report

A separate report contains the detailed findings, business recommendations, and proposed actions based on the analysis.

[View Business Report](report/Report.pdf)

---

*This project uses synthetic retail data for portfolio purposes. Customer segmentation is based on predefined analytical rules.*