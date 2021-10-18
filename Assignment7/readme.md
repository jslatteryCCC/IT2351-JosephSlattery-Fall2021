# ASSIGNMENT 7 No. 1
## 1. If you were assigned the task of deleting a customer from the customers table as a database administrator,explain the logic you would implement to accomplish this task via a stored program in your readme.md file.

Include the type of stored program and the steps that would be required. 
+5 to include implementation in MySQL Workbench. 

A stored procedure that uses an input parameter to specify the customer_id that is to be deleted
seems like the right answer here. When the procedure is created, the integer passed into the procedure
will be assigned to a variable that would later be used in the DELETE statement as part of a WHERE
clause, wrapped up as a TRANSACTION to be safe.

I thought about the fact that the customer_id might be used in another table, like in the 'om' database
for example, and that the referential integrity might need to be addressed. That was the case, and I did need to delete the associated orders and order_details when removing the customer_id. I think, in a more realistic application, a better solution would need to be implemented. Maybe a table (or set of tables) to record deleted records would be a good idea, if a simple UPDATE procedure would not be the answer. But for this specific assignment, I was able to create the procedure and delete all associated records.

## 3. Events – pick one of the following two options: (15 points)
    a. Imagine you have a bakery business. Describe a situation where an event scheduler would be helpful in your business. +5 outline the code required for this event. 

I might like to use an event to insert a monthly record into a table that summarizes my sales and expenses for the previous month. This might actually be better as just a view, but maybe I want to access this data through another app...

### Assuming 
    -I have a table for all of my orders with a field for the order_date and a field for each order's total called 'order_total'
    -I have a table for all of my invoices/expenses with a field for the invoice_paid_date and a field for the invoice amount called 'invoice_total'
    -I have a table for monthly summaries called monthly_summary that has 3 columns:
        -month
        -revenues
        -expenses

### I've outlined the code below. I haven't tried it, and almost nothing I write is perfect on the first try, so I don't know what changes I might have to make to get it working right, but it seems like a useful idea.

CREATE EVENT monthly_summary
ON SCHEDULE EVERY 1 MONTH 
STARTS '2021-11-01'
DO BEGIN
    DECLARE sum_order_total_var;
    DECLARE sum_invoice_total_var;

    SELECT INTO sum_order_total_var
    SUM(order_total)
    FROM orders
    WHERE order_date > (NOW() - INTERVAL 1 MONTH) AND order_date < NOW();

    SELECT INTO sum_invoice_total_var
    SUM(invoice_total)
    FROM invoices
    WHERE invoice_date > (NOW() - INTERVAL 1 MONTH) AND invoice_date < NOW();

    INSERT INTO monthly_summary VALUES
    ((NOW() - 1 MONTH), sum_order_total_var, sum_invoice_total_var);

    END//



