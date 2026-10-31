-- Q4: Seller concentration (top 20 sellers, cumulative share of revenue)
WITH seller_rev AS (
  SELECT oi.seller_id, SUM(oi.price) AS pendapatan
  FROM order_items oi
  JOIN orders o ON oi.order_id = o.order_id
  WHERE o.order_status = 'delivered'
  GROUP BY oi.seller_id
)
SELECT seller_id,
       ROUND(pendapatan, 2) AS pendapatan,
       ROUND(100.0 * pendapatan / (SELECT SUM(pendapatan) FROM seller_rev), 2) AS persen_total,
       ROUND(100.0 * SUM(pendapatan) OVER (ORDER BY pendapatan DESC)
             / (SELECT SUM(pendapatan) FROM seller_rev), 2) AS persen_kumulatif
FROM seller_rev
ORDER BY pendapatan DESC
LIMIT 20;
