# mysql-bookstore
In this project, you'll step into the role of a database administrator tasked with building a MySQL database to store and manage data for a BookStore. By applying your skills in database design, table creation, data loading, and user management, you'll develop an organized system for this important real-world system. This hands-on project provides valuable experience in efficiently structuring databases to handle large, complex data.
# MySQL Bookstore Database
This README provides an overview of the queries used in the MySQL Bookstore database and their expected outcomes.
---
## Expected Outcomes

### Database Creation
- A new database named `mysql_bookstore` is created and set as the active database.

### Table Creation
- All tables are created successfully with the specified columns, data types, and relationships.
- Foreign key constraints ensure data integrity between related tables.

### Sample Data Inserts
- Categories are added to the `category` table.
- A customer is added to the `customer` table with unique details.
- Authors are added to the `author` table with their names and bios.
- Books are added to the `book` table with their details and linked to categories.
- Books are linked to authors in the `book_author` table.
- Shipping methods are added to the `shipping_method` table.
- Order statuses are added to the `order_status` table.

### General Notes
- The database schema and sample data are designed to support a functional bookstore system.
- All queries should execute without errors if run in the correct order.