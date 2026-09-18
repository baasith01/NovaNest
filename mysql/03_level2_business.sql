👨‍💼 CUSTOMER ANALYTICS
Query 1 → Which cities generate the biggest customer base?
SELECT city,

COUNT(*) AS total_customers

FROM customers

GROUP BY city

ORDER BY total_customers DESC;
Used for:

Market expansion decisions.

Query 2 → Premium vs Free users
SELECT subscription_type,

COUNT(*) AS total_users,

ROUND(

100*COUNT(*)/

(SELECT COUNT(*) FROM customers),

2

) AS percentage

FROM customers

GROUP BY subscription_type;
Used for:

Subscription strategy.

Query 3 → Which acquisition channel brings customers?
SELECT acquisition_channel,

COUNT(*) AS total_customers

FROM customers

GROUP BY acquisition_channel

ORDER BY total_customers DESC;
Used for:

Marketing budget allocation.

Query 4 → Customer personas by city
SELECT city,

persona,

COUNT(*) AS total

FROM customers

GROUP BY city,persona

ORDER BY city,total DESC;
Used for:

Hyperlocal targeting.

🍽️ RESTAURANT ANALYTICS
Query 5 → Top cuisines
SELECT cuisine_type,

COUNT(*) AS total_restaurants

FROM restaurants

GROUP BY cuisine_type

ORDER BY total_restaurants DESC;

Query 6 → Highest rated cuisines
SELECT cuisine_type,

ROUND(

AVG(avg_rating),

2

) AS avg_rating

FROM restaurants

GROUP BY cuisine_type

ORDER BY avg_rating DESC;

Query 7 → Restaurants per city
SELECT city,

COUNT(*) AS total_restaurants

FROM restaurants

GROUP BY city

ORDER BY total_restaurants DESC;

💰 FINANCIAL ANALYTICS
Query 8 → Total revenue
SELECT

SUM(final_amount)

AS total_revenue

FROM orders_table;

Query 9 → Average order value
SELECT

ROUND(

AVG(final_amount),

2

)

AS avg_order_value

FROM orders_table;

Query 10 → Total discounts
SELECT

SUM(discount_amount)

AS total_discount

FROM orders_table;

🚚 OPERATIONS ANALYTICS
Query 11 → Cancellation rate
SELECT

ROUND(

100*

SUM(

CASE

WHEN order_status='Cancelled'

THEN 1

ELSE 0

END

)

/

COUNT(*),

2

)

AS cancellation_rate

FROM orders_table;

Query 12 → Average delivery time
SELECT

ROUND(

AVG(delivery_duration),

2

)

AS avg_delivery_time

FROM deliveries;

Query 13 → Average delivery distance
SELECT

ROUND(

AVG(distance_km),

2

)

AS avg_delivery_distance

FROM deliveries;

💳 PAYMENT ANALYTICS
Query 14 → Payment method popularity
SELECT payment_method,

COUNT(*) AS total

FROM payments

GROUP BY payment_method

ORDER BY total DESC;
⭐ CUSTOMER EXPERIENCE ANALYTICS
Query 15 → Average ratings
SELECT

ROUND(

AVG(restaurant_rating),

2

)

AS restaurant_rating,

ROUND(

AVG(delivery_rating),

2

)

AS delivery_rating

FROM ratings_reviews;