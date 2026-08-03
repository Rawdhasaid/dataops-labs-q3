with customers as 
( 
	select * from {{ ref('stg_customers') }}
), 

dim_customers as ( 
select 
	customer_id,
	TRIM(CONCAT(first_name, ' ', last_name)) AS full_name,
	customer_email,
	phone_number, 
	country,
	city,
	signup_date
	
	from customers 
	) 
	select * from dim_customers
	


