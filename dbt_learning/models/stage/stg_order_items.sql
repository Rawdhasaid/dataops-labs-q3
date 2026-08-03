with source as (
	select * from {{ ref('raw_order_items') }} 
), 

cleaned_order_items as (
	select 
	order_item_id::integer as order_item_id,
	order_id :integer as order_id,
	trim(product_id)::text as product_id,
	cast(quantity as integer) as quantity, 
	cast(coalesce(unit_price, 0) as numeric(12,2)) as unit_price,
	cast(coalesce(discount_pct, 0) as numeric(12,2)) as discount_pct
	from source
	)
	select * from cleaned_order_items  