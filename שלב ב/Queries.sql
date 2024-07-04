-- (1)
SELECT BookID, BookName, Categorys, Author, Title, Price, PageNumbers
FROM Book
WHERE BookID NOT IN (
    SELECT DISTINCT b.BookID
    FROM Book b 
    JOIN BookSales bs ON b.BookID = bs.BookID
    JOIN purchase p ON bs.PurchaseID = p.PurchaseID
    WHERE p.PurchaseDate >= TO_DATE('01/01/2022','DD/MM/YYYY' )
)
GROUP BY BookID, BookName, Categorys, Author, Title, Price, PageNumbers
HAVING COUNT(*) = 1;


-- (2)
SELECT c.CustomerID, c.CustomerFname, c.CustomerLname, c.CustomerPhone, c.CustomerEmail
FROM Customer c
LEFT JOIN (
    SELECT p.CustomerID
    FROM purchase p
    WHERE p.PurchaseDate >= TO_DATE('2021-01-01', 'YYYY-MM-DD')
    GROUP BY p.CustomerID
) recent_purchases ON c.CustomerID = recent_purchases.CustomerID
WHERE recent_purchases.CustomerID IS NULL;


-- (3)
SELECT Categorys, SaleCount
FROM (
    SELECT b.Categorys, COUNT(bs.BookID) AS SaleCount
    FROM Book b
    JOIN BookSales bs ON b.BookID = bs.BookID
    GROUP BY b.Categorys
    ORDER BY SaleCount DESC
    FETCH FIRST 3 ROWS ONLY
);


-- (4)
SELECT w.WorkerId, w.WorkerFname, w.WorkerLname,
       subquery.TotalItemsSold,
       subquery.TotalRevenue
FROM worker w
JOIN (
    SELECT p.WorkerId,
           SUM(p.Quantity) AS TotalItemsSold,
           SUM(p.Quantity * b.Price) AS TotalRevenue
    FROM purchase p
    JOIN BookSales bs ON p.PurchaseID = bs.PurchaseID
    JOIN Book b ON bs.BookID = b.BookID
    GROUP BY p.WorkerId
    ORDER BY TotalItemsSold DESC
    FETCH FIRST 5 ROWS ONLY
) subquery ON w.WorkerId = subquery.WorkerId;


