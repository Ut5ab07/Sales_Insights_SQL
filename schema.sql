/* Creating Customer table */

CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(100),
	city VARCHAR (50),
	signup_date DATE DEFAULT CURRENT_DATE
);



/* Creating Products table */

CREATE TABLE products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(50),
	category VARCHAR(50),
	price DECIMAL(10,2)
);



/* Creating Orders Table */

CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(customer_id),
	order_date DATE DEFAULT CURRENT_DATE,
	payment_method VARCHAR(50),
	order_status VARCHAR(50)
);


/* Creating order_items table */

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    item_price DECIMAL(10,2)
);


/* Creating payement table */

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    amount_paid DECIMAL(10,2),
    payment_date DATE
);





