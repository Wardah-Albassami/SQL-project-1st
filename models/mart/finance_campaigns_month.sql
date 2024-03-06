WITH monthly_data AS
(
SELECT
*,
extract(month from date_date) AS month
FROM {{ ref('finance_campaigns_day') }}
)
SELECT 
month
    ,SUM(nb_transactions) AS monthly_nb_transactions
    ,ROUND(SUM(revenue),0) AS revenue 
    ,ROUND(AVG(average_basket),1) AS monthly_average_basket
    ,ROUND(SUM(revenue)/SUM(nb_transactions),1) AS monthly_average_basket_bis
    ,ROUND(SUM(margin),0) AS margin 
    ,ROUND(SUM(operational_margin),0) AS operational_margin 
    ,ROUND(SUM(purchase_cost),0) AS purchase_cost 
    ,ROUND(SUM(shipping_fee),0) AS shipping_fee 
    ,ROUND(SUM(logcost),0) AS log_cost 
    ,ROUND(SUM(ship_cost),0) AS ship_cost 
    ,SUM(quantity) AS quantity 
FROM monthly_data
GROUP BY month
ORDER BY month
