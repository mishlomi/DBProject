SELECT c.CustomerID, c.CustomerFname, c.CustomerLname, c.CustomerPhone, c.CustomerEmail,
       m.MembershipID, m.StartDate, m.EndDate, m.MembershipType
FROM Customer c
JOIN (
    SELECT p.CustomerID
    FROM purchase p
    JOIN BookSales bs ON p.PurchaseID = bs.PurchaseID
    GROUP BY p.CustomerID
    HAVING COUNT(*) > 5
) PurchasesCount ON c.CustomerID = PurchasesCount.CustomerID
LEFT JOIN Membership m ON c.CustomerID = m.CustomerID;


SELECT w.WorkerId, w.WorkerFname, w.WorkerLname, COUNT(bs.BookID) AS TotalItemsSold, w.position
FROM worker w
JOIN purchase p ON w.WorkerId = p.WorkerId
JOIN BookSales bs ON p.PurchaseID = bs.PurchaseID
GROUP BY w.WorkerId, w.WorkerFname, w.WorkerLname, w.position
ORDER BY TotalItemsSold DESC
FETCH FIRST 3 ROWS ONLY;

SELECT *
FROM worker w
WHERE NOT EXISTS (
    SELECT 1
    FROM purchase p
    WHERE p.WorkerId = w.WorkerId
);


SELECT *
FROM Book b
WHERE NOT EXISTS (
    SELECT 1
    FROM BookSales bs
    JOIN purchase p ON bs.PurchaseID = p.PurchaseID
    WHERE bs.BookID = b.BookID
    AND p.PurchaseDate BETWEEN TO_DATE('2021-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-06-01', 'YYYY-MM-DD')
);



SELECT c.CustomerID, c.CustomerFname, c.CustomerLname, c.CustomerPhone, c.CustomerEmail
FROM Customer c
WHERE (
    SELECT SUM(b.Price * p.Quantity)
    FROM purchase p
    JOIN BookSales bs ON p.PurchaseID = bs.PurchaseID
    JOIN Book b ON bs.BookID = b.BookID
    WHERE p.CustomerID = c.CustomerID
    GROUP BY p.CustomerID
) > &<name="totalPrice" 
      type="integer" 
      hint="total price customer payed" 
      default=1>;
      
      
