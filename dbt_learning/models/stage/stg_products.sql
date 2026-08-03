with source as (
	select * from {{ ref('raw_products') }} 
), 

cleaned_products as (
	select 
	trim(product_id)::text as product_id,
	trim(product_name)::text as product_name,
	trim(category)::text as category,
	trim(subcategory)::text as subcategory, 
	cast(coalesce(cost_price, 0) as numeric(12,2)) as cost_price,
	cast(coalesce(list_price, 0) as numeric(12,2)) as list_price,
	cast(upper(trim(currency)) as varchar(3)) as currency_code,
	cast(launch_date as date) as launch_date,
	cast(is_active as boolean) as is_active
	from source
	)
	select * from cleaned_products  