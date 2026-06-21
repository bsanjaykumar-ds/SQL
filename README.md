# 📊 MySQL Data Analytics — Practical Solutions

A complete set of **50 MySQL practical solutions** covering core data analytics concepts — from schema design and constraints all the way to stored procedures, views, and temporary tables.

---

## 🗄️ Database Schema

**Database:** `sales_analytics`

Four related tables that simulate a real-world sales system:

```
customers ──────────< orders >──────────── order_details >──── products
```

| Table | Primary Key | Description |
|---|---|---|
| `customers` | `customer_id` | Customer profile and contact info |
| `products` | `product_id` | Product catalog with category and price |
| `orders` | `order_id` | Orders placed by customers |
| `order_details` | `order_detail_id` | Line items linking orders to products |

### Relationships
- `orders.customer_id` → `customers(customer_id)`
- `order_details.order_id` → `orders(order_id)`
- `order_details.product_id` → `products(product_id)`

---

## 📁 File Structure

```
├── data_analytics_solutions.sql   # All 50 solutions in one file
└── README.md                      # This file
```

---

## 📚 Sections Covered

### 1. Data Types, Keys & Constraints — Q1–Q5
Identifying primary and foreign keys, adding `NOT NULL` and `CHECK` constraints, modifying column data types, and creating a composite primary key.

### 2. DDL (Data Definition Language) — Q6–Q10
Creating a `suppliers` table, renaming columns, dropping columns, truncating, and dropping tables using `CREATE`, `ALTER`, `TRUNCATE`, and `DROP`.

### 3. DML (Data Manipulation Language) — Q11–Q15
Inserting sample records into `customers`, `products`, and `orders`; updating prices with percentage logic; deleting rows by condition; and bulk inserting with a single `INSERT` statement.

### 4. DQL (Data Query Language) — Q16–Q20
Selecting and sorting all customers, retrieving distinct categories, fetching the top 5 most expensive products, and filtering by date ranges using `LIMIT` and `WHERE`.

### 5. WHERE, LIKE & ORDER BY — Q21–Q25
Pattern matching with `LIKE`, filtering by price range using `BETWEEN`, sorting results, and finding records with partial string matches in email fields.

### 6. Joins — Q26–Q30
`INNER JOIN` for matched records, `LEFT JOIN` to include all customers, `RIGHT JOIN` for all orders, aggregating quantities sold per product, and finding customers with no orders using `NULL` checks.

### 7. Aggregation Functions — Q31–Q35
Calculating total sales with `SUM`, average price per category with `AVG`, order counts per customer with `COUNT`, and getting `MAX`/`MIN` product prices.

### 8. GROUP BY & HAVING — Q36–Q40
Filtering grouped results — customers with more than 3 orders, categories above average price threshold, cities with large customer counts, high-selling products, and monthly revenue filtering.

### 9. Subqueries — Q41–Q45
Finding customers above average order value, listing never-ordered products with `NOT IN`, getting the second highest price, identifying buyers of the most expensive product, and deleting orders using a nested subquery.

### 10. Views — Q46
Creating a reusable `VIEW` (`vw_customer_orders`) joining customer names with their order dates and totals.

### 11. Index — Q47
Creating an index on `order_date` in the `orders` table to speed up date-based queries.

### 12. User-Defined Function — Q48
A scalar function `fn_calculate_gst(amount)` that returns 18% GST on any given amount, used inline in `SELECT` queries.

### 13. Stored Procedure — Q49
A parameterized stored procedure `sp_get_orders_by_customer(customer_id)` that retrieves all orders for a given customer, called with `CALL`.

### 14. Temporary Table — Q50
Creating a session-scoped temporary table `temp_top5_products` that stores the top 5 best-selling products by units sold, auto-dropped when the session ends.

---

## ▶️ How to Run

  Open **MySQL Workbench** or any MySQL client.


> **Note:** Run the schema setup section first before executing individual queries.

---

## 🛠️ Tech Stack

- **Database:** MySQL 8.x
- **Concepts:** DDL, DML, DQL, Joins, Aggregations, Subqueries, Views, Indexes, UDFs, Stored Procedures, Temporary Tables

---

## 👤 Author

**\< sanjay kumar \>**  
📧 \<bsanjaykumar.work@gmail.com\>  
🔗 [LinkedIn](www.linkedin.com/in/sanjaykumar-data-science) · [GitHub](https://github.com/bsanjaykumar-ds)
