RETENTION ANALYSIS (3 QUERIES)
Query 1 → Repeat Customer Analysis

Business Question

How many customers came back and ordered again?

SELECT

customer_id,

COUNT(*) AS total_orders

FROM orders_table

GROUP BY customer_id

HAVING total_orders>1

ORDER BY total_orders DESC;
Query 2 → Retention Percentage

Business Question

How many customers are retained?

SELECT

ROUND(

100*

COUNT(

DISTINCT

CASE

WHEN total_orders>1

THEN customer_id

END

)

/

COUNT(

DISTINCT customer_id

),

2

)

AS retention_rate

FROM(

SELECT

customer_id,

COUNT(*) AS total_orders

FROM orders_table

GROUP BY customer_id

)t;
Query 3 → One-time vs Repeat Customers
SELECT

CASE

WHEN total_orders=1

THEN 'One Time'

ELSE 'Repeat'

END AS customer_type,

COUNT(*) AS customers

FROM(

SELECT

customer_id,

COUNT(*) AS total_orders

FROM orders_table

GROUP BY customer_id

)t

GROUP BY customer_type;
🥈 CHURN ANALYSIS (3 QUERIES)
Query 4 → Inactive Customers

Customers who ordered only once.

SELECT

customer_id

FROM orders_table

GROUP BY customer_id

HAVING COUNT(*)=1;
Query 5 → Churn Percentage
SELECT

ROUND(

100*

SUM(

CASE

WHEN total_orders=1

THEN 1

ELSE 0

END

)

/

COUNT(*),

2

)

AS churn_rate

FROM(

SELECT

customer_id,

COUNT(*) AS total_orders

FROM orders_table

GROUP BY customer_id

)t;
Query 6 → Churn by Persona
SELECT

c.persona,

COUNT(*) AS churned_customers

FROM customers c

JOIN(

SELECT

customer_id

FROM orders_table

GROUP BY customer_id

HAVING COUNT(*)=1

)t

ON c.customer_id=t.customer_id

GROUP BY c.persona

ORDER BY churned_customers DESC;
🥉 COHORT ANALYSIS (4 QUERIES)

This is a highly valuable concept.

Query 7 → Customer Signup Cohorts
SELECT

DATE_FORMAT(

signup_date,

'%Y-%m'

) AS cohort_month,

COUNT(*) AS customers

FROM customers

GROUP BY cohort_month

ORDER BY cohort_month;
Query 8 → Monthly Revenue Cohorts
SELECT

DATE_FORMAT(

order_datetime,

'%Y-%m'

) AS month,

SUM(final_amount)

AS revenue

FROM orders_table

GROUP BY month

ORDER BY month;
Query 9 → Average Revenue Per Month
SELECT

DATE_FORMAT(

order_datetime,

'%Y-%m'

) AS month,

ROUND(

AVG(final_amount),

2

)

AS avg_revenue

FROM orders_table

GROUP BY month;
Query 10 → Monthly Customer Growth
SELECT

DATE_FORMAT(

signup_date,

'%Y-%m'

) AS month,

COUNT(*) AS new_customers

FROM customers

GROUP BY month

ORDER BY month;
🏅 RFM ANALYSIS (3 QUERIES)

This is SUPER valuable.

R = Recency

F = Frequency

M = Monetary

Query 11
SELECT

customer_id,

DATEDIFF(

CURDATE(),

MAX(order_datetime)

)

AS recency,

COUNT(*) AS frequency,

SUM(final_amount)

AS monetary

FROM orders_table

GROUP BY customer_id

ORDER BY monetary DESC;
Query 12 → Top Valuable Customers
SELECT

customer_id,

SUM(final_amount)

AS spending

FROM orders_table

GROUP BY customer_id

ORDER BY spending DESC

LIMIT 20;
Query 13 → Customer Segments
SELECT

customer_id,

COUNT(*) AS frequency,

CASE

WHEN COUNT(*)>=20

THEN 'VIP'

WHEN COUNT(*)>=10

THEN 'Regular'

ELSE 'Occasional'

END AS segment

FROM orders_table

GROUP BY customer_id;
🏅 FUNNEL ANALYSIS (3 QUERIES)

Uses app_events.

Query 14 → Funnel Counts
SELECT

event_type,

COUNT(*) AS total_events

FROM app_events

GROUP BY event_type

ORDER BY total_events DESC;
Query 15 → Funnel Conversion Percentage
SELECT

event_type,

COUNT(*) AS total_events,

ROUND(

100*

COUNT(*)

/

SUM(

COUNT(*)

)

OVER(),

2

)

AS percentage

FROM app_events

GROUP BY event_type;
Query 16 → Unique Customers Per Funnel Stage
SELECT

event_type,

COUNT(

DISTINCT customer_id

)

AS unique_customers

FROM app_events

GROUP BY event_type;