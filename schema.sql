DROP DATABASE IF EXISTS mysql_bookstore;
CREATE DATABASE mysql_bookstore;
USE mysql_bookstore;

CREATE TABLE customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(255) UNIQUE,
  phone VARCHAR(20)
);

CREATE TABLE book (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  price DECIMAL(10,2),
  stock_quantity INT
);

CREATE TABLE cust_order (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_line (
  order_line_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);
