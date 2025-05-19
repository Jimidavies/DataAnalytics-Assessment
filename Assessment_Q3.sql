WITH transaction_data AS (
    SELECT
        pp.owner_id,
        pp.id AS plan_id,
        ss.transaction_date,
        uc.email,
        IF(pp.is_regular_savings = 1, 'savings', 'investments') AS type
    FROM plans_plan pp
    INNER JOIN savings_savingsaccount ss ON ss.plan_id = pp.id
    INNER JOIN users_customuser uc ON uc.id = ss.owner_id
    WHERE (pp.is_regular_savings = 1 OR pp.is_fixed_investment = 1)
      AND uc.is_active = 1
),
ranked_transactions AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY owner_id ORDER BY transaction_date DESC) AS rn
    FROM transaction_data
)
SELECT
    owner_id,
    plan_id,
    transaction_date AS last_transaction_date,
    type,
    DATEDIFF(CURDATE(), transaction_date) AS inactive_days
FROM ranked_transactions
WHERE rn = 1 and DATEDIFF(CURDATE(), transaction_date) > 365;
