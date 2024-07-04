--(1) UPDATE 
UPDATE Membership m
SET MembershipType = 'Yearly'
WHERE m.CustomerID IN (
    SELECT c.CustomerID
    FROM Customer c
    JOIN (
        SELECT p.CustomerID
        FROM purchase p
        JOIN BookSales bs ON p.PurchaseID = bs.PurchaseID
        GROUP BY p.CustomerID
        HAVING COUNT(*) > 5
    ) PurchasesCount ON c.CustomerID = PurchasesCount.CustomerID
);

--(2) UPDATE worker position to be manager
UPDATE worker
SET Position = 'Manager'
WHERE WorkerId IN (
    SELECT w.WorkerId
    FROM worker w
    JOIN purchase p ON w.WorkerId = p.WorkerId
    JOIN BookSales bs ON p.PurchaseID = bs.PurchaseID
    GROUP BY w.WorkerId
    ORDER BY COUNT(bs.BookID) DESC
    FETCH FIRST 3 ROWS ONLY
);

--(1) Deleting the subscriptions of inactive customers
DELETE FROM Membership m
WHERE EndDate < TO_DATE('2024-06-01', 'YYYY-MM-DD')
  AND NOT EXISTS (
    SELECT 1
    FROM purchase p
    WHERE p.CustomerID = m.CustomerID
      AND p.PurchaseDate BETWEEN m.StartDate AND m.EndDate
  );
  
select *
FROM Membership m
WHERE EndDate < TO_DATE('2024-06-01', 'YYYY-MM-DD')
  AND NOT EXISTS (
    SELECT 1
    FROM purchase p
    WHERE p.CustomerID = m.CustomerID
      AND p.PurchaseDate BETWEEN m.StartDate AND m.EndDate
  );

--(2) Deletion of employees who no longer work
DELETE FROM worker
WHERE NOT EXISTS (
    SELECT 1
    FROM purchase p
    WHERE p.WorkerId = worker.WorkerId
);

SELECT *
FROM worker w
WHERE NOT EXISTS (
    SELECT 1
    FROM purchase p
    WHERE p.WorkerId = w.WorkerId
);


