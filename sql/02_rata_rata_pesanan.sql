-- Q2: Average order value (delivered orders only)
SELECT ROUND(SUM(oi.price) * 1.0 / COUNT(DISTINCT o.order_id), 2) AS rata_rata_per_pesanan
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';
