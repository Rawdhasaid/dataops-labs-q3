with products as 
( 
	select * from {{ ref('stg_products') }}
), 

dim_products as ( 
select 
	product_id,
	product_name,
	category,
	subcategory, 
	list_price - cost_price as unit_margin
	from products 
	) 
	select * from dim_products