👨‍💼 CUSTOMER + ORDERS
Query 1 → Which persona generates the most revenue?
SELECT

c.persona,

ROUND(

SUM(o.final_amount),

2

) AS total_revenue

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.persona

ORDER BY total_revenue DESC;

Query 2 → Which cities generate the highest revenue?
SELECT

c.city,

ROUND(

SUM(o.final_amount),

2

) AS total_revenue

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.city

ORDER BY total_revenue DESC;

Query 3 → Average order value by persona
SELECT

c.persona,

ROUND(

AVG(o.final_amount),

2

) AS avg_order_value

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.persona

ORDER BY avg_order_value DESC;

🍽️ RESTAURANTS + ORDERS
Query 4 → Top 10 revenue generating restaurants
SELECT

r.restaurant_name,

ROUND(

SUM(o.final_amount),

2

) AS revenue

FROM restaurants r

JOIN orders_table o

ON r.restaurant_id=o.restaurant_id

GROUP BY r.restaurant_name

ORDER BY revenue DESC

LIMIT 10;

Query 5 → Revenue by cuisine
SELECT

r.cuisine_type,

ROUND(

SUM(o.final_amount),

2

) AS revenue

FROM restaurants r

JOIN orders_table o

ON r.restaurant_id=o.restaurant_id

GROUP BY r.cuisine_type

ORDER BY revenue DESC;

Query 6 → Average rating by restaurant type
SELECT

restaurant_type,

ROUND(

AVG(avg_rating),

2

) AS avg_rating

FROM restaurants

GROUP BY restaurant_type

ORDER BY avg_rating DESC;

🚚 RIDERS + DELIVERIES
Query 7 → Riders with highest deliveries
SELECT

r.rider_name,

COUNT(*) AS total_deliveries

FROM riders r

JOIN deliveries d

ON r.rider_id=d.rider_id

GROUP BY r.rider_name

ORDER BY total_deliveries DESC

LIMIT 10;

Query 8 → Deliveries by city
SELECT

r.city,

COUNT(*) AS total_deliveries

FROM riders r

JOIN deliveries d

ON r.rider_id=d.rider_id

GROUP BY r.city

ORDER BY total_deliveries DESC;

💳 PAYMENTS + ORDERS
Query 9 → Revenue by payment method
SELECT

p.payment_method,

ROUND(

SUM(o.final_amount),

2

) AS revenue

FROM payments p

JOIN orders_table o

ON p.order_id=o.order_id

GROUP BY p.payment_method

ORDER BY revenue DESC;

Query 10 → Cancellation count by payment method
SELECT

p.payment_method,

COUNT(*) AS cancellations

FROM payments p

JOIN orders_table o

ON p.order_id=o.order_id

WHERE o.order_status='Cancelled'

GROUP BY p.payment_method

ORDER BY cancellations DESC;

⭐ RATINGS ANALYSIS
Query 11

Average ratings by city.

SELECT

c.city,

ROUND(

AVG(rr.restaurant_rating),

2

) AS avg_restaurant_rating,

ROUND(

AVG(rr.delivery_rating),

2

) AS avg_delivery_rating

FROM ratings_reviews rr

JOIN customers c

ON rr.customer_id=c.customer_id

GROUP BY c.city

ORDER BY avg_restaurant_rating DESC;

🍔 MENU ANALYSIS
Query 12

Most ordered food items.

SELECT

m.item_name,

COUNT(*) AS total_orders

FROM menu_items m

JOIN orders_table o

ON m.item_id=o.item_id

GROUP BY m.item_name

ORDER BY total_orders DESC

LIMIT 15;

📊 CUSTOMER VALUE ANALYSIS
Query 13

Top spending customers.

SELECT

c.customer_name,

ROUND(

SUM(o.final_amount),

2

) AS spending

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.customer_name

ORDER BY spending DESC

LIMIT 10;

🎯 CHALLENGE QUERIES
Query 14

Revenue by city and persona.

SELECT

c.city,

c.persona,

ROUND(

SUM(o.final_amount),

2

) AS revenue

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.city,c.persona

ORDER BY revenue DESC;

Query 15

Delivered orders by cuisine.

SELECT

r.cuisine_type,

COUNT(*) AS delivered_orders

FROM restaurants r

JOIN orders_table o

ON r.restaurant_id=o.restaurant_id

WHERE o.order_status='Delivered'

GROUP BY r.cuisine_type

ORDER BY delivered_orders DESC;

Query 16 → Which city has the highest average order value?

SELECT

c.city,

ROUND(

AVG(o.final_amount),

2

) AS avg_order_value

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.city

ORDER BY avg_order_value DESC;
Query 17 → Which acquisition channel generates the highest revenue?
Business Question

Which marketing channel is most profitable?

Tables Used

customers + orders_table

Concepts Used

JOIN + SUM + GROUP BY

SELECT

c.acquisition_channel,

ROUND(

SUM(o.final_amount),

2

) AS total_revenue

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.acquisition_channel

ORDER BY total_revenue DESC;
Query 18 → Which persona uses discounts the most?
Business Question

Which customer segment is discount dependent?

Tables Used

customers + orders_table

Concepts Used

JOIN + AVG + GROUP BY

SELECT

c.persona,

ROUND(

AVG(o.discount_amount),

2

) AS avg_discount

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

GROUP BY c.persona

ORDER BY avg_discount DESC;
Query 19 → Which city has the highest cancellations?
Business Question

Which city has operational issues?

Tables Used

customers + orders_table

Concepts Used

JOIN + WHERE + GROUP BY

SELECT

c.city,

COUNT(*) AS cancellations

FROM customers c

JOIN orders_table o

ON c.customer_id=o.customer_id

WHERE o.order_status='Cancelled'

GROUP BY c.city

ORDER BY cancellations DESC;
Query 20 → Which cuisine has the highest average revenue per order?
Business Question

Which cuisine generates premium spending?

Tables Used

restaurants + orders_table

Concepts Used

JOIN + AVG + GROUP BY

SELECT

r.cuisine_type,

ROUND(

AVG(o.final_amount),

2

) AS avg_revenue_per_order

FROM restaurants r

JOIN orders_table o

ON r.restaurant_id=o.restaurant_id

GROUP BY r.cuisine_type

ORDER BY avg_revenue_per_order DESC;