with customers as 
( 
	select * from {{ ref('stg_customers') }}
), 

dim_customers as ( 
select 
	customer_id,
	TRIM(first_name || ' ' || last_name AS full_name) AS full_name,
	email,
	phone, 
	country,
	city,
	signup_date
	
	from customers 
	) 
	select * from dim_customers
	


