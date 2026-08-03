

SELECT
    oi.order_item_id,
    o.customer_id,
    o.store_id,
    o.order_date,
    o.order_status,
    p.cost_price,
    oi.quantity * oi.unit_price AS gross_amount,
    oi.quantity * oi.unit_price * oi.discount_pct / 100 AS discount_amount,
    oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100) AS net_amount,
    oi.quantity * p.cost_price AS total_cost,
    net_amount - total_cost AS margin

FROM {{ ref('stg_order_items') }} oi
JOIN {{ ref('stg_orders') }} o
    ON oi.order_id = o.order_id
JOIN {{ ref('stg_products') }} p
    ON oi.product_id = p.product_id