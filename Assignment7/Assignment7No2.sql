USE joes_guitar_shop;

DELIMITER //

DROP TRIGGER IF EXISTS products_before_update;

CREATE TRIGGER products_before_update
	BEFORE UPDATE ON products
    FOR EACH ROW
BEGIN 
	DECLARE list_price_var DECIMAL(9,2);
    
	SELECT NEW.list_price
    INTO list_price_var;
    
    IF list_price_var > 1200 OR list_price_var < 100 THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = 'List price may not be greater than 1200 or less than 100.';
	END IF;
END//