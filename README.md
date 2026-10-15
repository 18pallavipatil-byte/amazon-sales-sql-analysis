# 🛒 E-Commerce Sales & Pricing Analysis (SQL Project)

## 📌 Business Problem
An analysis of Amazon product listings, discount structures, and customer ratings to identify which product categories offer the highest promotional discounts and drive the most customer engagement.

## 🛠️ Tech Stack & Tools
* **Database:** PostgreSQL
* **Data Cleaning & Manipulation:** SQL (Views, Type Casting, String Functions, NULL handling)
* **Exploratory Data Analysis (EDA):** Aggregations, Grouping, Sorting

## 🧹 Data Cleaning Process
The raw Amazon dataset contained formatting inconsistencies. Using PostgreSQL, I performed the following cleaning steps:
* Stripped currency symbols (`₹`) and commas from `discounted_price` and `actual_price`, converting them into numeric data types for calculations.
* Cleaned percentage strings in `discount_percentage` to compute exact monetary savings.
* Handled structural anomalies and missing values in product ratings and counts.

## 📊 Key Findings & Business Insights
1. **Top Discount Categories:** Analyzed the top product categories offering the steepest average discount percentages to understand promotional strategies.
2. **High-Volume Products:** Filtered products with high ratings and large review counts to identify top-performing customer favorites.
3. **Pricing Disparity:** Calculated average absolute money saved per category to reveal where customers receive the greatest monetary value.

## 📂 Repository Structure
* `amazon_sales_cleaning_and_eda.sql`: Complete SQL script containing table creation, data cleaning view, and EDA queries.
