CREATE DATABASE IF NOT EXISTS sales_analytics;
USE sales_analytics;

CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city          VARCHAR(50),
    email         VARCHAR(100) UNIQUE,
    created_date  DATE
);

CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100),
    category     VARCHAR(50),
    price        DECIMAL(10,2),
    stock        INT
);

CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id        INT,
    product_id      INT,
    quantity        INT,
    price           DECIMAL(10,2),
    FOREIGN KEY (order_id)    REFERENCES orders(order_id),
    FOREIGN KEY (product_id)  REFERENCES products(product_id)
);


-- Q1. Identify all primary keys and foreign keys in the database.
  -- Primary Keys:
/* customers    -customer_id
    products     - product_id
    orders       - order_id
    order_details - order_detail_id
    
    Foreign Keys:
    orders.customer_id        - customers(customer_id)
    order_details.order_id    - orders(order_id)
   order_details.product_id  - products(product_id) */



SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'sales_analytics'
AND REFERENCED_TABLE_NAME IS NOT NULL;


-- Q2. Add a NOT NULL constraint to the category column in products.
ALTER TABLE products
    MODIFY COLUMN category VARCHAR(50) NOT NULL;

-- Q3. Add a CHECK constraint to ensure price > 0 in products.
ALTER TABLE products
    ADD CONSTRAINT chk_price_positive CHECK (price > 0);


-- Q4. Change email column datatype to VARCHAR(150).
ALTER TABLE customers
    MODIFY COLUMN email VARCHAR(150) UNIQUE;

SHOW INDEX FROM sales_analytics.customers;
DROP INDEX email_2 ON sales_analytics.customers;

-- Q5. Create a composite primary key for a sample table employee_projects.
CREATE TABLE employee_projects (
    employee_id INT        NOT NULL,
    project_id  INT        NOT NULL,
    role        VARCHAR(50),
    join_date   DATE,
    PRIMARY KEY (employee_id, project_id)
);



-- Q6. Create a table suppliers with appropriate data types.
CREATE TABLE suppliers (
    supplier_id   INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name  VARCHAR(100),
    phone         VARCHAR(15),
    email         VARCHAR(150) UNIQUE,
    city          VARCHAR(50),
    created_date  DATE DEFAULT (CURRENT_DATE)
);


-- Q7. Rename column city to location in customers.
ALTER TABLE customers
    RENAME COLUMN city TO location;


-- Q8. Drop the stock column from products.
ALTER TABLE products
    DROP COLUMN stock;


-- Q9. Truncate the suppliers table.
TRUNCATE TABLE suppliers;


-- Q10. Drop the suppliers table.
DROP TABLE IF EXISTS suppliers;


-- Q11. Insert 5 records into customers.
INSERT INTO customers (customer_id, customer_name, location, email, created_date) VALUES
(1, 'Amit Sharma',   'Delhi',     'amit.sharma@gmail.com',   '2022-03-15'),
(2, 'Priya Nair',    'Mumbai',    'priya.nair@yahoo.com',    '2023-06-20'),
(3, 'Ravi Kumar',    'Chennai',   'ravi.kumar@gmail.com',    '2021-11-10'),
(4, 'Sunita Verma',  'Bangalore', 'sunita.verma@outlook.com','2023-01-05'),
(5, 'Arjun Mehta',   'Pune',      'arjun.mehta@gmail.com',   '2024-02-28');


-- Q12. Insert 5 records into products.
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Samsung Galaxy S24', 'Electronics', 74999.00),
(2, 'Sony WH-1000XM5',    'Electronics', 29999.00),
(3, 'Nike Air Max',        'Footwear',    8999.00),
(4, 'Prestige Cooker 5L',  'Kitchen',     2499.00),
(5, 'Levi\'s Jeans 501',   'Clothing',    3499.00);


-- Q13. Update product price by 10% for category 'Electronics'.
UPDATE products SET price = price * 1.10
WHERE category = 'Electronics';

SET SQL_SAFE_UPDATES=0;

-- Q14. Delete customers who are from 'Delhi'.
DELETE FROM customers
WHERE location = 'Delhi';


-- Q15. Insert multiple rows into orders using a single query.
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 2, '2024-01-15', 29999.00),
(102, 3, '2024-02-20', 74999.00),
(103, 4, '2024-03-10',  8999.00),
(104, 5, '2024-04-05', 33498.00),
(105, 2, '2024-05-18',  2499.00);




-- Q16. Display all customers sorted by name.
SELECT * FROM customers
ORDER BY customer_name ASC;


-- Q17. Display distinct product categories.
SELECT DISTINCT category
FROM products;


-- Q18. Fetch top 5 most expensive products.
SELECT product_id, product_name, category, price
FROM products
ORDER BY price DESC
LIMIT 5;


-- Q19. Display customers created after 2023-01-01.
SELECT * FROM customers
WHERE created_date > '2023-01-01';


-- Q20. Show all orders placed in the year 2024.
SELECT * FROM orders
WHERE YEAR(order_date) = 2024;


