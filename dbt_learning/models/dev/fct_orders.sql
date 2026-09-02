with orders as (

    select *
    from {{ ref('stg_orders') }}

),

order_items_rollup as (

    select
        order_id,
        count(order_item_id) as num_line_items,
        sum(quantity) as total_quantity,
        sum(net_amount) as net_revenue
    from {{ ref('fct_order_items') }}
    group by order_id

),

final as (

    select
        o.order_id,
        o.customer_id,
        o.store_id,
        o.order_date,
        o.order_status,
        o.shipping_fee,
        o.currency_code,
        r.num_line_items,
        r.total_quantity,
        r.net_revenue,
        r.net_revenue + o.shipping_fee as order_total
    from orders o
    left join order_items_rollup r
        on o.order_id = r.order_id

)

select *
from final