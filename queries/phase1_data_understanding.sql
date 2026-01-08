
-- PHASE 1: DATA UNDERSTANDING & SETUP

-- Create and use database
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- Check available tables
SHOW TABLES;

-- View sample data
SELECT *
FROM ecommerce_dataset_updated
LIMIT 5;

-- Check table structure
DESCRIBE ecommerce_dataset_updated;

-- Total number of rows
SELECT COUNT(*) AS total_rows
FROM ecommerce_dataset_updated;

-- Column-wise NULL check
SELECT 
  COUNT(*) AS total_rows,
  SUM(User_ID IS NULL) AS user_id_nulls,
  SUM(Product_ID IS NULL) AS product_id_nulls,
  SUM(Category IS NULL) AS category_nulls,
  SUM(`Price (Rs.)` IS NULL) AS price_nulls,
  SUM(`Discount (%)` IS NULL) AS discount_nulls,
  SUM(`Final_Price(Rs.)` IS NULL) AS final_price_nulls,
  SUM(Payment_Method IS NULL) AS payment_method_nulls,
  SUM(Purchase_Date IS NULL) AS purchase_date_nulls
FROM ecommerce_dataset_updated;
