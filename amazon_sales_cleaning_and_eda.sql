SQL Cleaning Queries

1. Inspect Raw Data

SELECT product_name, discounted_price, actual_price, discount_percentage
FROM amazon_sales
LIMIT 5;


2. Create Cleaned Table

CREATE OR REPLACE VIEW v_amazon_sales_cleaned AS
SELECT
    product_id,
    product_name,
    category,
    -- Remove the '₹' symbol and commas, then cast to numeric
    CAST(REPLACE(REPLACE(discounted_price, '₹', ''), ',', '') AS NUMERIC) AS clean_discounted_price,
    CAST(REPLACE(REPLACE(actual_price, '₹', ''), ',', '') AS NUMERIC) AS clean_actual_price,
    -- Remove the '%' sign and cast discount percentage to numeric
    CAST(REPLACE(discount_percentage, '%', '') AS NUMERIC) AS clean_discount_pct,
    -- Handle ratings (some might be non-numeric strings, handle safely or cast)
    NULLIF(rating, '|')::NUMERIC AS clean_rating,
    -- Remove commas from rating counts and cast to integer
    CAST(REPLACE(rating_count, ',', '') AS INTEGER) AS clean_rating_count,
    about_product,
    user_id,
    user_name,
    review_id,
    review_title,
    review_content
FROM amazon_sales
WHERE discounted_price IS NOT NULL
  AND actual_price IS NOT NULL
  AND discounted_price != '|';


3. Test Cleaned Table

SELECT product_name, clean_discounted_price, clean_actual_price, clean_discount_pct, clean_rating
FROM v_amazon_sales_cleaned
LIMIT 10;



Exploratory Analysis Queries

Find the top 10 product categories by average discount percentage

SELECT
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(clean_discount_pct), 2) AS avg_discount_percentage,
    ROUND(AVG(clean_discounted_price), 2) AS avg_sale_price
FROM v_amazon_sales_cleaned
GROUP BY category
ORDER BY avg_discount_percentage DESC


Querry to find top 3 categories with more than 50 products

SELECT 
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(clean_discount_pct), 2) AS avg_discount_percentage,
    ROUND(AVG(clean_discounted_price), 2) AS avg_sale_price
FROM v_amazon_sales_cleaned
GROUP BY category
HAVING COUNT(*) > 50
ORDER BY avg_discount_percentage DESC
LIMIT 3;


    
LIMIT 5;
