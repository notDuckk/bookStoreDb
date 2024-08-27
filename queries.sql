CREATE TABLE Sales (
                       SaleID     INTEGER PRIMARY KEY,
                       BookID             REFERENCES Books (BookID),
                       SaleDate   Date,
                       Quantity   INTEGER,
                       TotalPrice Float
);

SELECT * FROM Books;

INSERT INTO Books (BookID, Title, Author, PublicationYear, Price)
Values
    (3,"hello2","me2",2004,4.99);

INSERT INTO Sales (SaleID, BookID, SaleDate, Quantity, TotalPrice)
VALUES
    (1, 1, '2024-08-26', 2, 39.98),
    (2, 6, '2024-08-26', 1, 19.99),
    (3, 2, '2024-08-27', 3, 59.97),
    (4, 2, '2024-08-27', 5, 99.95),
    (5, 4, '2024-08-28', 1, 19.99),
    (6, 1, '2024-08-26', 2, 39.98),
    (7, 6, '2024-08-26', 1, 19.99),
    (8, 2, '2024-08-27', 3, 59.97),
    (9, 2, '2024-08-27', 5, 99.95),
    (10, 4, '2024-08-28', 1, 19.99);


SELECT * FROM Sales;

/* find all books that have been sold */
SELECT Sales.BookID, Books.BookID, Books.Title
from Sales
         INNER JOIN Books
                    ON Sales.BookID = Books.BookID;

/* sum of all TotalPrice for all sales */
SELECT Sales.BookID, SUM(TotalPrice)
FROM Sales
         JOIN Books ON Sales.BookID = Books.BookID
GROUP BY Sales.BookID,Books.BookID;

/* find all books that have not been sold */
SELECT BookID,Title
From Books
WHERE BookID NOT IN (SELECT BookID FROM Sales);

/* fina the book with highest total sales*/
SELECT Sales.BookID, Books.Title, SUM(Sales.TotalPrice)
FROM Sales
         JOIN Books ON Sales.BookID = Books.BookID
GROUP BY Sales.BookID, Books.Title
ORDER BY TotalPrice DESC
LIMIT 1;

/* For each author find total sales for books*/
SELECT Author, SUM(TotalPrice)
FROM Books
         JOIN Sales ON Books.BookID = Sales.BookID
GROUP BY Author;

/* update quantity of sale record */
UPDATE Sales SET Quantity = 5 WHERE SaleID = 1;

/* delete sale record */
DELETE FROM Sales WHERE SaleID = 6;

/* update price of book based on performance & reduce price if sales are low*/
UPDATE Books
SET Price = Price * 0.9
WHERE BookID IN (SELECT BookID FROM Sales GROUP BY BookID HAVING SUM(TotalPrice) < 50);


SELECT * FROM Sales;