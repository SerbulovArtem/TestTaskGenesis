SELECT 
    user_id
FROM 
    zippy-athlete-416011.TestTaskProductAnalyst03052024.Task_3_1
WHERE 
    transaction_number = 1 AND refunded = FALSE AND user_id IN (
        SELECT 
            user_id
        FROM 
            zippy-athlete-416011.TestTaskProductAnalyst03052024.Task_3_1
        WHERE 
            transaction_number = 2 AND refunded = TRUE
    );