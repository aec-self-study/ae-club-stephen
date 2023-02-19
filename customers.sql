select distinct cust.id as customer_id, 
cust.name, 
cust.email, 
min(ord.created_at) over (partition by ord.customer_id) as first_order_at, 
count(ord.id) over (partition by ord.customer_id)   
from `analytics-engineers-club.coffee_shop.customers` cust 
left join analytics-engineers-club.coffee_shop.orders ord
on cust.id = ord.customer_id
order by first_order_at limit 5;