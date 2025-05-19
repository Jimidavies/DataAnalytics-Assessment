WITH monthly_transactions AS (
select owner_id, date_format(a.transaction_date, '%Y-%m') as tnx_month,
       count(*) as monthly_tnx_count
from savings_savingsaccount a
group by owner_id, tnx_month
),
average_txn_per_user AS (
    SELECT
        mt.owner_id,
        AVG(mt.monthly_tnx_count) AS avg_txn_per_month
    FROM monthly_transactions mt
    GROUP BY mt.owner_id
    ),
customer_frequency as (
    select owner_id,
        avg_txn_per_month,
        case
          when avg_txn_per_month >= 10 then 'High Frequency'
          when avg_txn_per_month between 3 and 9 then 'Medium Frequency'
          else 'Low Frequency'
          end as frequency_category
    from average_txn_per_user
 )
select frequency_category, count(*) as customer_count, avg(avg_txn_per_month) as avg_transactions_per_month

from customer_frequency group by frequency_category;