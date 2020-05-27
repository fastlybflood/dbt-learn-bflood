select 
id as payment_id,
"orderID" as order_id,
"paymentMethod" as payment_method,
AMOUNT as payment_amount,
CREATED as order_created_date
from {{ source('stripe', 'payment') }}