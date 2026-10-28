
# Dunnhumby Dataset Guide

## 1. Dataset Overview

This project uses the Dunnhumby Complete Journey dataset to explore retail shopping behaviour, product sales, household purchasing patterns, and promotional activities.

The dataset contains transaction-level information and related product, household, campaign, and coupon data.

## 2. Dataset Files

| File | Purpose | Possible use in this project |
|---|---|---|
| `transaction_data.csv` | Records shopping transactions and purchased products | Calculate sales, quantities, basket counts, and household spending |
| `product.csv` | Contains product-related information | Explore product categories and product-level sales |
| `hh_demographic.csv` | Contains available household demographic attributes | Explore purchasing patterns across available demographic groups |
| `campaign_desc.csv` | Describes marketing campaigns | Understand campaign timing and details |
| `campaign_table.csv` | Contains household campaign-related information | Examine campaign assignment or participation |
| `causal_data.csv` | Contains product, store, and promotional/display-related information | Explore promotional factors associated with products |
| `coupon.csv` | Contains coupon-related information | Study coupon availability and attributes |
| `coupon_redempt.csv` | Contains coupon redemption records | Explore coupon redemption behaviour |

**Important:** File names and columns may vary by dataset release. Confirm them against the files you actually downloaded.

## 3. Main Analysis

The project is designed to investigate:

1. Total sales and quantities sold.
2. Products with the highest sales.
3. Household spending patterns.
4. Weekly sales trends.
5. Discount and coupon activity.
6. Differences between TextFile and RCFile storage.

## 4. Data Preparation

Before running the analysis:

1. Check the dataset files and column names.
2. Confirm the delimiter and whether each CSV includes a header.
3. Check for missing or invalid values.
4. Verify numeric columns and data types.
5. Upload the validated files to HDFS.
6. Create Hive tables with matching schemas.

## 5. Dataset Availability

The dataset files themselves are not included in this GitHub repository by default. Download and use the dataset according to its source terms and access requirements.

Dataset source: https://www.dunnhumby.com/source-files/

## 6. Privacy and Responsible Use

Use the dataset for educational and analytical purposes. Do not attempt to identify individual shoppers or publish sensitive information. Follow the dataset's terms of use.
