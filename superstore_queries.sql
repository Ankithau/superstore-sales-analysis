-- Superstore Sales Analysis: SQL queries (SQLite)
-- Table: Sales

-- 1. Loss-making sub-categories
SELECT "Sub-Category", sum(Sales) AS total_sales, sum(Profit) AS total_profit
FROM Sales
GROUP BY "Sub-Category"
HAVING sum(Profit) < 0
ORDER BY total_profit ASC;

-- 2. Top 10 cities by sales
SELECT City, sum(Sales) AS total_sales, sum(Profit) AS total_profit
FROM Sales
GROUP BY City
ORDER BY total_sales DESC
LIMIT 10;

-- 3. Segment performance
SELECT Segment, sum(Sales) AS total_sales, sum(Profit) AS total_profit, sum(Quantity) AS total_quantity
FROM Sales
GROUP BY Segment;

-- 4. Region performance
SELECT Region, sum(Sales) AS total_sales, sum(Profit) AS total_profit, sum(Quantity) AS total_quantity
FROM Sales
GROUP BY Region
ORDER BY total_profit DESC;

-- 5. Discount impact on profit
SELECT
  CASE
    WHEN Discount = 0 THEN 'No Discount'
    WHEN Discount <= 0.2 THEN 'Up to 20%'
    ELSE 'Above 20%'
  END AS discount_group,
  count(*) AS num_rows,
  avg(Profit) AS avg_profit
FROM Sales
GROUP BY discount_group
ORDER BY avg_profit DESC;

-- 6. Top 5 states by profit
SELECT State, sum(Sales) AS total_sales, sum(Profit) AS total_profit
FROM Sales
GROUP BY State
ORDER BY total_profit DESC
LIMIT 5;

-- 7. Bottom 5 states by profit
SELECT State, sum(Sales) AS total_sales, sum(Profit) AS total_profit
FROM Sales
GROUP BY State
ORDER BY total_profit ASC
LIMIT 5;

-- 8. Ship mode performance
SELECT "Ship Mode", sum(Sales) AS total_sales, sum(Profit) AS total_profit, sum(Quantity) AS total_quantity
FROM Sales
GROUP BY "Ship Mode"
ORDER BY total_profit DESC;
