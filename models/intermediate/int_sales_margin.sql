SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchSE_PRICE AS FLOAT64), 
    ROUND(s.quantity*CAST(p.purchSE_PRICE AS FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchSE_PRICE AS FLOAT64),2) AS margin
FROM `sql-project-1st.dbt_walbassami.stg_raw__sales` s  
LEFT JOIN `sql-project-1st.dbt_walbassami.stg_raw__product` p
on s.pdt_id=p.products_id
