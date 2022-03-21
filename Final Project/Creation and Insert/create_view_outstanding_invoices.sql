DROP VIEW IF EXISTS outstanding_invoices;

CREATE VIEW outstanding_invoices AS
SELECT invoice_id AS "Invoice ID", 
       invoice_date AS "Invoice Date",
       invoice_terms AS "Payment Terms",
       DATE_ADD(invoice_date, INTERVAL invoice_terms DAY) AS "Invoice Due Date",
       invoice_total - invoice_payment AS "Balance Due", 
       invoice_payment_date AS "Payment Date", 
       vendor_name AS "Vendor Name", 
       vendor_address AS "Vendor Address", 
       vendor_city AS "City", 
       vendor_state AS "State", 
       vendor_phone AS "Phone",
       vendor_email AS "Email" 
       FROM invoices i
INNER JOIN vendors v ON i.vendor_id = v.vendor_id
WHERE (invoice_total - invoice_payment != 0)

