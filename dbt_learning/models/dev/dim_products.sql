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
	unit_margin = list_price - cost_price
	from products 
	) 
	select * from dim_products