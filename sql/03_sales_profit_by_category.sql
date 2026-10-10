
-- Supermart Sales Analysis
-- Query 3: Sales and profit by product category

SELECT
    p.category,
    COUNT(*) AS sales_lines,
    ROUND(SUM(s.sales)::numeric, 2) AS total_sales,
    ROUND(SUM(s.profit)::numeric, 2) AS total_profit,
    ROUND(
        (100.0 * SUM(s.profit) /
        NULLIF(SUM(s.sales), 0))::numeric,
        2
    ) AS profit_margin_pct
FROM public.sales AS s
JOIN public.product AS p
    ON TRIM(s.product_id) =
       REGEXP_REPLACE(p.product_id, '^\uFEFF', '')
GROUP BY p.category
ORDER BY total_sales DESC;