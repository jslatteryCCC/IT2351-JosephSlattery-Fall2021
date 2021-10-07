/*******************************************************************
A script to create a procedure to evaluate the number of products in
the products table.

Created by Joseph Slattery, Fall 2021
*******************************************************************/

USE joes_guitar_shop;

DROP PROCEDURE IF EXISTS ProductCount;

DELIMITER //

CREATE PROCEDURE ProductCount()
BEGIN
	DECLARE sum_product_count_var INT;
    
    SELECT COUNT(*) product_id 
    INTO sum_product_count_var
    FROM products;


	IF sum_product_count_var >= 18 THEN
		SELECT "The number of products is greater than or
				equal to 18." AS 'Count Message';
	ELSE
		SELECT "The number of products is less than 18." AS 'Count Message';
	END IF;
END//

CALL ProductCount();
        
