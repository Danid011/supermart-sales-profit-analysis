
-- Supermart Sales Analysis
-- Query 2: Overall business metrics

SELECT
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS customers_with_sales,
    ROUND(AVG(sales)::numeric, 2) AS avg_sales_per_line
FROM public.sales;