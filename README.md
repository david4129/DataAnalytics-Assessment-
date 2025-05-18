# Data Analysis 

## Contents
* [Introduction](#intro)
* [Questions](#quest)
* [Solutions Explanation](#Analysis)
* [Challenges](#chall)

  
<a name = intro>  </a>
## Introduction
<p> The main focus of this project involves answering questions related to customer transactions and activities in the organization. In this project, we are going to answer 4 questions touching areas such as identifying high value customers, customer's activity and inactivity among others.  </p>
<p> This project was carried out using MySQL.</p>

<a name = quest>  </a>
## Questions
As stated earlier, we are going to answer 4 questions in this analysis. They are outlined below:
* High-Value Customers with Multiple Products
* Transaction Frequency Analysis
* Account Inactivity Alert
* Customer Lifetime Value (CLV) Estimation

<a name = Analysis>  </a>
## Solutions Explanation
### Question 1
This solution requires the use of inner joins, we join the plans, savings and customer tables using <b>inner joins</b>. We also use groupby statement to group by id, first name and last name. Finally we select the required features.

### Question 2
For Question 2, we make use of common table expressions to improve readability and optimize performance. We created common table expressions transactions_per_customer, frequency_analysis and categorized.
* transactions_per_customer contain number of transactions, number of active months
* frequency_analysis calculates the average number of transactions per month
* Our final common table expression is the categorized CTE which contains the frequency categories of our customer.

### Question 3
<p> We create 2 common table expressions(latest_savings and latest_investments) which obtain information from savings and investment data. The purpose of the common table expressions listed above is to identify customers with savings and investments.</p>
<p>We then combine the both Common Table Expressions using the <b>UNION ALL</b>, we then filter out active users using the **WHERE** statement and finally we select the required features. </p>

### Question 4
<p> We also make use of common table expressions <b>customer_transactions</b>, <b>tenure_calc</b> and <b>clv_estimate</b> </p> as well as <b>inner joins</b>. We start our analysis by creating CTE customer_transactions which makes use of the <b>Group by</b> statement to obtain the transaction amount by every user. On the other hand the <b>tenure_calc</b> stores the period of time from when the customer joined us. FInally, we select the required columns using the <b>Select</b> statement.

<a name = chall>  </a>
## Challenges
As exciting as the project was, it didn't come without challenges. The challenges are outlined as follows:
* Dataset Import: I had issues with the sql code that is responsible for generating the dataset. I had errors as MySQl client was always losing connection to the server. I fixed it by increasing timeout of my client side.
* SQL Code readability: Questions 2 - 4 were really complex and the codes were quite messy at first so I had to use common table expressions to improve readability and performance efficiency.
* Zero Divisibility Error: I encountered quite a bit of a roadblock when working on question 4, some denominators where 0 so I was getting an error. I fixed this by using the <b>NULLIF</b> statement.


