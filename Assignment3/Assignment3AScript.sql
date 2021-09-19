/*************************************************
A query to display the number of orders and their total value.
Created by Joseph Slattery, Fall 2021
*************************************************/

SELECT COUNT(*) AS "All Orders",
SUM(ship_amount) AS "Ship Value"
FROM orders
l