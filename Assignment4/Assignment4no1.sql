/***********************************************************
A query to show which distinct category names from the categories 
table are referenced in the products table, using where instead of
join.

Created by Joseph Slattery, Fall 2021

***********************************************************/

SELECT DISTINCT category_name
FROM categories
WHERE category_id IN
	(SELECT category_id
    FROM products)
ORDER BY category_name;

