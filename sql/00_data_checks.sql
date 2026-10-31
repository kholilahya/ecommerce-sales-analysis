-- Data checks (run before analysis)
-- 1) Row counts per table
SELECT 'orders' AS tabel, COUNT(*) AS baris FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'sellers', COUNT(*) FROM sellers;

-- 2) Order status distribution (analysis rule: delivered orders only)
SELECT order_status, COUNT(*) AS jumlah
FROM orders
GROUP BY order_status
ORDER BY jumlah DESC;

-- 3) Duplicate order_id (expected: no rows)
SELECT order_id, COUNT(*) AS n
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 4) Delivered orders with missing delivery date
SELECT COUNT(*) AS tanggal_kosong
FROM orders
WHERE order_status = 'delivered'
  AND (order_delivered_customer_date IS NULL OR order_delivered_customer_date = '');
