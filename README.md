# 🍔 NovaNest — Food Delivery Analytics Platform

An end-to-end **Food Delivery Analytics Platform** built to analyze customer behavior, restaurant performance, delivery operations, and financial performance using **Python, MySQL, SQL, and Power BI**.

The project simulates a real-world food delivery business similar to platforms such as Swiggy and Zomato, transforming raw order data into actionable business insights through data cleaning, ETL, SQL analytics, data modeling, and interactive dashboards.

---

## 📌 Project Overview

Food delivery businesses generate large volumes of transactional data across customers, restaurants, orders, deliveries, payments, and locations.

**NovaNest** was developed to answer key business questions such as:

* Who are our most valuable customers?
* Which restaurants generate the highest revenue?
* Which areas have the highest order demand?
* How efficiently are orders being delivered?
* What are the major revenue and cost drivers?
* Which customer segments require attention?
* How can operational performance be improved?

The project processes approximately **49,971 orders** and converts the raw data into four business-focused Power BI dashboards.

---

## 🎯 Objectives

* Analyze customer purchasing behavior
* Identify high-performing and underperforming restaurants
* Measure delivery and operational efficiency
* Analyze revenue and financial performance
* Build reusable SQL analytics
* Create interactive Power BI dashboards
* Generate actionable business recommendations

---

## 🛠️ Tech Stack

| Technology       | Purpose                                               |
| ---------------- | ----------------------------------------------------- |
| **Python**       | Data generation, cleaning, preprocessing and analysis |
| **Pandas**       | Data manipulation and transformation                  |
| **MySQL**        | Data storage and querying                             |
| **SQL**          | Business analytics and KPI calculation                |
| **Power BI**     | Data modeling, visualization and dashboards           |
| **DAX**          | Measures and calculated KPIs                          |
| **Git & GitHub** | Version control and project management                |

---

## 🔄 End-to-End Data Pipeline

```text
Raw Data
   ↓
Python
   ↓
Data Cleaning & Preprocessing
   ↓
ETL
   ↓
MySQL Database
   ↓
SQL Analysis
   ↓
Power BI Data Model
   ↓
DAX Measures
   ↓
Interactive Dashboards
   ↓
Business Insights
   ↓
Recommendations
```

---

# 📊 Dashboards

## 1. 👥 Customer Intelligence

Focuses on customer behavior and purchasing patterns.

### Key Metrics

* Total Customers
* Total Orders
* Average Order Value
* Orders per Customer
* Customer Revenue Contribution
* Repeat Customer Rate

### Analysis

* Customer segmentation
* Order frequency
* Customer spending behavior
* High-value customers
* Customer location patterns
* Repeat vs. non-repeat customers

---

## 2. 🍽️ Restaurant Intelligence

Analyzes restaurant-level performance.

### Key Metrics

* Total Restaurants
* Orders per Restaurant
* Restaurant Revenue
* Average Order Value
* Average Rating
* Top Performing Restaurants

### Analysis

* Revenue by restaurant
* Orders by restaurant
* Restaurant ratings
* Restaurant performance comparison
* High-performing restaurant categories
* Location-wise restaurant performance

---

## 3. 🚚 Operations Intelligence

Analyzes the operational side of food delivery.

### Key Metrics

* Total Orders
* Average Delivery Time
* On-Time Delivery Rate
* Cancelled Orders
* Delivery Performance
* Orders by Location

### Analysis

* Delivery time trends
* Delivery performance by location
* Order status distribution
* Cancellation patterns
* Peak ordering periods
* Operational bottlenecks

---

## 4. 💰 Financial Intelligence

Provides an overview of the financial performance of the platform.

### Key Metrics

* Total Revenue
* Average Order Value
* Revenue by Restaurant
* Revenue by Location
* Order Value Distribution
* Financial Trends

### Analysis

* Revenue trends
* Revenue contribution by restaurant
* Revenue by location
* Order value patterns
* High-revenue segments
* Financial performance indicators

---

# 🧹 Data Cleaning & Preparation

Python was used to prepare the raw datasets before loading them into MySQL.

### Major preprocessing steps

* Handled missing values
* Removed duplicate records
* Standardized column names
* Corrected data types
* Converted date/time fields
* Validated categorical values
* Checked inconsistent records
* Created derived columns
* Performed data quality checks

Example workflow:

```python
import pandas as pd

df = pd.read_csv("orders.csv")

df.drop_duplicates(inplace=True)

df["order_date"] = pd.to_datetime(df["order_date"])

df["order_amount"] = pd.to_numeric(
    df["order_amount"],
    errors="coerce"
)

df = df.dropna(
    subset=["customer_id", "restaurant_id"]
)
```

---

# 🗄️ Database Design

The cleaned data was loaded into **MySQL** for structured storage and analysis.

A relational approach was used to organize information related to:

```text
Customers
    │
    └── Orders
           │
           ├── Restaurants
           │
           ├── Deliveries
           │
           └── Payments
```

The database structure enables analytical queries across customers, restaurants, orders, delivery operations, and financial metrics.

---

# 🔍 SQL Analysis

SQL was used to answer business questions and create analytical datasets.

Examples of analysis performed:

### Top Restaurants by Revenue

```sql
SELECT
    restaurant_id,
    SUM(order_amount) AS total_revenue
FROM orders
GROUP BY restaurant_id
ORDER BY total_revenue DESC;
```

### Average Order Value

```sql
SELECT
    AVG(order_amount) AS average_order_value
FROM orders;
```

### Orders by Location

