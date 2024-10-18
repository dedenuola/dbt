with payment as(
    select * 
    from {{ref("stg_stripe_payments")}}
)

select order_id,
    sum(amount) as total_amount
from payment
group by 1
having total_amount < 0