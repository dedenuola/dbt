-- tests/id_is_numeric.sql

select 
    count(case when regexp_contains(cast(customer_id as string), r'[^0-9]') then 1 end) as invalid_customer_count,
    count(case when regexp_contains(cast(order_id as string), r'[^0-9]') then 1 end) as invalid_order_count
from (
    select customer_id, null as order_id
    from {{ ref('stg_customers') }}

    union all

    select null as customer_id, order_id
    from {{ ref('stg_orders') }}
) as combined_ids
