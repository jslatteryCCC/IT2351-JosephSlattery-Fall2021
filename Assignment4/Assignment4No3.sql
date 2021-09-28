/**********************************************************************
A query to demonstrate diffent methods of formatting data.
Created by Joseph Slattery, Fall 2021
**********************************************************************/


SELECT list_price AS "Unformatted", FORMAT(list_price, 1) AS "FORMAT() One Space", 
	   CONVERT(list_price, SIGNED) AS "CONVERT() Signed INT",
       CAST(list_price AS SIGNED) AS "CAST() Signed INT"
FROM products