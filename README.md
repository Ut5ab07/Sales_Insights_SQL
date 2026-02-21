# 📊 Sales Insights Analysis Using SQL

## 📌 Project Overview

This project demonstrates SQL-based sales analytics using a structured relational database.
The objective is to analyze customer behavior, product performance, revenue trends, and business metrics using PostgreSQL.

The project simulates a real-world e-commerce environment with properly designed relational tables and meaningful sample data.

---

## 🏗️ Database Schema

The database follows a simplified **Star Schema** design consisting of fact and dimension tables.

### 1️⃣ Customers

Stores customer information.

* `customer_id` (Primary Key)
* `name`
* `email`
* `city`
* `signup_date`

### 2️⃣ Products

Stores product catalog details.

* `product_id` (Primary Key)
* `product_name`
* `category`
* `price`

### 3️⃣ Orders

Stores order-level transaction details.

* `order_id` (Primary Key)
* `customer_id` (Foreign Key)
* `order_date`
* `payment_method`
* `order_status`

### 4️⃣ Order_Items

Stores product-level details within each order.

* `order_item_id` (Primary Key)
* `order_id` (Foreign Key)
* `product_id` (Foreign Key)
* `quantity`
* `item_price`

### 5️⃣ Payments

Stores payment transaction records.

* `payment_id` (Primary Key)
* `order_id` (Foreign Key)
* `amount_paid`
* `payment_date`

---

## 📂 Project Structure

```
Sales-Insights-SQL/
│
├── schema.sql        # Table creation queries
├── data.sql          # Data insertion queries
├── analysis.sql      # Business analysis queries
└── README.md         # Project documentation
```

---

## 📊 Business Questions Answered

### 💰 Revenue Analysis

* Total revenue generated
* Average order value
* Revenue by city
* Revenue by product category
* Highest value orders

### 👥 Customer Insights

* Total number of customers
* Customers with no orders
* Top spending customers
* Customer lifetime value
* Repeat customers

### 🛒 Order Analysis

* Total orders placed
* Orders by payment method
* Cancelled vs Delivered orders
* Pending payments

### 📈 Trend Analysis

* Revenue by date
* Orders per day
* Monthly revenue trends

---

## 🔎 Key Insights Extracted

* Identified top-performing cities by revenue.
* Determined high-value customers based on total spending.
* Analyzed most preferred payment methods.
* Measured percentage of cancelled and pending orders.
* Evaluated product performance by category.

---

## 🛠️ Tools & Technologies

* PostgreSQL
* SQL (Joins, Aggregations, Subqueries, Window Functions, CTEs)
* Git & GitHub

---

## 🚀 Skills Demonstrated

* Relational database design
* Foreign key relationships
* Complex JOIN operations
* GROUP BY and aggregate analysis
* Subqueries and CTE usage
* Window functions for ranking and advanced analytics
* NULL handling and data validation
* Business-driven SQL problem solving

---

## 🎯 Learning Outcome

This project simulates real-world sales analytics workflows and demonstrates the ability to transform raw transactional data into meaningful business insights using SQL.

---

## 📌 Future Improvements

* Add large-scale synthetic data using `generate_series()`
* Optimize queries using indexes
* Build dashboard visualizations using Power BI / Tableau
* Implement automated reporting pipeline

---

