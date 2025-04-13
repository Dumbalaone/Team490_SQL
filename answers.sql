CREATE DATABASE Bookstore;


USE Bookstore;

-- create table customer
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
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
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- create table address
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(10),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- create table country
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
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
CREATE USER 'devs'@'%'
IDENTIFIED BY "devs12345";
CREATE USER 'admin1'@'%'
IDENTIFIED BY "admin12345";
CREATE USER 'user1'@'%'
IDENTIFIED BY "user12345";

-- Checking the users and the current user
SELECT USER FROM mysql.user;
SELECT current_user();

-- Assigning permissions
-- Assigning global priviledge
GRANT ALL ON *.* 
TO devs@'%'WITH GRANT OPTION;

-- Assigning database priviledge
GRANT ALL ON Bookstore.* 
TO admin1@'%'WITH GRANT OPTION;

-- Assigning table priviledge (customer table)
GRANT ALL ON Bookstore.customer
TO user1@'%'WITH GRANT OPTION;

-- Creating roles
CREATE ROLE devs,admin1,user1;
-- Creating users
CREATE USER 'cedrick'@'%'
IDENTIFIED BY "devs12345";
CREATE USER 'philip'@'%'
IDENTIFIED BY "admin12345";
CREATE USER 'mine'@'%'
IDENTIFIED BY "user12345";

-- Assign permission/roles
GRANT ALL ON Bookstore.* TO devs;
GRANT SELECT ON Bookstore.* TO admin1;
GRANT INSERT,UPDATE,DELETE,SELECT ON Bookstore.* TO user1;

-- Add users to roles
GRANT devs TO cedrick@'%';
GRANT admin1 TO philip@'%';
GRANT user1 TO mine@'%';
-- Philips files goes here --

USE Bookstore;
-- Creating the tables
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) ,
    publisher_id INT,
    language_id INT,
    publication_year INT
    
);

CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL
);

CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Languages
INSERT INTO book_language (language_name) VALUES 
('English'),
('French'),
('Spanish'),
('German'),
('Italian'),
('Japanese');

-- Publishers
INSERT INTO publisher (name) VALUES
('Penguin Random House'),
('HarperCollins'),
('Simon & Schuster'),
('Macmillan'),
('Oxford University Press'),
('Scholastic');

-- Authors
INSERT INTO author (name) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('Jane Austen'),
('Mark Twain'),
('Agatha Christie'),
('Ernest Hemingway'),
('Isaac Asimov'),
('Gabriel Garcia Marquez'),
('Chinua Achebe');

-- Books
INSERT INTO book (title, publisher_id, language_id, publication_year) VALUES
('Harry Potter and the Philosopher\'s Stone', 1, 1, 1997),
('A Game of Thrones', 2, 1, 1996),
('Pride and Prejudice', 3, 1, 1813),
('Adventures of Huckleberry Finn', 4, 1, 1884),
('Murder on the Orient Express', 5, 1, 1934),
('The Old Man and the Sea', 6, 1, 1952),
('Foundation', 1, 1, 1951),
('One Hundred Years of Solitude', 2, 3, 1967),
('Things Fall Apart', 3, 1, 1958),
('Harry Potter and the Chamber of Secrets', 1, 1, 1998),
('Clash of Kings', 2, 1, 1998),
('Emma', 3, 2, 1815),
('The Adventures of Tom Sawyer', 4, 1, 1876),
('And Then There Were None', 5, 4, 1939),
('For Whom the Bell Tolls', 6, 1, 1940);

-- Book-Author relationships
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1), -- Harry Potter 1 by J.K. Rowling
(2, 2), -- A Game of Thrones by George R.R. Martin
(3, 3), -- Pride and Prejudice by Jane Austen
(4, 4), -- Adventures of Huckleberry Finn by Mark Twain
(5, 5), -- Murder on the Orient Express by Agatha Christie
(6, 6), -- The Old Man and the Sea by Ernest Hemingway
(7, 7), -- Foundation by Isaac Asimov
(8, 8), -- One Hundred Years of Solitude by Gabriel Garcia Marquez
(9, 9), -- Things Fall Apart by Chinua Achebe
(10, 1), -- Harry Potter 2 by J.K. Rowling
(11, 2), -- Clash of Kings by George R.R. Martin
(12, 3), -- Emma by Jane Austen
(13, 4), -- The Adventures of Tom Sawyer by Mark Twain
(14, 5), -- And Then There Were None by Agatha Christie
(15, 6); -- For Whom the Bell Tolls by Ernest Hemingway
 

--Cedric files goes here --



 --Gift's Files go here --
