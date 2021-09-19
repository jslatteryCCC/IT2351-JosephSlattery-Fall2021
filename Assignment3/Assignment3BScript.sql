/*************************************************
A query to display the number of products and the value of the highest priced item.
Created by Joseph Slattery, Fall 2021
*************************************************/

SELECT COUNT(*) AS "All Products",
MAX(list_price) AS "Max Prod Price"
FROM products

l