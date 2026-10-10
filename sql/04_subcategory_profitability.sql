
-- Supermart Sales Analysis
-- Query 4: Profitability by product subcategory

SELECT
    p.category,
    p.sub_category,
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
GROUP BY p.category, p.sub_category
ORDER BY total_profit ASC;