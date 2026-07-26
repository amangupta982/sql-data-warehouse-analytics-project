/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculate the total sales per month 
-- and the running total of sales over time 
SELECT 
 order_year , order_month,
 total_sales_amount,
 SUM(total_sales_amount) OVER (ORDER BY order_year,order_month) AS running_total_sales,
 AVG(total_sales_amount) OVER (ORDER BY order_year,order_month) AS running_average_sales 
 FROM
(SELECT 
	YEAR(order_date) AS order_year,
	MONTH(order_date) AS order_month,
	SUM(sales_amount) AS total_sales_amount
	FROM fact_sales WHERE order_date IS NOT NULL
	GROUP BY order_year ,order_month
	ORDER BY order_year ,order_month) t