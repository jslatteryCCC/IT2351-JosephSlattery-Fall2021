/********************************************************************
A function to return the difference between the item_price and the 
discount amount.

Created by Joseph Slattery, Fall 2021
********************************************************************/

DELIMITER //

CREATE FUNCTION new_price
(
	item_id_param INT
)
RETURNS DECIMAL(10,2)

DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE discount_price_var DECIMAL(10,2);
    
	SELECT item_price - discount_amount 
    INTO discount_price_var
    FROM order_items
    WHERE item_id = item_id_param;
    
    RETURN(discount_price_var);

END//

