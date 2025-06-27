-- 📁 Superstore Data Analysis Project (SQL)
-- 📌 GitHub-Ready SQL Script for Interview Portfolio

-- 🧹 1. Preview First 10 Records
SELECT TOP 10 * FROM superstore_data;

-- 🧹 2. Check for Duplicate Order IDs
SELECT order_id, COUNT(*) AS occurrences
FROM superstore_data
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 🧹 3. Check NULLs in Key Columns
SELECT 
  SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
  SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS null_profit,
  SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS null_region
FROM superstore_data;

-- 🧹 4. Sample Order and Ship Dates
SELECT TOP 5 order_date, ship_date
FROM superstore_data;

-- 📊 5. Total Sales and Profit
SELECT 
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore_data;

-- 📊 6. Top 5 States by Sales
SELECT TOP 5
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_data
GROUP BY state
ORDER BY total_sales DESC;

-- 📊 7. Sales by Category and Sub-Category
SELECT 
  category,
  sub_category,
  ROUND(SUM(sales), 2) AS total_sales
FROM superstore_data
GROUP BY category, sub_category
ORDER BY category, total_sales DESC;

-- 📊 8. Monthly Sales Trend
SELECT 
  FORMAT(order_date, 'yyyy-MM') AS order_month,
  ROUND(SUM(sales), 2) AS total_sales
FROM superstore_data
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY order_month;

-- 📊 9. Profit by Region
SELECT 
  region,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore_data
GROUP BY region
ORDER BY total_profit DESC;

-- 📊 10. Top 10 Loss-Making Products
SELECT TOP 10
  product_name,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore_data
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

-- 📊 11. Average Order Value
SELECT 
  ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM superstore_data;

-- 📊 12. Summary KPIs
SELECT 
  COUNT(DISTINCT order_id) AS total_orders,
  COUNT(DISTINCT customer_name) AS total_customers,
  COUNT(DISTINCT product_name) AS total_products,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore_data;
