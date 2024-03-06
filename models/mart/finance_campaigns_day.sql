SELECT
*
FROM {{ ref('finance_days') }}
JOIN {{ ref('int_campaigns_day') }}
USING (date_date)
