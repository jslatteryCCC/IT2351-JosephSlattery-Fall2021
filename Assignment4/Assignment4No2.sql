/***********************************************************************
A query to return the product name and price of items that have been ordered
and have prices greater than the average item price. 

Created by Joseph Slattery, Fall 2021
***********************************************************************/

SELECT DISTINCT product_name, list_price
FROM products
WHERE product_id IN
	(SELECT product_id
    FROM order_items
    )
HAVING list_price > (SELECT AVG(list_price) FROM products)