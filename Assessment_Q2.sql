USE adashi_staging;
WITH transactions_per_customer AS (
    SELECT 
        owner_id,
        COUNT(*) AS total_transactions,
        (YEAR(MAX(transaction_date)) * 12 + MONTH(MAX(transaction_date))) -
        (YEAR(MIN(transaction_date)) * 12 + MONTH(MIN(transaction_date))) + 1 AS months_active
    FROM savings_savingsaccount
    GROUP BY owner_id
),
frequency_analysis AS (
    SELECT 
        owner_id,
        (total_transactions * 1.0 / NULLIF(months_active, 0)) AS avg_transactions_per_month
    FROM transactions_per_customer
),
categorized AS (
    SELECT 
        CASE 
            WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
            WHEN avg_transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category,
        avg_transactions_per_month
    FROM frequency_analysis
)
SELECT 
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_transactions_per_month), 1) AS avg_transactions_per_month
FROM categorized
GROUP BY frequency_category;