```sql
SELECT
    location,
    COUNT(*) AS total_orders
FROM orders
GROUP BY location
ORDER BY total_orders DESC;
```

### Monthly Revenue

```sql
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(order_amount) AS revenue
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY year, month;
```

---

# 📈 Power BI

Power BI was used to transform the analytical data into interactive dashboards.

### Power BI workflow

```text
MySQL
   ↓
Power BI
   ↓
Data Transformation
   ↓
Data Modeling
   ↓
Relationships
   ↓
DAX Measures
   ↓
Visualizations
   ↓
Interactive Dashboard
```

### Dashboard Features

* KPI cards
* Bar charts
* Line charts
* Donut charts
* Tables
* Slicers
* Filters
* Drill-down analysis
* Interactive cross-filtering

---

# 🧮 Key KPIs

Some of the major KPIs used throughout the project include:

| KPI                       | Description                                     |
| ------------------------- | ----------------------------------------------- |
| **Total Orders**          | Total number of orders placed                   |
| **Total Customers**       | Number of unique customers                      |
| **Total Revenue**         | Revenue generated from orders                   |
| **Average Order Value**   | Average monetary value per order                |
| **Average Delivery Time** | Average time taken to deliver orders            |
| **Cancellation Rate**     | Percentage of cancelled orders                  |
| **Repeat Customer Rate**  | Percentage of customers placing multiple orders |
| **Restaurant Revenue**    | Revenue generated by individual restaurants     |

---

# 💡 Business Insights

The analysis was designed to identify patterns such as:

* High-value customer segments contributing significantly to revenue
* Restaurants with consistently strong order volumes
* Locations generating higher demand
* Variations in delivery performance across locations
* Peak ordering periods
* Revenue concentration across restaurants and locations
* Customer purchasing patterns
* Operational areas requiring improvement

---

# 🚀 Business Recommendations

Based on the analytical findings, potential business actions include:

### Customer

* Introduce targeted loyalty programs for repeat customers
* Provide personalized offers based on customer behavior
* Focus retention campaigns on high-value customer segments

### Restaurant

* Provide performance insights to restaurant partners
* Promote high-performing restaurants
* Identify restaurants with declining order activity

### Operations

* Optimize delivery allocation during peak periods
* Investigate locations with higher delivery times
* Monitor cancellation patterns
* Improve operational planning using demand trends

### Finance

* Track revenue contribution by restaurant and location
* Monitor average order value
* Identify high-revenue customer and restaurant segments
* Use historical trends for business planning

---

# 📁 Project Structure

```text
NovaNest/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── python/
│   ├── data_generation.py
│   ├── data_cleaning.py
│   └── data_analysis.py
│
├── sql/
│   ├── database_schema.sql
│   ├── data_loading.sql
│   ├── exploratory_analysis.sql
│   └── business_analysis.sql
│
├── powerbi/
│   └── NovaNest_Dashboard.pbix
│
├── screenshots/
│   ├── customer_intelligence.png
│   ├── restaurant_intelligence.png
│   ├── operations_intelligence.png
│   └── financial_intelligence.png
│
├── requirements.txt
├── .gitignore
└── README.md
```

---

# ⚙️ Installation & Setup

## 1. Clone the Repository

```bash
git clone https://github.com/your-username/NovaNest.git
```

```bash
cd NovaNest
```

## 2. Install Python Dependencies

```bash
pip install -r requirements.txt
```

## 3. Prepare the Dataset

Place the raw datasets inside:

```text
data/raw/
```

## 4. Run Data Cleaning

```bash
python python/data_cleaning.py
```

## 5. Create the MySQL Database

Run:

```text
sql/database_schema.sql
```

Then load the processed data into MySQL.

## 6. Run SQL Analysis

Execute the SQL scripts inside:

```text
sql/
```

## 7. Open Power BI

Open:

```text
powerbi/NovaNest_Dashboard.pbix
```

Connect Power BI to the MySQL database and refresh the dataset.

---

# 📦 Requirements

```text
Python 3.x
Pandas
NumPy
MySQL
Power BI Desktop
Git
```

---

# 🧠 Skills Demonstrated

### Data Analytics

* Exploratory Data Analysis
* Data Cleaning
* Data Transformation
* KPI Development
* Business Analysis
* Insight Generation

### SQL

* SELECT
* WHERE
* GROUP BY
* HAVING
* ORDER BY
* JOINs
* Subqueries
* CTEs
* CASE statements
* Aggregate Functions
* Window Functions

### Python

* Pandas
* NumPy
* Data Cleaning
* Data Transformation
* Exploratory Analysis
* Automation

### Power BI

* Data Modeling
* Relationships
* DAX
* KPI Design
* Interactive Visualization
* Dashboard Development

### Database

* MySQL
* Relational Data Modeling
* Data Loading
* Query Optimization

---

# 🎯 Project Outcome

NovaNest demonstrates an end-to-end **data analytics workflow**, starting from raw transactional data and progressing through:

**Data Generation → Data Cleaning → ETL → MySQL → SQL Analytics → Data Modeling → Power BI → Business Insights → Recommendations**

The project provides a practical simulation of how a data analyst can transform operational data into decision-support dashboards for different business functions.

---

# 👨‍💻 Author

**Sulthan Baasith Z**

B.Tech Computer Science & Engineering
VIT-AP University

### Areas of Interest

* Data Analytics
* Data Engineering
* Business Intelligence
* Data Science
* SQL
* Python
* Power BI

---

⭐ If you find this project useful, consider giving the repository a star!
