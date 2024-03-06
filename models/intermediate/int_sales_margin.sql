select 
products_id,
orders_id,
date_date,
revenue,
purchase_price,
quantity,
round(revenue - (cast(purchase_price as float64) * quantity),2) AS margin,
round((cast(purchase_price as float64) * quantity) * quantity,2) As purchase_Cost
from {{ref("stg_gz_raw_data__raw_gz_sales")}}
left join {{ref("stg_gz_raw_data__raw_gz_product")}}
using(products_id)

