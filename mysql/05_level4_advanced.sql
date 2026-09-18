SECTION A → CTE (Common Table Expressions)
Query 1

Top 10 customers by spending.

WITH customer_spending AS (

SELECT

customer_id,

SUM(final_amount) AS total_spending

FROM orders_table

GROUP BY customer_id

)

SELECT *

FROM customer_spending

ORDER BY total_spending DESC

LIMIT 10;
Query 2

High revenue cities.

WITH city_revenue AS (

SELECT

c.city,

SUM(o.final_amount) AS revenue

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.city

)

SELECT *

FROM city_revenue

WHERE revenue>

(

SELECT AVG(revenue)

FROM city_revenue

)

ORDER BY revenue DESC;
SECTION B → ROW_NUMBER
Query 3

Rank customers by spending.

SELECT

customer_id,

SUM(final_amount) AS spending,

ROW_NUMBER()

OVER(

ORDER BY

SUM(final_amount)

DESC

) AS row_num

FROM orders_table

GROUP BY customer_id;
SECTION C → RANK
Query 4

Rank cities by revenue.

SELECT

c.city,

SUM(o.final_amount) AS revenue,

RANK()

OVER(

ORDER BY

SUM(o.final_amount)

DESC

) AS city_rank

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.city;
SECTION D → DENSE_RANK
Query 5

Rank cuisines.

SELECT

r.cuisine_type,

SUM(o.final_amount) AS revenue,

DENSE_RANK()

OVER(

ORDER BY

SUM(o.final_amount)

DESC

) AS cuisine_rank

FROM restaurants r

JOIN orders_table o

ON r.restaurant_id=o.restaurant_id

GROUP BY r.cuisine_type;

SECTION E → LAG
Query 6 → Compare monthly revenue with previous month
WITH monthly_revenue AS (

SELECT

DATE_FORMAT(order_datetime,'%Y-%m') AS month,

SUM(final_amount) AS revenue

FROM orders_table

GROUP BY month

)

SELECT

month,

revenue,

LAG(revenue)

OVER(

ORDER BY month

) AS previous_month,

revenue -

LAG(revenue)

OVER(

ORDER BY month

) AS growth

FROM monthly_revenue;
Real use:

Month-over-month growth analysis.

🏆 SECTION F → LEAD
Query 7 → Compare current month with next month
WITH monthly_revenue AS (

SELECT

DATE_FORMAT(order_datetime,'%Y-%m') AS month,

SUM(final_amount) AS revenue

FROM orders_table

GROUP BY month

)

SELECT

month,

revenue,

LEAD(revenue)

OVER(

ORDER BY month

) AS next_month

FROM monthly_revenue;
🏆 SECTION G → Running Total
Query 8 → Cumulative revenue growth
WITH monthly_revenue AS (

SELECT

DATE_FORMAT(order_datetime,'%Y-%m') AS month,

SUM(final_amount) AS revenue

FROM orders_table

GROUP BY month

)

SELECT

month,

revenue,

SUM(revenue)

OVER(

ORDER BY month

) AS cumulative_revenue

FROM monthly_revenue;
🏆 SECTION H → Moving Average
Query 9 → 3-month moving average
WITH monthly_revenue AS (

SELECT

DATE_FORMAT(order_datetime,'%Y-%m') AS month,

SUM(final_amount) AS revenue

FROM orders_table

GROUP BY month

)

SELECT

month,

revenue,

ROUND(

AVG(revenue)

OVER(

ORDER BY month

ROWS BETWEEN 2 PRECEDING

AND CURRENT ROW

),

2

) AS moving_avg

FROM monthly_revenue;
🏆 SECTION I → NTILE
Query 10 → Customer segmentation into quartiles
SELECT

customer_id,

SUM(final_amount) AS spending,

NTILE(4)

OVER(

ORDER BY

SUM(final_amount)

DESC

) AS customer_segment

FROM orders_table

GROUP BY customer_id;
🏆 SECTION J → TOP 3 RESTAURANTS PER CITY
Query 11
WITH restaurant_revenue AS (

SELECT

r.city,

r.restaurant_name,

SUM(o.final_amount) AS revenue,

ROW_NUMBER()

OVER(

PARTITION BY r.city

ORDER BY

SUM(o.final_amount)

DESC

) AS rn

FROM restaurants r

JOIN orders_table o

ON r.restaurant_id=o.restaurant_id

GROUP BY

r.city,

r.restaurant_name

)

SELECT *

FROM restaurant_revenue

WHERE rn<=3;
🏆 Query 12 → Top spending customer per city
WITH customer_city AS (

SELECT

c.city,

c.customer_name,

SUM(o.final_amount) AS spending,

ROW_NUMBER()

OVER(

PARTITION BY c.city

ORDER BY

SUM(o.final_amount)

DESC

) AS rn

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY

c.city,

c.customer_name

)

SELECT *

FROM customer_city

WHERE rn=1;
🏆 Query 13 → Revenue contribution percentage by city
SELECT

c.city,

ROUND(

SUM(o.final_amount),

2

) AS revenue,

ROUND(

100*

SUM(o.final_amount)

/

SUM(

SUM(o.final_amount)

)

OVER(),

2

)

AS contribution_percentage

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.city

ORDER BY revenue DESC;
🏆 Query 14 → Revenue contribution by persona
SELECT

c.persona,

ROUND(

SUM(o.final_amount),

2

) AS revenue,

ROUND(

100*

SUM(o.final_amount)

/

SUM(

SUM(o.final_amount)

)

OVER(),

2

)

AS contribution_percentage

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.persona;
🏆 Query 15 → Customer lifetime value (CLV)
SELECT

customer_id,

COUNT(*) AS total_orders,

ROUND(

SUM(final_amount),

2

) AS lifetime_value

FROM orders_table

GROUP BY customer_id

ORDER BY lifetime_value DESC;