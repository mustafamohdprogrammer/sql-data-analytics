-- analyze sales over time

select
	-- year(order_date) as order_year,
	sum(sales_amount) as total_sales,
	month(order_date) as order_month
from gold.fact_sales
where order_date is not null
-- group by year(order_date)
-- order by year(order_date)
group by month(order_date)
order by month(order_date)

-- DATETRUNC()
SELECT
    DATETRUNC(month, order_date) AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date);

-- DATETRUNC()
SELECT
    DATETRUNC(year, order_date) AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
ORDER BY DATETRUNC(year, order_date);