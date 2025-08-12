/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/
-- Which categories contribute the most to overall sales?

with overall_sales_total as (	
	select
		p.category,
		-- f.sales_amount,
		sum(f.sales_amount) as total_sales
	from gold.fact_sales f
	left join gold.dim_products p
	on f.product_key = p.product_key
	group by p.category
)
select 
	category,
	total_sales,
	sum(total_sales) over() [overall total],
	concat(round((cast(total_sales as float) / sum(total_sales) over () ) *100,2),'%') as percentage
from overall_sales_total
order by total_sales desc;