with stores as 
( 
	select * from {{ ref('stg_stores') }}
), 

dim_stores as ( 
select 
	store_id,
	store_name,
	city,
	country,
	region,
	opened_date
	
	from stores 
	) 

	select * from dim_stores