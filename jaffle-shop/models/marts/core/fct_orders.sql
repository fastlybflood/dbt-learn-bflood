WITH orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select 
        order_id
        , sum(payment_amount) as payment_amount 
    FROM {{ ref('stg_payments')}} 
    GROUP BY order_id
)

select 
o.order_id
, o.customer_id
, coalesce(payment_amount, 0) as payment_amount

FROM orders o 
left join 
payments p on o.order_id=p.order_id