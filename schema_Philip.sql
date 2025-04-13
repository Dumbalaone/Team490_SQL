use Bookstore;
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
