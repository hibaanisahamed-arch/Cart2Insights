# Cart2Insights — E-Commerce Data Analysis

## 📌 Project Overview

Cart2Insights is an e-commerce data analysis project focused on understanding orders, customers, products, sellers, payments, reviews, delivery performance, and geographic information.

The project uses **Python for data cleaning and validation** and **MySQL for relational data analysis and business insights**.

---

## 🎯 Project Objectives

* Understand the structure and quality of the e-commerce datasets.
* Identify missing values and duplicate records.
* Validate primary and composite keys.
* Check relationships between tables.
* Clean the datasets without modifying the original raw files.
* Load the cleaned datasets into MySQL.
* Perform SQL-based business analysis.
* Generate meaningful business insights from the data.

---

## 🗂️ Dataset Tables

The project contains the following tables:

1. `customers`
2. `orders`
3. `products`
4. `sellers`
5. `order_reviews`
6. `order_items`
7. `order_payments`
8. `geolocation`
9. `category_translation`

---

## 🛠️ Tools & Technologies

* **Python**
* **Pandas**
* **Jupyter Notebook**
* **VS Code**
* **MySQL**
* **SQL**
* **Git / GitHub**

---

## 🧹 Data Cleaning & Validation

The datasets were checked for:

* Missing values
* Duplicate records
* Duplicate IDs
* Primary-key uniqueness
* Composite-key uniqueness
* Invalid dates
* Invalid numeric values
* Invalid foreign-key relationships
* Blank and whitespace values
* Data-type consistency

The original raw datasets were preserved, while cleaned copies were saved separately.

---

## 🗄️ Database Design

The cleaned datasets were loaded into a MySQL database named:

`olist_project`

Key relationships include:

* `orders.customer_id → customers.customer_id`
* `order_items.order_id → orders.order_id`
* `order_items.product_id → products.product_id`
* `order_items.seller_id → sellers.seller_id`
* `order_reviews.order_id → orders.order_id`
* `order_payments.order_id → orders.order_id`

Composite keys were used where appropriate, particularly for:

* `order_items`
* `order_payments`

---

## 📊 SQL Analysis

The project includes analysis of:

* Order-status distribution
* Monthly order volume
* Monthly revenue
* Average order value
* Product-category revenue
* Top products by items sold
* Seller performance
* Payment methods
* Review-score distribution
* Average delivery time
* Delivery performance
* Average freight cost
* Customer-state order distribution
* Payment installments
* Freight versus product price
* Product-category sales volume
* Review score versus delivery time
* Seller revenue
* Overall business summary

---

## 📈 Key Results

| Metric                            |        Result |
| --------------------------------- | ------------: |
| Orders in orders table            |        99,441 |
| Orders represented in order_items |        98,666 |
| Unique products sold              |        32,951 |
| Sellers represented               |         3,095 |
| Product revenue                   | 13,591,643.70 |
| Average item price                |        120.65 |
| Average freight value             |         19.99 |
| Average delivery time             |    12.50 days |
| Delivered orders                  |        96,478 |

---

## 🔍 Key Observations

### Order Volume

Order volume increased substantially during 2017 and 2018 compared with the early months of the dataset.

### Order Status

The majority of orders were recorded with the status `delivered`.

### Delivery

The average delivery time for orders with a recorded customer delivery date was **12.50 days**.

The dataset also contains orders delivered after their estimated delivery date, which provides an opportunity to study delivery performance.

### Products & Sellers

The dataset contains **32,951 unique products** and **3,095 sellers**, providing a broad product and seller ecosystem for analysis.

### Payments

Payment methods and installment patterns were analyzed to understand customer payment behavior.

### Reviews

Review scores from 1 to 5 were analyzed along with delivery time to examine the relationship between customer feedback and delivery experience.

---

## 📁 Project Structure

```text
Cart2Insights/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── notebooks/
│   └── 02_data_cleaning.ipynb
│
├── sql/
│
├── README.md
│
└── ...
```

---

## 🚀 Project Workflow

```text
Raw Data
   ↓
Data Understanding
   ↓
Data Quality Checks
   ↓
Data Cleaning
   ↓
Cleaned CSV Files
   ↓
MySQL Database
   ↓
Relationship Validation
   ↓
SQL Analysis
   ↓
Business Insights
```

---

## 💡 Conclusion

This project demonstrates an end-to-end approach to e-commerce data analysis, starting from raw CSV files and progressing through data cleaning, validation, relational database creation, SQL analysis, and business insight generation.

The project provides practical experience with **Python, Pandas, SQL, MySQL, relational data modeling, and exploratory business analysis**.