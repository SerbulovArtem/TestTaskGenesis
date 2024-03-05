WITH FirstTrialUsers AS (
    SELECT DISTINCT user_id
    FROM zippy-athlete-416011.TestTaskProductAnalyst03052024.Task_3_1
    WHERE transaction_number = 1 AND trial = TRUE AND product_id = 'tenwords_1w_9.99_offer'
),
SecondTrialTransactions AS (
    SELECT DISTINCT t.user_id
    FROM zippy-athlete-416011.TestTaskProductAnalyst03052024.Task_3_1 t
    JOIN FirstTrialUsers tu ON t.user_id = tu.user_id
    WHERE t.transaction_number = 2 AND product_id = 'tenwords_1w_9.99_offer'
)
SELECT
    COUNT(DISTINCT ftu.user_id) AS first_trial_users_count,
    COUNT(DISTINCT stt.user_id) AS second_trial_transaction_users_count,
    NULLIF(COUNT(DISTINCT stt.user_id), 0) / COUNT(DISTINCT ftu.user_id) AS conversion_rate
FROM
    FirstTrialUsers ftu
LEFT JOIN
    SecondTrialTransactions stt ON ftu.user_id = stt.user_id;
