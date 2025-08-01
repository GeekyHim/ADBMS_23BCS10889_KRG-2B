-- Create Author table
CREATE TABLE Author (
author_id INT PRIMARY KEY,
name VARCHAR(100),
country VARCHAR(100)
);
-- Create Book table
CREATE TABLE Book (
book_id INT PRIMARY KEY,
title VARCHAR(200),
author_id INT,
FOREIGN KEY (author_id) REFERENCES Author(author_id)
);
-- Insert data into Author
INSERT INTO Author (author_id, name, country) VALUES
(1, 'Agatha Christie', 'United Kingdom'),
(2, 'Stephen King', 'United States'),
(3, 'Gabriel Garcia Marquez', 'Colombia'),
(4, 'Jane Austen', 'United Kingdom');
-- Insert data into Book
INSERT INTO Book (book_id, title, author_id) VALUES
(101, 'And Then There Were None', 1),
(102, 'The Shining', 2),
(103, 'One Hundred Years of Solitude', 3),
(104, 'Pride and Prejudice', 4),
(105, 'Murder on the Orient Express', 1),
(106, 'It', 2);
Select * from Author;
Select * from Book;
-- Join the tables to get book title, author name, and country
SELECT
Book.title AS Book_Title,
Author.name AS Author_Name,
Author.country AS Author_Country
FROM
Book
INNER JOIN
Author ON Book.author_id = Author.author_id;