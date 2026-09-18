
CREATE TABLE customers (

customer_id VARCHAR(20) PRIMARY KEY,

customer_name VARCHAR(100),

age INT,

gender VARCHAR(20),

city VARCHAR(50),

persona VARCHAR(50),

occupation VARCHAR(100),

signup_date DATE,

subscription_type VARCHAR(20),

acquisition_channel VARCHAR(100)

);

CREATE TABLE restaurants (

restaurant_id VARCHAR(20) PRIMARY KEY,

restaurant_name VARCHAR(100),

city VARCHAR(50),

restaurant_type VARCHAR(50),

cuisine_type VARCHAR(50),

opening_year INT,

avg_rating DECIMAL(3,1),

delivery_radius_km DECIMAL(4,1),

commission_percentage INT

);

CREATE TABLE menu_items (

item_id VARCHAR(20) PRIMARY KEY,

restaurant_id VARCHAR(20),

cuisine_type VARCHAR(50),

item_name VARCHAR(100),

price INT,

preparation_time INT

);
CREATE TABLE riders (

rider_id VARCHAR(20) PRIMARY KEY,

rider_name VARCHAR(100),

city VARCHAR(50),

vehicle_type VARCHAR(50),

experience_years INT,

joining_year INT,

shift_type VARCHAR(50)

);

CREATE TABLE orders_table (

order_id VARCHAR(20) PRIMARY KEY,

customer_id VARCHAR(20),

restaurant_id VARCHAR(20),

item_id VARCHAR(20),

rider_id VARCHAR(20),

order_datetime DATETIME,

quantity INT,

order_amount INT,

discount_amount INT,

delivery_fee INT,

final_amount INT,

order_status VARCHAR(20)

);

CREATE TABLE payments (

payment_id VARCHAR(20) PRIMARY KEY,

order_id VARCHAR(20),

payment_method VARCHAR(50),

payment_status VARCHAR(50)

);

CREATE TABLE deliveries (

delivery_id VARCHAR(20) PRIMARY KEY,

order_id VARCHAR(20),

rider_id VARCHAR(20),

distance_km DECIMAL(4,1),

delivery_duration INT

);
CREATE TABLE app_events (

event_id VARCHAR(20) PRIMARY KEY,

customer_id VARCHAR(20),

event_type VARCHAR(50)

);

CREATE TABLE ratings_reviews (

review_id VARCHAR(20) PRIMARY KEY,

order_id VARCHAR(20),

customer_id VARCHAR(20),

restaurant_rating INT,

delivery_rating INT

);

CREATE TABLE promotions (

promo_id VARCHAR(20) PRIMARY KEY,

promo_name VARCHAR(100),

promo_type VARCHAR(100),

discount_percentage INT,

campaign_budget INT

);