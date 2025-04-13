-- creating a Database

-- create table customer
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    prefix VARCHAR(15),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(15)
);

-- create table customer_address
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- create table address_status
CREATE TABLE address_status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- create table address
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(10),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- create table country
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100)
);

-- Inserting Data in Tables
INSERT INTO customer (customer_id, prefix, first_name, last_name, email, phone_number) 
VALUES
(1, 'Mr.', 'John', 'Doe', 'john.doe1@example.com', '123-456-7890'),
(2, 'Mrs.', 'Jane', 'Smith', 'jane.smith2@example.com', '234-567-8910'),
(3, 'Dr.', 'Robert', 'Williams', 'robert.williams3@example.com', '345-678-9120'),
(4, 'Ms.', 'Emma', 'Brown', 'emma.brown4@example.com', '456-789-1235'),
(5, 'Mr.', 'Michael', 'Davis', 'michael.davis5@example.com', '567-890-1234'),
(6, 'Mrs.', 'Sarah', 'Miller', 'sarah.miller6@example.com', '678-901-2345'),
(7, 'Dr.', 'William', 'Taylor', 'william.taylor7@example.com', '789-012-3456'),
(8, 'Ms.', 'Elizabeth', 'Wilson', 'elizabeth.wilson8@example.com', '890-123-4567'),
(9, 'Mr.', 'David', 'Johnson', 'david.johnson9@example.com', '901-234-5678'),
(10, 'Mrs.', 'Olivia', 'Moore', 'olivia.moore10@example.com', '234-567-8912'),
(11, 'Mr.', 'James', 'Thomas', 'james.thomas11@example.com', '345-678-9123'),
(12, 'Miss', 'Charlotte', 'White', 'charlotte.white12@example.com', '456-789-1231'),
(13, 'Dr.', 'George', 'Harris', 'george.harris13@example.com', '567-890-2345'),
(14, 'Ms.', 'Sophia', 'Martin', 'sophia.martin14@example.com', '678-901-3456'),
(15, 'Mr.', 'Joseph', 'Thompson', 'joseph.thompson15@example.com', '789-012-4567'),
(16, 'Mrs.', 'Ava', 'Garcia', 'ava.garcia16@example.com', '890-123-5678'),
(17, 'Dr.', 'Alexander', 'Ramirez', 'alexander.ramirez17@example.com', '901-234-6789'),
(18, 'Ms.', 'Isabella', 'Young', 'isabella.young18@example.com', '123-456-7891'),
(19, 'Mr.', 'Henry', 'Clark', 'henry.clark19@example.com', '234-567-8912'),
(20, 'Mrs.', 'Amelia', 'King', 'amelia.king20@example.com', '345-678-9123'),
(21, 'Dr.', 'Christopher', 'Robinson', 'christopher.robinson21@example.com', '456-789-1231'),
(22, 'Ms.', 'Evelyn', 'Walker', 'evelyn.walker22@example.com', '567-890-2345'),
(23, 'Mr.', 'Anthony', 'Allen', 'anthony.allen23@example.com', '678-901-3456'),
(24, 'Mrs.', 'Emily', 'Green', 'emily.green24@example.com', '789-012-4567'),
(25, 'Dr.', 'Mason', 'Turner', 'mason.turner25@example.com', '890-123-5678'),
(26, 'Ms.', 'Abigail', 'Scott', 'abigail.scott26@example.com', '901-234-6789'),
(27, 'Mr.', 'Charles', 'Phillips', 'charles.phillips27@example.com', '123-456-7891'),
(28, 'Mrs.', 'Mia', 'Edwards', 'mia.edwards28@example.com', '234-567-8912'),
(29, 'Dr.', 'Thomas', 'Campbell', 'thomas.campbell29@example.com', '345-678-9123'),
(30, 'Ms.', 'Harper', 'Anderson', 'harper.anderson30@example.com', '456-789-1231');

-- Creating Users of the Database
CREATE USER 'devs'@'localhost'
IDENTIFIED BY "devs12345";
CREATE USER 'admin'@'localhost'
IDENTIFIED BY "admin12345";
CREATE USER 'user'@'localhost'
IDENTIFIED BY "user12345";

-- Checking the users and the current user
SELECT USER FROM mysql.user;
SELECT current_user();

-- Assigning permissions
-- Assigning global priviledge
GRANT ALL ON *.* 
TO devs@localhost;

-- Assigning database priviledge
GRANT ALL ON bookstore.* 
TO admin@localhost;

-- Assigning table priviledge (customer table)
GRANT ALL ON bookstore.customer
TO user@localhost;

-- Creating roles
CREATE ROLE devs,admin,user;
-- Creating users
CREATE USER 'cedrick'@'localhost'
IDENTIFIED BY "devs12345";
CREATE USER 'philip'@'localhost'
IDENTIFIED BY "admin12345";
CREATE USER 'mine'@'localhost'
IDENTIFIED BY "user12345";

-- Assign permission/roles
GRANT ALL ON bookstore.* TO devs;
GRANT SELECT ON bookstore.* TO admin;
GRANT INSERT,UPDATE,DELETE,SELECT ON bookstore.* TO user;

-- Add users to roles
GRANT devs TO cedrick@localhost;
GRANT admin TO philip@localhost;
GRANT user TO mine@localhost;
