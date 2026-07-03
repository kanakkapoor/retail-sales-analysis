CREATE DATABASE retail_sales_project;
USE retail_sales_project;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    segment VARCHAR(50)
);

select * from customers;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    sales DECIMAL(10,2),
    profit DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'Delhi', 'Delhi', 'Consumer'),
(2, 'Riya Gupta', 'Mumbai', 'Maharashtra', 'Corporate'),
(3, 'Karan Mehta', 'Delhi', 'Delhi', 'Home Office'),
(4, 'Simran Kaur', 'Chandigarh', 'Punjab', 'Consumer'),
(5, 'Aditya Verma', 'Bangalore', 'Karnataka', 'Corporate');

INSERT INTO products VALUES
(101, 'Laptop', 'Technology', 'Electronics', 50000),
(102, 'Chair', 'Furniture', 'Office', 3000),
(103, 'Phone', 'Technology', 'Mobile', 20000),
(104, 'Table', 'Furniture', 'Office', 7000),
(105, 'Headphones', 'Technology', 'Accessories', 2000);

INSERT INTO orders VALUES
(1001, '2025-01-10', 1, 101, 1, 50000, 8000),
(1002, '2025-01-12', 2, 102, 2, 6000, 1200),
(1003, '2025-01-15', 3, 103, 1, 20000, 3000),
(1004, '2025-01-18', 1, 105, 3, 6000, 900),
(1005, '2025-01-20', 4, 104, 1, 7000, 1500);

SELECT * FROM orders;

SELECT o.order_id, c.customer_name, o.sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

SELECT SUM(sales) AS total_sales
FROM orders;

SELECT SUM(profit) AS total_profit
FROM orders;

SELECT customer_id, SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id;

SELECT customer_id, SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 1;

SELECT products.category, SUM(orders.sales)
FROM orders
JOIN products
ON orders.product_id = products.product_id
GROUP BY products.category;

SELECT products.category, SUM(orders.profit)
FROM orders
JOIN products
ON orders.product_id = products.product_id
GROUP BY products.category;

SELECT customers.customer_name, SUM(orders.sales)
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_name;

SELECT products.product_name, SUM(orders.sales)
FROM orders
JOIN products
ON orders.product_id = products.product_id
GROUP BY products.product_name
ORDER BY SUM(orders.sales) DESC;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT AVG(sales) AS average_order_value
FROM orders;

SELECT customer_id,
       SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(sales) > 10000;

SELECT products.product_name,
       SUM(orders.profit) AS total_profit
FROM orders
JOIN products
ON orders.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_profit DESC
LIMIT 1;

SELECT customers.customer_name,
       COUNT(orders.order_id) AS total_orders
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_name
ORDER BY total_orders DESC;




