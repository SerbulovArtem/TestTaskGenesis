CREATE TABLE zippy-athlete-416011.TestTaskProductAnalyst03052024.Task_3_1 AS
SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY purchase_date) AS transaction_number
FROM 
    zippy-athlete-416011.TestTaskProductAnalyst03052024.Transactions;
