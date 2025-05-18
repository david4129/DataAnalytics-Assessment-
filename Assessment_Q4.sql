-- Question 4

-- Create customer transactions subquery number of transactions, total amount per customer and
WITH customer_transactions AS (
    SELECT 
        owner_id,
        COUNT(*) AS total_transactions,
        SUM(confirmed_amount) AS total_transaction_value
    FROM savings_savingsaccount
    GROUP BY owner_id
),

-- Create Common Table Expression tenure_calc to contain id, full name, duration
tenure_calc AS (
    SELECT 
        id AS customer_id,
        CONCAT(first_name, ' ', last_name) AS name,
        (YEAR(CURDATE()) * 12 + MONTH(CURDATE())) - (YEAR(date_joined) * 12 + MONTH(date_joined)) + 1 AS tenure_months
    FROM users_customuser
),

-- Create Common Table Expression clv_estimate
clv_estimate AS (
    SELECT 
        t.customer_id,
        t.name,
        tc.total_transactions,
        t.tenure_months,
        ROUND(
            ((tc.total_transactions / NULLIF(t.tenure_months, 0)) * 12 * ((tc.total_transaction_value * 0.001) / tc.total_transactions)) / 100.0,
            2
        ) AS estimated_clv
    FROM tenure_calc t
    INNER JOIN customer_transactions tc ON t.customer_id = tc.owner_id
)
SELECT 
    customer_id,
    name,
    tenure_months,
    total_transactions,
    estimated_clv
FROM clv_estimate
ORDER BY estimated_clv DESC;
