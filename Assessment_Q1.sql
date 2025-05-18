-- Question 1
-- Select database adashi_staging as database to work with
USE adashi_staging;


SELECT 
	-- Select id, full name, number of investment plans, saving plans
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    ROUND(SUM(s.confirmed_amount) / 100.0, 2) AS total_deposits  

-- Obtain intersecting records from savings, customers, plans tables
FROM users_customuser u
INNER JOIN savings_savingsaccount s ON u.id = s.owner_id AND s.confirmed_amount > 0
INNER JOIN plans_plan p ON u.id = p.owner_id AND p.is_a_fund = 1
WHERE s.id IS NOT NULL AND p.id IS NOT NULL

-- Finally group by id, first name and last name
GROUP BY u.id, u.first_name, u.last_name

-- sort in descending order by total deposit amount per customer
ORDER BY total_deposits DESC;
