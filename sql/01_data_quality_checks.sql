
SELECT 'sales' AS table_name, COUNT(*) AS row_count FROM public.sales
UNION ALL
SELECT 'customer', COUNT(*) FROM public.customer
UNION ALL
SELECT 'product', COUNT(*) FROM public.product;