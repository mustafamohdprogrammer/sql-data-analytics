-- which 5 produts generated the highest revenue

select top 5
	p.product_name,
	sum(f.sales_amount) as total_revenue
from gold.fact_sales as f
left join gold.dim_products as p
on p.product_key = f.product_key
group by product_name


order by total_revenue desc;

-- What are the 5 worst-performing products in terms of sales


select top 5
	p.product_name,
	sum(f.sales_amount) as total_revenue
from gold.fact_sales as f
left join gold.dim_products as p
on p.product_key = f.product_key
group by product_name
order by total_revenue asc;

-- ranking using window function

select *
from (
	select
		p.product_name,
		sum(f.sales_amount) as total_revenue,
		rank() over (order by sum(f.sales_amount) desc) as rank_product 
	from gold.fact_sales as f
	left join gold.dim_products as p
	on p.product_key = f.product_key
	group by product_name
)t
where rank_product < 6
