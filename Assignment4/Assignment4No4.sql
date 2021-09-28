SELECT email_address, 
	   LENGTH(email_address) AS "Length", 
       LOCATE("@", email_address) AS "@",
       SUBSTRING(email_address, 1, LOCATE('@', email_address) -1) AS "Username",
       SUBSTRING(email_address, LOCATE('@', email_address) + 1) AS "Domain"
FROM customers