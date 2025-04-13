-- Drop and create the bookstore database
CREATE DATABASE mysql_bookstore;
USE mysql_bookstore;

-- Customer table
CREATE TABLE customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(255) UNIQUE,
  phone VARCHAR(20)
);

-- Customer Addresses
CREATE TABLE customer_address (
  address_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  street VARCHAR(255),
  city VARCHAR(100),
  postal_code VARCHAR(20),
  country VARCHAR(100),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Book Categories
CREATE TABLE category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) UNIQUE
);

-- Authors table
CREATE TABLE author (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  bio TEXT
);

-- Books table
CREATE TABLE book (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  price DECIMAL(10,2),
  stock_quantity INT DEFAULT 0,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Book and Author relationship (many-to-many)
CREATE TABLE book_author (
  book_id INT,
  author_id INT,
  PRIMARY KEY (book_id, author_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id),
  FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Orders table
CREATE TABLE cust_order (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Order Line Items
CREATE TABLE order_line (
  order_line_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity INT NOT NULL CHECK (quantity > 0),
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Shipping Methods
CREATE TABLE shipping_method (
  shipping_id INT AUTO_INCREMENT PRIMARY KEY,
  method_name VARCHAR(100),
  cost DECIMAL(10,2)
);

-- Order Status Types
CREATE TABLE order_status (
  status_id INT AUTO_INCREMENT PRIMARY KEY,
  status_name VARCHAR(50)
);

-- Order History (Tracks status changes)
CREATE TABLE order_history (
  history_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  status_id INT,
  change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
  FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Sample Inserts
INSERT INTO category (name) 
VALUES ('Fiction'), ('Non-Fiction'), ('Children'), ('Education');

INSERT INTO customer (first_name, last_name, email, phone)
VALUES ('Faith', 'Wanjiku', 'faith@example.com', '0713500693');

INSERT INTO author (name, bio)
VALUES ('J.K. Rowling', 'Author of Harry Potter series'),
       ('George Orwell', 'Author of 1984');

INSERT INTO book (title, price, stock_quantity, category_id)
VALUES ('Harry Potter', 29.99, 10, 1),
       ('1984', 19.99, 5, 2);

INSERT INTO book_author (book_id, author_id)
VALUES (1, 1),
       (2, 2);

INSERT INTO shipping_method (method_name, cost)
VALUES ('Standard Shipping', 5.00),
       ('Express Shipping', 10.00);

INSERT INTO order_status (status_name)
VALUES ('Pending'), ('Shipped'), ('Delivered'), ('Cancelled');