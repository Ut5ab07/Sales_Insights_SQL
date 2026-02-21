/* Creating Customer table */
/*
CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(100),
	city VARCHAR (50),
	signup_date DATE DEFAULT CURRENT_DATE
);
*/

/* Inserting elements in customer table */
/*
INSERT INTO customers (name, email, city, signup_date) VALUES
('Aman Verma', 'aman@email.com', 'Delhi', '2024-01-10'),
('Riya Sharma', 'riya@email.com', 'Mumbai', '2024-02-15'),
('Kabir Khan', 'kabir@email.com', 'Pune', '2024-03-05'),
('Sara Iyer', 'sara@email.com', 'Chennai', '2024-01-20'),
('Arjun Mehta', 'arjun@email.com', 'Delhi', '2024-04-01'),
('Neha Singh', 'neha@email.com', 'Kolkata', '2024-02-28'),
('Rahul Das', NULL, 'Mumbai', '2024-03-10'),  
('Priya Nair', 'priya@email.com', NULL, '2024-03-25'); 
*/

/* Creating Products table */
/*
CREATE TABLE products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(50),
	category VARCHAR(50),
	price DECIMAL(10,2)
);
*/

/* Inserting data in products table */
/*
INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 60000),
('Smartphone', 'Electronics', 30000),
('Headphones', 'Electronics', 2000),
('Shoes', 'Fashion', 3500),
('T-Shirt', 'Fashion', 1200),
('Washing Machine', 'Home Appliance', 25000),
('Refrigerator', 'Home Appliance', 40000),
('Book', 'Education', 500);
*/

/* Creating Orders Table */
/*
CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(customer_id),
	order_date DATE DEFAULT CURRENT_DATE,
	payment_method VARCHAR(50),
	order_status VARCHAR(50)
);
*/

/* INserting values into orders table */
/*
INSERT INTO orders (customer_id, order_date, payment_method, order_status) VALUES
(1, '2024-05-01', 'Card', 'Delivered'),
(2, '2024-05-02', 'UPI', 'Delivered'),
(3, '2024-05-03', 'Cash', 'Pending'),
(4, '2024-05-04', 'Card', 'Delivered'),
(1, '2024-05-06', 'UPI', 'Cancelled'),
(5, '2024-05-07', 'NetBanking', 'Delivered'),
(6, '2024-05-08', 'UPI', 'Delivered'),
(2, '2024-05-09', NULL, 'Pending'); -- NULL payment method
*/

/* Creating order_items table */
/*
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    item_price DECIMAL(10,2)
);
*/

/* Inserting data into orders_items table */
/*
INSERT INTO order_items (order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 60000),
(1, 3, 2, 2000),
(2, 2, 1, 30000),
(3, 4, 2, 3500),
(4, 6, 1, 25000),
(5, 5, 3, 1200),
(6, 7, 1, 40000),
(7, 8, 5, 500),
(8, 3, 1, 2000);
*/

/* Creating payement table */
/*
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    amount_paid DECIMAL(10,2),
    payment_date DATE
);
*/

/* Inserting data into payment table */
/*
INSERT INTO payments (order_id, amount_paid, payment_date) VALUES
(1, 64000, '2024-05-01'),
(2, 30000, '2024-05-02'),
(4, 25000, '2024-05-04'),
(6, 40000, '2024-05-07'),
(7, 2500, '2024-05-08'),
(8, NULL, NULL);  -- Pending payment
*/



