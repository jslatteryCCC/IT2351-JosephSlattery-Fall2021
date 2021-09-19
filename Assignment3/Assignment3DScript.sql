/*************************************************
A query to display products, their categories, and order quantities with summary of orders by category.
Created by Joseph Slattery, Fall 2021
*************************************************/

SELECT c.category_name AS "Category", p.product_name AS "Product Name", SUM(oi.quantity) AS "Order Quantity"
FROM categories c
INNER JOIN products p
ON c.category_id = p.category_id
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name, p.product_name WITH ROLLUP;
