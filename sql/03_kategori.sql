-- Q3: Top 10 categories by revenue (delivered orders only)
-- Note: orders are counted per category; one order can contain several categories,
-- so the order counts must not be summed across categories.
SELECT COALESCE(t.product_category_name_english, p.product_category_name) AS kategori,
       COUNT(DISTINCT oi.order_id) AS pesanan,
       ROUND(SUM(oi.price), 2) AS pendapatan
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN category_translation t ON p.product_category_name = t.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY kategori
ORDER BY pendapatan DESC
LIMIT 10;
