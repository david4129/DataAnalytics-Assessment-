# Data Analysis Assesment

## Contents
* [Introduction](#intro)
* [Questions](#quest)
* [Solutions Explanation](#Analysis)
* [Challenges](#chall)

  
<a name = intro>  </a>
## Introduction
<p> The primary objective of this project is to analyze customer transactions and activities within the organization using <b>MYSQl</b> as the core tool for data processing and analysis. </p>

<p> The project focuses on addressing four key questions, which cover areas such as:

* Identifying high-value customers

* Understanding customer activity patterns

* Detecting customer inactivity

* Gaining insights into customer behavior trends

These questions help uncover actionable insights that can guide decision-making in marketing, customer retention, and operational strategies.  </p>

<a name = quest>  </a>
## Questions
As previously mentioned, this analysis focuses on answering four key questions related to customer behavior and transactions. These are outlined below:
* High-Value Customers with Multiple Products
  Identify customers who generate high value for the organization and are engaged with multiple products or services.
* Transaction Frequency Analysis
  Analyze how frequently customers carry out transactions to uncover patterns of engagement and spending behavior.
* Account Inactivity Alert
  Detect customers who have shown little to no activity over a specified period, potentially indicating churn or disengagement.
* Customer Lifetime Value (CLV) Estimation
  Estimate the long-term value of customers based on their transaction history, helping prioritize retention and marketing efforts.

<a name = Analysis>  </a>
## Solutions Explanation
### Question 1
<p>This solution uses INNER JOINs to combine the plans, savings, and customer tables. By joining these tables, we consolidate relevant information about each customer’s engagement with different products.</p>

<p>We then apply a GROUP BY clause on the customer’s id, first_name, and last_name to aggregate the data at the individual level. Finally, we select the necessary features to identify high-value customers using multiple products.</p>

### Question 2
To improve query readability and performance, this solution uses Common Table Expressions (CTEs). We define the following CTEs:

* transactions_per_customer: Calculates the total number of transactions and active months per customer.

* frequency_analysis: Derives the average number of transactions per month for each customer.

* categorized: Assigns customers into frequency categories (e.g., low, medium, high) based on their transaction behavior.

These CTEs help break the problem into manageable steps, ultimately leading to a categorized frequency profile for each customer.

### Question 3
<p>We define two CTEs: latest_savings and latest_investments. These extract the most recent activity data from the savings and investments tables to identify last engagement dates for each customer.</p>

<p>Next, we combine both CTEs using a UNION ALL to create a unified activity view. A WHERE clause is then applied to filter for users who have shown no recent activity (based on defined criteria for inactivity). The final step involves selecting the relevant customer details for reporting.</p>

### Question 4
This solution involves the use of CTEs and INNER JOINs. The steps include:

customer_transactions: Aggregates the total transaction amounts for each customer using a GROUP BY clause.

tenure_calc: Calculates the duration (or tenure) of each customer from their join date to the current date.

clv_estimate: Combines transaction value and tenure to estimate the Customer Lifetime Value.

Finally, we select the appropriate columns to present a comprehensive CLV estimate for each customer.


<a name = chall>  </a>
## Challenges
As exciting and insightful as this project was, it did come with a few challenges. These are outlined below:
* Dataset Import: During the initial phase, I faced difficulties importing the dataset into MySQL. The SQL script responsible for generating the dataset often failed due to the MySQL client losing connection to the server. I resolved this by increasing the client-side timeout settings, which allowed the full dataset to load successfully.
* SQL Code readability: The SQL queries for Questions 2 through 4 were initially quite complex and difficult to read. Managing nested queries and maintaining performance was challenging. To address this, I refactored the code using **Common Table Expressions (CTEs)**, which significantly improved both readability and execution efficiency.
* Zero Divisibility Error: While working on Question 4 (Customer Lifetime Value estimation), I encountered a division-by-zero error due to some denominators being zero. I handled this by using the **NULLIF()** function, which safely avoids division when the denominator is zero, preventing runtime errors and ensuring accurate results.


