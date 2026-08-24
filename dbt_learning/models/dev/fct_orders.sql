with orders as (

    select *
    from {{ ref('stg_orders') }}

),

final as (

    select
        order_id,
        customer_id,
        order_date,
        order_status,
        store_id,
        shipping_fee,
        currency_code
    from orders

)

select *
from final