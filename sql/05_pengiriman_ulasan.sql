-- Q5: Average delivery time (days) by review score
-- Note: some orders have more than one review, so jumlah_ulasan counts reviews, not orders.
SELECT r.review_score,
       COUNT(*) AS jumlah_ulasan,
       ROUND(AVG(julianday(o.order_delivered_customer_date)
               - julianday(o.order_purchase_timestamp)), 1) AS rata_hari_kirim
FROM orders o
JOIN reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date <> ''
GROUP BY r.review_score
ORDER BY r.review_score;
