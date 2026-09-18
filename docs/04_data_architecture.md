We are going to build 10 tables.

| Table No | Table Name      | Purpose                |
| -------- | --------------- | ---------------------- |
| 1        | customers       | Customer information   |
| 2        | restaurants     | Restaurant information |
| 3        | menu_items      | Food items             |
| 4        | app_events      | User app behavior      |
| 5        | orders          | Order information      |
| 6        | payments        | Payment information    |
| 7        | riders          | Rider information      |
| 8        | deliveries      | Delivery information   |
| 9        | promotions      | Discount campaigns     |
| 10       | ratings_reviews | Customer feedback      |
----------------------------------------------------------------------------------

TABLE 1 — CUSTOMERS

| Column              | Type    | Description          |
| ------------------- | ------- | -------------------- |
| customer_id         | Integer | Unique ID            |
| customer_name       | Text    | Name                 |
| age                 | Integer | Age                  |
| gender              | Text    | Male/Female          |
| city                | Text    | City                 |
| occupation          | Text    | Student/Professional |
| signup_date         | Date    | Joined date          |
| subscription_type   | Text    | Free/Premium         |
| acquisition_channel | Text    | Instagram/Referral   |
| customer_segment    | Text    | Low/Medium/High      |
--------------------------------------------------------------------------------

TABLE 2 — RESTAURANTS

| Column                | Type    |
| --------------------- | ------- |
| restaurant_id         | Integer |
| restaurant_name       | Text    |
| city                  | Text    |
| cuisine_type          | Text    |
| opening_year          | Integer |
| avg_rating            | Float   |
| delivery_radius_km    | Float   |
| commission_percentage | Float   |
-------------------------------------------------------------------------------

TABLE 3 — MENU ITEMS

| Column           | Type    |
| ---------------- | ------- |
| item_id          | Integer |
| restaurant_id    | Integer |
| item_name        | Text    |
| category         | Text    |
| price            | Float   |
| preparation_time | Integer |
-------------------------------------------------------------------------------

TABLE 4 — APP EVENTS

| Column      | Type     |
| ----------- | -------- |
| event_id    | Integer  |
| customer_id | Integer  |
| event_type  | Text     |
| timestamp   | Datetime |

Event types:

App Open

Restaurant View

Menu View

Add To Cart

Checkout

Payment

Order Complete
--------------------------------------------------------------------------------

TABLE 5 — ORDERS

| Column          | Type     |
| --------------- | -------- |
| order_id        | Integer  |
| customer_id     | Integer  |
| restaurant_id   | Integer  |
| rider_id        | Integer  |
| order_datetime  | Datetime |
| order_amount    | Float    |
| discount_amount | Float    |
| delivery_fee    | Float    |
| final_amount    | Float    |
| order_status    | Text     |
---------------------------------------------------------------------------------

TABLE 6 — PAYMENTS

| Column         | Type    |
| -------------- | ------- |
| payment_id     | Integer |
| order_id       | Integer |
| payment_method | Text    |
| payment_status | Text    |
--------------------------------------------------------------------------------

TABLE 7 — RIDERS

| Column       | Type    |
| ------------ | ------- |
| rider_id     | Integer |
| rider_name   | Text    |
| city         | Text    |
| joining_date | Date    |
| vehicle_type | Text    |
--------------------------------------------------------------------------------

TABLE 8 — DELIVERIES

| Column            | Type     |
| ----------------- | -------- |
| delivery_id       | Integer  |
| order_id          | Integer  |
| rider_id          | Integer  |
| pickup_time       | Datetime |
| delivery_time     | Datetime |
| delivery_duration | Integer  |
| distance_km       | Float    |
--------------------------------------------------------------------------------

TABLE 9 — PROMOTIONS

| Column              | Type    |
| ------------------- | ------- |
| promo_id            | Integer |
| promo_name          | Text    |
| promo_type          | Text    |
| discount_percentage | Float   |
---------------------------------------------------------------------------------

TABLE 10 — RATINGS_REVIEWS

| Column            | Type    |
| ----------------- | ------- |
| review_id         | Integer |
| order_id          | Integer |
| customer_id       | Integer |
| restaurant_rating | Float   |
| delivery_rating   | Float   |
----------------------------------------------------------------------------------

DATABASE RELATIONSHIP MAP:

customers
↓

orders

↓

restaurants

↓

deliveries

↓

riders

↓

ratings
-------------------------
Also:

customers

↓

app_events

↓

orders

↓

payments
-------------------------------------------------------------------------------