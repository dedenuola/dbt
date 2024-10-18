select id as customer_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    --amount stored as cents to be converted to dollars
    amount/100 as amount,
    created as created_at
from {{source("stripe","payments")}}