-- =========================================
-- PHASE 3: DATA ANALYSIS
-- =========================================

-- 1. Overall Performance
-- Total orders and total revenue
SELECT
  COUNT(*) AS total_orders,
  SUM(`Final_Price(Rs.)`) AS total_revenue
FROM ecommerce_dataset_updated;

-- Average order value
SELECT
  AVG(`Final_Price(Rs.)`) AS avg_order_value
FROM ecommerce_dataset_updated;

-- 2. Category Performance
-- Revenue by category
SELECT
  Category,
  SUM(`Final_Price(Rs.)`) AS total_revenue
FROM ecommerce_dataset_updated
GROUP BY Category
ORDER BY total_revenue DESC;

-- Orders by category
SELECT
  Category,
  COUNT(*) AS total_orders
FROM ecommerce_dataset_updated
GROUP BY Category
ORDER BY total_orders DESC;

-- 3. Payment Method Analysis
-- Most frequently used payment methods
SELECT
  Payment_Method,
  COUNT(*) AS total_orders
FROM ecommerce_dataset_updated
GROUP BY Payment_Method
ORDER BY total_orders DESC;

-- Revenue by payment method
SELECT
  Payment_Method,
  SUM(`Final_Price(Rs.)`) AS total_revenue
FROM ecommerce_dataset_updated
GROUP BY Payment_Method
ORDER BY total_revenue DESC;

-- 4. Discount Impact Analysis
-- Discount level vs orders and revenue
SELECT
  CASE
    WHEN `Discount (%)` = 0 THEN 'No Discount'
    WHEN `Discount (%)` BETWEEN 1 AND 10 THEN 'Low Discount (1-10%)'
    WHEN `Discount (%)` BETWEEN 11 AND 30 THEN 'Medium Discount (11-30%)'
    ELSE 'High Discount (>30%)'
  END AS discount_level,
  COUNT(*) AS total_orders,
  SUM(`Final_Price(Rs.)`) AS total_revenue
FROM ecommerce_dataset_updated
GROUP BY discount_level
ORDER BY total_revenue DESC;

-- 5. Time-Based Sales Analysis
-- Monthly sales trend
SELECT
  YEAR(STR_TO_DATE(Purchase_Date, '%Y-%m-%d')) AS year,
  MONTH(STR_TO_DATE(Purchase_Date, '%Y-%m-%d')) AS month,
  SUM(`Final_Price(Rs.)`) AS total_revenue
FROM ecommerce_dataset_updated
GROUP BY year, month
ORDER BY year, month;

-- Month-wise revenue (seasonality)
SELECT
  MONTH(STR_TO_DATE(Purchase_Date, '%Y-%m-%d')) AS month,
  SUM(`Final_Price(Rs.)`) AS total_revenue
FROM ecommerce_dataset_updated
GROUP BY month
ORDER BY total_revenue DESC;

-- 6. Customer & Order Behavior
-- Distribution of orders across users
SELECT
  User_ID,
  COUNT(*) AS total_orders
FROM ecommerce_dataset_updated
GROUP BY User_ID
ORDER BY total_orders DESC;

-- Repeat purchase patterns
SELECT
  User_ID,
  COUNT(*) AS total_orders
FROM ecommerce_dataset_updated
GROUP BY User_ID
HAVING COUNT(*) > 1
ORDER BY total_orders DESC;
