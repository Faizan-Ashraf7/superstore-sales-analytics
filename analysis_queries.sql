-- 1. Revenue & Profitability Breakdown by Category
SELECT 
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore_data
GROUP BY category, sub_category
ORDER BY total_profit DESC;

-- 2. Top 5 Performing Cities by Net Sales
SELECT 
    city,
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_data
GROUP BY city, state
ORDER BY total_sales DESC
LIMIT 5;

-- 3. Month-over-Month Revenue Growth (Standard SQL String Parsing for Date)
WITH monthly_metrics AS (
    SELECT 
        SUBSTR(order_date, 1, 7) AS order_month,
        ROUND(SUM(sales), 2) AS current_month_sales
    FROM superstore_data
    GROUP BY SUBSTR(order_date, 1, 7)
)
SELECT 
    order_month,
    current_month_sales,
    LAG(current_month_sales, 1) OVER (ORDER BY order_month) AS prior_month_sales,
    ROUND(
        ((current_month_sales - LAG(current_month_sales, 1) OVER (ORDER BY order_month)) 
        / LAG(current_month_sales, 1) OVER (ORDER BY order_month)) * 100, 
        2
    ) AS mom_growth_rate_pct
FROM monthly_metrics
ORDER BY order_month;

-- 4. Top Customers Ranked by Monetary Value
SELECT 
    customer_name,
    segment,
    ROUND(SUM(sales), 2) AS lifetime_spend,
    COUNT(DISTINCT order_id) AS total_orders_placed,
    DENSE_RANK() OVER (ORDER BY SUM(sales) DESC) AS customer_rank
FROM superstore_data
GROUP BY customer_name, segment
ORDER BY customer_rank
LIMIT 10;