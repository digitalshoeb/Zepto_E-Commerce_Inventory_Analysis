# Zepto_E-Commerce_Inventory_Analysis

Project Overview

This project simulates a real-world e-commerce data analyst scenario using a dataset of 3,732 product listings scraped from the official Zepto website
. The goal is to perform an end-to-end SQL analysis—from database schema design and data cleaning to uncovering actionable business insights—to help optimize inventory, pricing, and marketing strategies
.

Dataset Description

The dataset contains nine columns representing unique Stock Keeping Units (SKUs), meaning individual rows can share product names but differ in weight, packaging, or category
.
- Key Fields: Product Category, Name, MRP, Discount Percentage, Available Quantity, Final Selling Price, Weight (grams), and an "Out of Stock" boolean flag
.

Technical Stack
- Database: PostgreSQL (via PG Admin)
- Language: SQL
- Tools: Kaggle (Data Source), CSV (UTF-8 encoding)

Project Workflow
1. Environment Setup & Data Ingestion
- Schema Design: Created a structured table named zepto with optimized data types, including Numeric for prices, Integer for quantities, and Boolean for stock status
.
- Data Formatting: Resolved import errors by converting the raw dataset into CSV UTF-8 format to ensure special characters were read correctly by PostgreSQL
.
- Primary Key Implementation: Added a unique SKU_ID to the table during creation to serve as the primary key for data integrity
.

2. Data Cleaning & Pre-processing
- Currency Conversion: Identified that raw prices were stored in paise rather than rupees; updated the database to divide MRP and selling prices by 100 for standard analysis
.
- Anomaly Removal: Performed a check for impossible values and deleted entries where the MRP was recorded as zero
.
- Validation: Conducted a comprehensive null value check across all columns, confirming a high-quality dataset with no missing values
.

3. Business Logic & Insights (SQL Queries)

   The analysis utilized Aggregate Functions, Case Statements, and Joins to answer critical business questions:

- Revenue Optimization: Calculated the total estimated revenue per category by multiplying selling prices by available quantities
.
- Stock Gap Analysis: Identified high-priced items (MRP > 300) that are currently out of stock, highlighting missed revenue opportunities
.
- Discount Strategy: Determined that Fruits and Vegetables offer the highest average discount (15%), followed by meats and fish
.
- Value for Money: Computed a price-per-gram metric for items over 100g to help customers and the business compare value across different pack sizes
.
- Logistics Planning: Segmented products into Low, Medium, and Bulk weight categories using a CASE statement to assist in delivery and warehouse planning
.
- Inventory Weight: Summarized the total inventory weight per category to identify which segments contribute most to warehouse bulk
.

Key Findings
- The inventory includes 453 out-of-stock items compared to 3,200 available products
.
- Top-performing discount categories include Fruits, Vegetables, and Packaged Foods, with some promotional items reaching discounts of 50% or more
.
- Multiple SKUs exist for common products (like certain snacks), reflecting diverse packaging options to improve visibility and variety
.