-- Q21. Find customers whose name starts with 'A'.
SELECT * FROM customers
WHERE customer_name LIKE 'A%';


-- Q22. Display products priced between 500 and 2000.
SELECT * FROM products
WHERE price BETWEEN 500 AND 2000;


-- Q23. Fetch orders where total_amount > 10000.
SELECT * FROM orders
WHERE total_amount > 10000;


-- Q24. List products ordered by price descending.
SELECT * FROM products
ORDER BY price DESC;


-- Q25. Find customers whose email contains 'gmail'.
SELECT * FROM customers
WHERE email LIKE '%gmail%';



-- Q26. Fetch customer name with their order details (INNER JOIN).
SELECT c.customer_name, o.order_id, o.order_date, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;


-- Q27. List all customers and their orders (LEFT JOIN).
SELECT c.customer_name, o.order_id, o.order_date, o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;


-- Q28. Show all orders and customers (RIGHT JOIN).
SELECT c.customer_name, o.order_id, o.order_date, o.total_amount
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;


-- Q29. Display product names with quantities sold.
SELECT p.product_name, SUM(od.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name;


-- Q30. Find customers who have not placed any order.
SELECT c.customer_id, c.customer_name, c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;




-- Q31. Find total sales amount.
SELECT SUM(total_amount) AS total_sales
FROM orders;


-- Q32. Calculate average product price by category.
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM products
GROUP BY category;


-- Q33. Find total number of orders per customer.
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- Q34. Get maximum and minimum product prices.
SELECT MAX(price) AS max_price, MIN(price) AS min_price
FROM products;


-- Q35. Count number of customers city-wise.
SELECT location AS city, COUNT(*) AS customer_count
FROM customers
GROUP BY location;



-- Q36. Find customers who placed more than 3 orders.
SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 3;


-- Q37. Display categories with average price > 1000.
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 1000;


-- Q38. Show cities having more than 5 customers.
SELECT location AS city, COUNT(*) AS customer_count
FROM customers
GROUP BY location
HAVING COUNT(*) > 5;


-- Q39. Find products sold more than 50 units.
SELECT p.product_name, SUM(od.quantity) AS total_sold
FROM products p
INNER JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(od.quantity) > 50;


-- Q40. Calculate monthly sales and filter months with sales > 1,00,000.
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
HAVING SUM(total_amount) > 100000
ORDER BY month;


-- Q41. Find customers who placed orders above average order value.
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > (SELECT AVG(total_amount) FROM orders);


-- Q42. List products that were never ordered.
SELECT product_id, product_name
FROM products
WHERE product_id NOT IN ( SELECT DISTINCT product_id FROM order_details);


-- Q43. Find second highest product price.
SELECT MAX(price) AS second_highest_price
FROM products
WHERE price < (SELECT MAX(price) FROM products);


-- Q44. Get customers who ordered the most expensive product.
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
INNER JOIN orders o        ON c.customer_id = o.customer_id
INNER JOIN order_details od ON o.order_id   = od.order_id
WHERE od.product_id = (
    SELECT product_id FROM products
    ORDER BY price DESC
    LIMIT 1
);


-- Q45. Delete orders of customers from 'Mumbai' using subquery.
DELETE FROM orders
WHERE customer_id IN (
    SELECT customer_id FROM customers
    WHERE location = 'Mumbai'
);



-- Q46. Create a view showing customer name, order date, and total amount.
CREATE OR REPLACE VIEW vw_customer_orders AS
SELECT c.customer_name,
       o.order_date,
       o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;


SELECT * FROM vw_customer_orders;




-- Q47. Create an index on order_date in orders table.
CREATE INDEX idx_order_date ON orders(order_date);



-- Q48. Create a user-defined function to calculate GST (18%) on amount.
DELIMITER $$

CREATE FUNCTION fn_calculate_gst(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN ROUND(amount * 0.18, 2);
END$$

DELIMITER ;


SELECT product_name,
       price,
       fn_calculate_gst(price)    AS gst_amount,
       price + fn_calculate_gst(price) AS price_with_gst
FROM products;




-- Q49. Create a stored procedure to fetch orders by customer_id.
DELIMITER $$

CREATE PROCEDURE sp_get_orders_by_customer(IN p_customer_id INT)
BEGIN
    SELECT o.order_id,
           c.customer_name,
           o.order_date,
           o.total_amount
    FROM orders o
    INNER JOIN customers c ON o.customer_id = c.customer_id
    WHERE o.customer_id = p_customer_id
    ORDER BY o.order_date DESC;
END$$

DELIMITER ;


CALL sp_get_orders_by_customer(2);


-- Q50. Create a temporary table to store top 5 selling products.
CREATE TEMPORARY TABLE temp_top5_products AS
SELECT p.product_id,
       p.product_name,
       p.category,
       SUM(od.quantity) AS total_units_sold,
       SUM(od.quantity * od.price) AS total_revenue
FROM products p
INNER JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_units_sold DESC
LIMIT 5;


SELECT * FROM temp_top5_products;

