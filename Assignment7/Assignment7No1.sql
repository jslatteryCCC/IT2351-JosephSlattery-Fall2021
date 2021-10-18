USE om;

DROP PROCEDURE IF EXISTS deleteCustomer;

DELIMITER //

CREATE PROCEDURE deleteCustomer(
	customer_id_param 			int
)

BEGIN
	DECLARE sql_error TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
	
    START TRANSACTION;
    
    DELETE FROM order_details
    WHERE order_id IN
		(SELECT order_id
        FROM orders
        WHERE customer_id = customer_id_param);
    DELETE FROM orders
    WHERE customer_id = customer_id_param;
    DELETE FROM customers
    WHERE customer_id = customer_id_param;
    
    
    
    IF sql_error = FALSE THEN
		COMMIT;
		SELECT CONCAT("Customer ", customer_id_paramater, " has been successfully deleted.") AS 'Message:';
    ELSE
		ROLLBACK;
        SELECT "Operation could not be completed. Rolled back." AS 'Message: ';
	END IF;
END//