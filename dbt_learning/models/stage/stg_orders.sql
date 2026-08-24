with source as (

    select *
    from {{ ref('raw_orders') }}

),

cleaned as (

    select
        order_id::integer                         as order_id,
        trim(customer_id)::text                   as customer_id,
        order_date::date                          as order_date,
        lower(trim(status))::text                 as order_status,
        trim(store_id)::text                      as store_id,
        coalesce(shipping_fee, 0)::numeric(12, 2) as shipping_fee,
        cast(upper(trim(currency)) as varchar(3))  as currency_code
    from source

),

ranked as (

    select
        *,
        row_number() over (
            partition by order_id
            order by order_date desc
        ) as rn
    from cleaned

),

deduped as (

    select
        order_id,
        customer_id,
        order_date,
        order_status,
        store_id,
        shipping_fee,
        currency_code
    from ranked
    where rn = 1

)

select *
from deduped