-- Dunnhumby Complete Journey
-- File: hive/create_tables.sql
-- Purpose: Define a Hive table for transaction-level shopping data.
--
-- IMPORTANT:
-- Verify the CSV header, column order, delimiter, and data types
-- against the exact dataset files before running this script.
-- This script assumes a comma-separated CSV without a header row
-- and a transaction file containing the columns listed below.

CREATE DATABASE IF NOT EXISTS dunnhumby_analytics;

USE dunnhumby_analytics;

CREATE EXTERNAL TABLE IF NOT EXISTS transaction_data (
    household_key INT,
    basket_id BIGINT,
    day INT,
    product_id BIGINT,
    quantity BIGINT,
    sales_value DOUBLE,
    store_id INT,
    retail_disc DOUBLE,
    trans_time STRING,
    week_no INT,
    coupon_disc DOUBLE,
    coupon_match_disc DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ('skip.header.line.count'='1');

-- Replace the example path with the real HDFS directory
-- containing the transaction CSV before loading or querying data.
--
-- Example command to run separately in the Hive CLI:
-- LOAD DATA INPATH '/user/your_username/dunnhumby/transaction_data.csv'
-- INTO TABLE transaction_data;

-- Verify the table definition:
DESCRIBE transaction_data;

-- Check whether records are available:
SELECT * FROM transaction_data LIMIT 10;
