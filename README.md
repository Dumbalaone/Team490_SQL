# Team490_SQL


# Bookstore Database
The **Bookstore Database** is a relational database designed to manage information about books, authors, publishers, customers, and their interactions. It provides a comprehensive schema for storing and querying data related to a bookstore's operations.

# Objective
This Database is designed to help understand and implement database design principles, including:
1.	Structuring tables for efficient data management.
2.	Implementing relationships between tables.
3.	Normalizing data to avoid redundancy and improve data integrity.
4.	Creating queries to handle user requests (e.g., booking, viewing reservations).
5.	Creating users, user roles and permissions. 

## Features
- **Books and Authors**: Tracks books, their authors, publication years, languages, and publishers.
- **Customers and Addresses**: Manages customer information, including their addresses and address statuses.
- **Languages and Publishers**: Stores supported languages and publisher details.
- **User Roles and Permissions**: Includes predefined roles (`devs`, `admin1`, `user1`) with specific permissions for database access and management.

## Database Schema
Bookstore ERD

![alt text](<bookstore schema.drawio.png>)
 
### Relationships
- Many-to-Many: `book_author` links books and authors.
- One-to-Many: `customer_address` links customers to multiple addresses.
- Foreign keys enforce data integrity between related tables.

## Sample Data

The database includes sample data for:
- Books, authors, publishers, and languages.
- Customers and their addresses.
- Predefined users and roles.

## User Roles and Permissions

- **`devs`**: Full access to all tables and databases.
- **`admin1`**: Full access to the `Bookstore` database.
- **`user1`**: Limited access to specific tables (e.g., `customer`).

## Setup Instructions

1. Create the `Bookstore` database:
   ```sql
   CREATE DATABASE Bookstore;
   ```

2. Execute the SQL script to create tables and insert sample data:
   ```sql
   SOURCE answers.sql;
   ```

3. Verify the database structure and sample data using SQL queries.

## Usage

- Use the `devs` role for development and full database management.
- Use the `admin1` role for administrative tasks within the `Bookstore` database.
- Use the `user1` role for limited access to specific tables.

## Contributors

- **Cedrick**: ceddyxan (Cedrick Shikoli)
- **Philip**: Dumbalaone (Philip Sankale)
- **Gift**: drwafula (GIFT MUREKA)

## License

This project is for educational purposes and is not licensed for commercial use.
