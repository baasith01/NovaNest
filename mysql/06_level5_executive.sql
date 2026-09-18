Query 1 → Which city should NovaNest expand aggressively?

WITH city_customers AS (

SELECT

city,

COUNT(*) AS customer_count

FROM customers

GROUP BY city

),

city_restaurants AS (

SELECT

city,

COUNT(*) AS restaurant_count

FROM restaurants

GROUP BY city

),

city_revenue AS (

SELECT

c.city,

SUM(o.final_amount) AS revenue

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.city

)

SELECT

cc.city,

cc.customer_count,

cr.restaurant_count,

ROUND(cv.revenue,2) AS revenue

FROM city_customers cc

JOIN city_restaurants cr

ON cc.city=cr.city

JOIN city_revenue cv

ON cc.city=cv.city

ORDER BY revenue DESC;
🏆 Query 2 → Which persona is most valuable?
SELECT

c.persona,

COUNT(*) AS total_orders,

ROUND(

AVG(o.final_amount),

2

) AS avg_order_value,

ROUND(

SUM(o.final_amount),

2

) AS revenue

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.persona

ORDER BY revenue DESC;
🏆 Query 3 → Which acquisition channel gives highest ROI?
SELECT

c.acquisition_channel,

COUNT(*) AS customers,

ROUND(

SUM(o.final_amount),

2

) AS revenue

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.acquisition_channel

ORDER BY revenue DESC;
🏆 Query 4 → Which cities have operational risk?
SELECT

c.city,

COUNT(*) AS cancellations

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

WHERE o.order_status='Cancelled'

GROUP BY c.city

ORDER BY cancellations DESC;
🏆 Query 5 → Which cuisines deserve investment?
SELECT

r.cuisine_type,

COUNT(*) AS total_orders,

ROUND(

SUM(o.final_amount),

2

) AS revenue

FROM restaurants r

JOIN orders_table o

ON r.restaurant_id=o.restaurant_id

GROUP BY r.cuisine_type

ORDER BY revenue DESC;
🏆 Query 6 → Which restaurants are underperforming?
SELECT

r.restaurant_name,

r.avg_rating,

ROUND(

SUM(o.final_amount),

2

) AS revenue

FROM restaurants r

JOIN orders_table o

ON r.restaurant_id=o.restaurant_id

GROUP BY

r.restaurant_name,

r.avg_rating

HAVING revenue<50000

ORDER BY revenue;
🏆 Query 7 → Executive KPI Dashboard Query
SELECT

COUNT(DISTINCT customer_id)

AS total_customers,

COUNT(DISTINCT restaurant_id)

AS total_restaurants,

COUNT(*) AS total_orders,

ROUND(

SUM(final_amount),

2

) AS total_revenue,

ROUND(

AVG(final_amount),

2

) AS avg_order_value

FROM orders_table;
🏆 Query 8 → Premium Conversion Opportunity
SELECT

subscription_type,

COUNT(*) AS customers

FROM customers

GROUP BY subscription_type;
🏆 Query 9 → Delivery Optimization
SELECT

r.city,

ROUND(

AVG(d.delivery_duration),

2

) AS avg_delivery_time

FROM riders r

JOIN deliveries d

ON r.rider_id=d.rider_id

GROUP BY r.city

ORDER BY avg_delivery_time DESC;
🏆 Query 10 → CEO Summary Query
SELECT

ROUND(

SUM(final_amount),

2

) AS revenue,

ROUND(

AVG(final_amount),

2

) AS aov,

ROUND(

AVG(discount_amount),

2

) AS avg_discount

FROM orders_table;