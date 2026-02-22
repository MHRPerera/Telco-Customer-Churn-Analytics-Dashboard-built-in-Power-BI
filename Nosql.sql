--Total Customers
SELECT COUNT(*) AS total_customers
FROM churn_data;

--Churned Customers
SELECT COUNT(*) AS churned_customers
FROM churn_data
WHERE Churn = 'Yes';

--Churned Customers precentage
SELECT 
ROUND(
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
    2
) AS churn_rate_percentage
FROM churn_data;

--Churn Rate %
SELECT 
ROUND(
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END)::NUMERIC * 100 
    / COUNT(*)::NUMERIC,
    2
) AS churn_rate_percentage
FROM churn_data;

--Average Monthly Charges
SELECT 
ROUND(AVG(MonthlyCharges)::NUMERIC, 2) AS avg_monthly_charges
FROM churn_data;

--Revenue at Risk (Churned Customers)
SELECT 
ROUND(SUM(MonthlyCharges)::NUMERIC, 2) AS revenue_at_risk
FROM churn_data
WHERE Churn = 'Yes';

--Churn Distribution 
SELECT 
    Churn,
    COUNT(*) AS customer_count
FROM churn_data
GROUP BY Churn;

--Churn Distribution by Contract
SELECT 
    Contract,
    Churn,
    COUNT(*) AS customer_count
FROM churn_data
GROUP BY Contract, Churn
ORDER BY Contract;

--Customer Count by Gender & Churn
SELECT 
    gender,
    Churn,
    COUNT(*) AS customer_count
FROM churn_data
GROUP BY gender, Churn
ORDER BY gender;

--Churn by Payment Method
SELECT 
    PaymentMethod,
    COUNT(*) AS churn_count
FROM churn_data
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY churn_count DESC;

--Avg Monthly Charges by Churned vs Non-Churned
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges)::NUMERIC, 2) AS avg_monthly_charges
FROM churn_data
GROUP BY Churn;





