with source as (
	select * from {{ ref('raw_customers') }} 
), 

cleaned as (
	select 
	trim(customer_id)::text as customer_id,
	INITCAP(trim(first_name))::text as first_name,
	INITCAP(trim(last_name))::text as last_name,
	coalesce(trim(email)::text, 'N/A') as customer_email,
	coalesce(trim(phone)::text, 'N/A') as phone_number,
	cast(signup_date as date) as signup_date,
	trim(country)::text as country, 
	trim(city)::text as city
	from source
	)
	select * from cleaned 