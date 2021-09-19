/*************************************************
A query to the number of ordered products by Category, sorted by order quantity.
Created by Joseph Slattery, Fall 2021
*************************************************/

SELECT c.category_name AS "Category", COUNT(*) product_id, SUM(oi.quantity) AS "Order Quantity"
FROM categories c
INNER JOIN products p
ON c.category_id = p.category_id
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category_id
ORDER BY COUNT(oi.quantity) DESC;
