select b.owner_id, concat(a.first_name, ' ', a.last_name) as name, b.savings_count,
       c.investment_count, d.total_deposits

from users_customuser a inner join

(select owner_id, count(*) as savings_count
 from plans_plan
 where is_regular_savings = 1 group by owner_id) b on a.id = b.owner_id
    inner join
(select owner_id, count(*) as investment_count
 from plans_plan
 where is_a_fund = 1
 group by owner_id) c on c.owner_id = b.owner_id inner join

(select owner_id, SUM(confirmed_amount) AS total_deposits
from savings_savingsaccount
WHERE
  confirmed_amount > 0
  AND transaction_status = 'success'
GROUP BY
  owner_id) d on d.owner_id = c.owner_id order by d.total_deposits desc;