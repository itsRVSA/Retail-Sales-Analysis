-- EDA-- 
DESCRIBE retail_sales;
-- TOTAL ROWS & CUSTOMERS
SELECT COUNT(*) AS total_transactions,
		COUNT(DISTINCT `Customer ID`) AS unique_customers
FROM retail_sales;
-- CHECK FOR NULL
SELECT SUM(`Date` IS NULL) AS null_dates,
		SUM(`Customer ID` IS NULL) AS null_customers,
        SUM(`Total Amount` IS NULL) AS null_sales
FROM retail_sales;
-- TOTAL REVENUE --  
SELECT ROUND(SUM(`Total Amount`), 2) AS total_revenue
FROM retail_sales;
-- MONTHLY REVENUE & TRENDS
SELECT date_format(`Date`, '%Y-%M') AS per_month_sales,
		ROUND(SUM(`Total Amount`), 2) AS total_revenue
FROM retail_sales
GROUP BY per_month_sales
ORDER BY per_month_sales;
-- AVERAGE ORDER VALUE (AOV)
SELECT ROUND(AVG(`Total Amount`), 2) AS avg_order_value
FROM  retail_sales;
-- REVENUE BY PRODUCT
SELECT `Product Category`,
		ROUND(SUM(`Total Amount`), 2) AS revenue
FROM retail_sales
GROUP BY `Product Category`
ORDER BY revenue DESC;
-- UNITS SOLD VS REVENUE
SELECT `Product Category`,
		SUM(quantity) AS total_units,
        ROUND(SUM(`Total Amount`), 2) AS revenue
FROM retail_sales
GROUP BY `Product Category`
ORDER BY revenue DESC;
-- HIGH VOLUME BUT LOW VALUE PRODUCTS
SELECT `Product Category`,
		SUM(quantity) AS units_sold,
        ROUND(SUM(`Total Amount`)/SUM(quantity), 2) AS AVG_PRICE
FROM retail_sales
GROUP BY `Product Category`
ORDER BY AVG_PRICE DESC;
-- TOP 10 SPENDING CUSTOMERS
SELECT `Customer ID`,
		ROUND(SUM(`Total Amount`), 2) AS total_spent
FROM retail_sales
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 10;
-- REPEAT VS ONE TIME CUSTOMERS
SELECT CASE
			WHEN COUNT(*) = 1 THEN 'ONE-TIME'
            ELSE 'REPEAT'
		END AS customer_type,
        COUNT(*) AS customer_count
FROM retail_sales
ORDER BY `Customer ID`;
-- REVENUE BY CUSTOMER TYPE         
SELECT customer_type,
		ROUND(SUM(total_spent), 2) AS revenue
FROM(
	 SELECT `Customer ID`,
				CASE
				WHEN COUNT(*) = 1 THEN 'ONE-TIME'
            ELSE 'REPEAT'
		END AS customer_type,
        SUM(`Total Amount`) AS total_spent
FROM retail_sales
GROUP BY `Customer ID`
)t
GROUP BY customer_type;
-- REVENUE BY GENDER 
 SELECT Gender,
			ROUND(SUM(`Total Amount`), 2) AS revenue
FROM retail_sales
GROUP BY Gender;
-- AGE Group analysis
SELECT
		CASE
        WHEN age < 25 THEN '<25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45+'
    END AS age_group,
    ROUND(SUM(`Total Amount`), 2) AS revenue
FROM retail_sales
GROUP BY age_group
ORDER BY revenue DESC;
-- BEST SALES DAY
SELECT 
		DAYNAME(Date) AS day,
        ROUND(SUM(`Total Amount`), 2) AS revenue
FROM retail_sales
GROUP BY day
ORDER BY revenue DESC;
-- HIGH VALUE OUTLIER TRANSACTION
SELECT * 
FROM retail_sales
WHERE `Total Amount` > (
SELECT AVG(`Total Amount`) + 3 * STDDEV(`Total Amount`)
FROM retail_sales
)
ORDER BY `Total Amount`DESC;

CREATE VIEW monthly_sales AS
SELECT
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(`Total Amount`) AS revenue
FROM retail_sales
GROUP BY month;

SELECT * FROM  monthly_sales;
