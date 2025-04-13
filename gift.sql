
-- Create Tables


-- Country Table
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

-- Publisher Table
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(150) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Author Table
CREATE TABLE author (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birth_date DATE,
    nationality VARCHAR(100)
);

-- Book Table
CREATE TABLE book (
    book_id INT PRIMARY KEY,
    publisher_id INT,
    language_id INT,
    publication_year INT,
    isbn VARCHAR(20),
    price DECIMAL(8, 2),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Book_Author Table
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- ===========================
-- Insert Sample Data
-- ===========================

-- Country Data
INSERT INTO country (country_id, country_name) VALUES
(1, 'Kenya'),
(2, 'United States'),
(3, 'India'),
(4, 'United Kingdom'),
(5, 'Canada'),
(6, 'Germany');

-- Publisher Data
INSERT INTO publisher (publisher_id, publisher_name, country_id) VALUES
(1, 'TextBook Centre', 1),
(2, 'O’Reilly Media', 2),
(3, 'Penguin Books', 4),
(4, 'Tata McGraw-Hill', 3),
(5, 'Nelson Education', 5),
(6, 'Springer', 6);

-- Author Data
INSERT INTO author (author_id, first_name, last_name, birth_date, nationality) VALUES
(1, 'James', 'Mwangi', '1980-04-12', 'Kenyan'),
(2, 'Susan', 'Collins', '1972-11-10', 'American'),
(3, 'Amit', 'Sharma', '1985-06-21', 'Indian'),
(4, 'George', 'Martin', '1948-09-20', 'British'),
(5, 'Lisa', 'Thompson', '1990-05-30', 'Canadian'),
(6, 'Karl', 'Müller', '1978-02-14', 'German'),
(7, 'Fatuma', 'Njeri', '1983-08-09', 'Kenyan'),
(8, 'John', 'Doe', '1991-12-01', 'American');

-- Book Data
INSERT INTO book (book_id, publisher_id, language_id, publication_year, isbn, price) VALUES
(1, 1, 1, 2020, '978-1-56619-909-4', 1500.00),
(2, 2, 2, 2018, '978-0-262-03384-8', 2800.00),
(3, 3, 3, 2022, '978-3-16-148410-0', 2300.00),
(4, 4, 2, 2019, '978-0-596-52068-7', 1950.00),
(5, 5, 1, 2021, '978-1-86197-876-9', 2200.00),
(6, 6, 1, 2017, '978-0-201-03801-0', 3100.00),
(7, 1, 2, 2023, '978-0-12345-678-9', 1250.00),
(8, 3, 3, 2016, '978-1-4028-9462-6', 1700.00);

-- Book_Author Data
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(3, 4),  -- multiple authors for one book
(5, 1);  -- co-author for another
