CREATE VIEW items_ordered_view AS 
SELECT product_name, quantity, item_price
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
