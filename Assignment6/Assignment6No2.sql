/*******************************************************************
A script to insert a new category called 'Winds' into the categories
table.

Created by Joseph Slattery, Fall 2021
*******************************************************************/
USE joes_guitar_shop;

DROP PROCEDURE IF EXISTS InsertCategory;

DELIMITER //

CREATE PROCEDURE InsertCategory()
BEGIN

	DECLARE sql_error TINYINT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR 1062
		SET sql_error = TRUE;
        
	INSERT INTO categories VALUES (DEFAULT, 'Winds');
	
    IF sql_error = TRUE THEN
		SELECT 'Row was not inserted - duplicate entry.' AS 'Message';
	ELSE SELECT '1 row inserted.' AS 'Message';
    END IF;

END//
CALL InsertCategory();