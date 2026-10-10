
-- Supermart Sales Analysis
-- Query 5: Profitability by discount band

WITH discount_data AS (
    SELECT
        CASE
            WHEN discount = 0 THEN '0% - No discount'
            WHEN discount <= 0.20 THEN '1-20%'
            WHEN discount < 0.50 THEN '21-49%'
            ELSE '50-80%'
        END AS discount_band,
        CASE
            WHEN discount = 0 THEN 1
            WHEN discount <= 0.20 THEN 2
            WHEN discount < 0.50 THEN 3
            ELSE 4
        END AS sort_order,
        sales,
        profit
    FROM public.sales
)
SELECT
    discount_band,
    COUNT(*) AS sales_lines,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit,
    ROUND(
        (100.0 * SUM(profit) /
        NULLIF(SUM(sales), 0))::numeric,
        2
    ) AS profit_margin_pct
FROM discount_data
GROUP BY discount_band, sort_order
ORDER BY sort_order;