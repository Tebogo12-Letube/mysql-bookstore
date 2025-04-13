USE mysql_bookstore;

INSERT INTO customer (first_name, last_name, email, phone) VALUES
('Tebogo', 'Mokgoro', 'tebogo@gmail.com', '+27 82 123 4567'),
('Faith', 'Ngema', 'lindiwe@gmail.com', '+27 76 987 6543'),
('Adrian', 'Phori', 'adrian@gmail.com', '+27 68 195 4322');

INSERT INTO book (title, price, stock_quantity) VALUES
('Ways of Dying', 199.99, 10),
('Fools and Other Stories', 179.99, 15),
('Bitter Fruit', 189.99, 8);

INSERT INTO cust_order (customer_id, total_amount) VALUES
(1, 349.98), 
(2, 199.99), 
(3, 399.99);

INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 2, 199.99),
(2, 2, 1, 179.99),
(3, 3, 1, 189.99);
