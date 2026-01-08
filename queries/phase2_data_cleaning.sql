
-- PHASE 2: DATA CLEANING & VALIDATION
-- Check NULL or empty values in critical columns
SELECT *
FROM ecommerce_dataset_updated
WHERE
  User_ID IS NULL OR User_ID = ''
  OR Product_ID IS NULL OR Product_ID = ''
  OR Category IS NULL OR Category = ''
  OR Payment_Method IS NULL OR Payment_Method = '';

-- Numeric sanity check
SELECT *
FROM ecommerce_dataset_updated
WHERE
  `Price (Rs.)` <= 0
  OR `Discount (%)` < 0
  OR `Discount (%)` > 100
  OR `Final_Price(Rs.)` <= 0;
