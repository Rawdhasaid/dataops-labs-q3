with source as (
	select * from {{ ref('raw_store_locations') }} 
), 

cleaned_store_locations as (
	select 
	trim(store_id)::text as store_id,
	trim(store_name)::text as store_name,
	INITCAP(trim(city))::text as city,
	INITCAP(trim(country))::text as country, 
	upper(trim(region))::text as region,
	cast(opened_date as date) as opened_date
	from source
	)
	select * from cleaned_store_locations 