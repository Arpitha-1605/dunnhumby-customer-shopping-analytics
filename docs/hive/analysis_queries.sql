-- Dunnhumby Complete Journey: Customer Shopping Analytics
-- File: hive/analysis_queries.sql
-- Purpose: Explore transactions, product sales, customer spending,
-- weekly trends, and discounts using Apache Hive.
--
-- IMPORTANT:
-- 1. Create and load the transaction_data table before running these queries.
-- 2. Confirm that the table contains the columns used below.
-- 3. These are starter queries; execution results must be generated separately.

-- 1. Inspect the transaction table
SELECT *
FROM transaction_data
LIMIT 10;


-- 2. Calculate overall transaction statistics
SELECT
    COUNT(*) AS transaction_line_count,
    COUNT(DISTINCT household_key) AS unique_households,
    COUNT(DISTINCT basket_id) AS unique_baskets,
    SUM(sales_value) AS total_sales_value,
    SUM(quantity) AS total_quantity
FROM transaction_data;


-- 3. Identify the top 10 products by sales value
SELECT
    product_id,
    SUM(sales_value) AS total_sales_value,
    SUM(quantity) AS total_quantity
FROM transaction_data
GROUP BY product_id
ORDER BY total_sales_value DESC
LIMIT 10;


-- 4. Identify the 10 highest-spending households
SELECT
    household_key,
    SUM(sales_value) AS household_spending,
    COUNT(DISTINCT basket_id) AS basket_count
FROM transaction_data
GROUP BY household_key
ORDER BY household_spending DESC
LIMIT 10;


-- 5. Analyze sales by week
SELECT
    week_no,
    SUM(sales_value) AS weekly_sales,
    SUM(quantity) AS weekly_quantity,
    COUNT(DISTINCT basket_id) AS weekly_baskets
FROM transaction_data
GROUP BY week_no
ORDER BY week_no;


-- 6. Analyze discounts
SELECT
    SUM(retail_disc) AS total_retail_discount,
    SUM(coupon_disc) AS total_coupon_discount,
    SUM(coupon_match_disc) AS total_coupon_match_discount
FROM transaction_data;


-- 7. Find products with the highest quantities sold
SELECT
    product_id,
    SUM(quantity) AS total_quantity_sold
FROM transaction_data
GROUP BY product_id
ORDER BY total_quantity_sold DESC
LIMIT 10;


-- 8. Compare average basket spending
SELECT
    household_key,
    basket_id,
    SUM(sales_value) AS basket_spending
FROM transaction_data
GROUP BY household_key, basket_id
ORDER BY basket_spending DESC
LIMIT 20;
