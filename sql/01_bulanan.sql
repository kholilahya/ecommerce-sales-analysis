-- Q1: Monthly orders and revenue (delivered orders only)
-- Revenue = sum of item price, excluding freight (GMV proxy)
SELECT substr(o.order_purchase_timestamp, 1, 7) AS bulan,
       COUNT(DISTINCT o.order_id) AS pesanan,
       ROUND(SUM(oi.price), 2) AS pendapatan
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY bulan
ORDER BY bulan;
