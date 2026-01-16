# Retail-Sales-Analysis
Project Overview

This project demonstrates an end-to-end retail sales analysis workflow, starting from data exploration using MySQL and ending with a basic Power BI dashboard for visual communication of insights.

The goal of the project is to understand sales performance, product contribution, customer behavior, and time-based trends using structured queries and simple visualizations.

Dataset Description

Data Type: Retail transaction data

Rows: ~1,000 transactions

Grain: One row represents one retail transaction

Key Columns:

transaction_id – Unique transaction identifier

date – Date of purchase

customer_id – Customer identifier

gender – Customer gender

age – Customer age

product_category – Product category (Electronics, Clothing, Beauty)

quantity – Units purchased

price_per_unit – Price per unit

total_amount – Total transaction value

Project Workflow
1️ Data Exploration using MySQL

The dataset was first imported into MySQL to perform exploratory data analysis using SQL queries.

Key analysis performed:

Validation of total transactions and unique customers

Revenue calculations and monthly sales trends

Product category performance analysis

Customer spending patterns and repeat behavior

Demographic analysis by gender and age groups

Identification of high-value transactions

SQL was used to validate assumptions and understand the data structure before visualization.

2️ Data Visualization using Power BI

After completing SQL-based EDA, the data was imported into Power BI via Excel to build a basic, single-page dashboard.

Dashboard focus:

High-level sales performance overview

Product category contribution

Revenue trends over time

Units sold comparison

Gender-based revenue split

Only built-in Power BI aggregations (Sum, Count, Average) were used. No DAX or advanced calculations were applied.

Dashboard Visuals Included

KPI Cards

Total Revenue

Total Transactions

Average Transaction Value

Charts

Revenue by Product Category (Column Chart)

Monthly Revenue Trend (Line Chart)

Units Sold by Product Category (Bar Chart)

Revenue by Gender (Column Chart)

Filters

Product Category

Date

Key Insights

Revenue contribution varies significantly across product categories

Sales show noticeable fluctuations over different months

Product categories differ in volume-driven vs value-driven performance

Revenue distribution between genders is relatively balanced

A small number of transactions contribute disproportionately to total revenue

<img width="667" height="374" alt="Screenshot 2026-01-16 130915" src="https://github.com/user-attachments/assets/bf2dcbbc-761f-4add-a54b-d0dfe39dd2ff" />
