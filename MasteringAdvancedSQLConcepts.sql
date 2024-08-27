SELECT * FROM Books;
SELECT * FROM Sales;

-- retrieve all books that have higer price than avg of all books
SELECT BookID, Title, Price
FROM Books
WHERE Price>(
    SELECT AVG(Price)
    FROM Books
);

/* finding book ID with highest TotalPrice*/
SELECT BookID
FROM Sales
GROUP BY BookID
HAVING SUM(TotalPrice) = (SELECT MAX(TotalSales)
                          FROM (SELECT SUM(TotalPrice) As TotalSales
                                FROM Sales
                                GROUP BY BookID));

-- find total number of books sold
SELECT SUM(Quantity) as totalbookssold
from Sales

-- calc total revenue from book sales
SELECT SUM(TotalPrice) as totalrev
from Sales;

-- avg book price
SELECT AVG(Price) as avgbookprice
FROM Books;

-- min book price
SELECT MIN(Price) as minbookprice
FROM Books;

-- max book price
SELECT MAX(Price) as maxbookprice
FROM Books;

-- group by author and count how many books they have written
SELECT Author, COUNT(BookID) as howmanybooks
FROM Books
GROUp BY Author;

SELECT *
FROM Books
         INNER JOIN Sales ON Books.BookID = Sales.BookID;

SELECT *
FROM Books
         LEFT JOIN Sales ON Books.BookID = Sales.BookID;

SELECT *
FROM Sales
    RIGHT JOIN Books ON Sales.BookID = Books.BookID;