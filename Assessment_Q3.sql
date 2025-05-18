WITH latest_savings AS (
    SELECT 
        id AS plan_id,
        owner_id,
        'Savings' AS type,
        MAX(transaction_date) AS last_transaction_date
    FROM savings_savingsaccount
    GROUP BY id, owner_id
),
latest_investments AS (
    SELECT 
        id AS plan_id,
        owner_id,
        'Investment' AS type,
        GREATEST(
            COALESCE(last_charge_date, '1970-01-01'),
            COALESCE(next_charge_date, '1970-01-01'),
            COALESCE(last_returns_date, '1970-01-01')
        ) AS last_transaction_date
    FROM plans_plan
    WHERE is_a_fund = 1 OR is_regular_savings = 1
),
all_accounts AS (
    SELECT * FROM latest_savings
    UNION ALL
    SELECT * FROM latest_investments
)
SELECT 
    plan_id,
    owner_id,
    type,
    last_transaction_date,
    DATEDIFF(CURDATE(), last_transaction_date) AS inactivity_days
FROM all_accounts
WHERE last_transaction_date < CURDATE() - INTERVAL 365 DAY;
