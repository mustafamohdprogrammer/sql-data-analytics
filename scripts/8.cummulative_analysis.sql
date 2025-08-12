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

select
    order_date,
    total_Sales,
    sum(total_sales) over (partition by order_date order by order_date)  as runnning_total,
    AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
from(
    select
        DATETRUNC(month,order_date) as order_date,
        sum(sales_amount) as total_sales,
         AVG(price) AS avg_price
    from gold.fact_sales
    where order_date is not null
    group by DATETRUNC(month,order_date)
)t