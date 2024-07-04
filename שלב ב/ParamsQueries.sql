--check from when the book didnt sale  (1)
SELECT BookID, BookName, Categorys, Author, Title, Price, PageNumbers
FROM Book
WHERE BookID NOT IN (
    SELECT DISTINCT b.BookID
    FROM Book b 
    JOIN BookSales bs ON b.BookID = bs.BookID
    JOIN purchase p ON bs.PurchaseID = p.PurchaseID
    WHERE p.PurchaseDate >= &<name="d_from" hint="date from when the book didnt sale" type="date" required="true">
)
GROUP BY BookID, BookName, Categorys, Author, Title, Price, PageNumbers
HAVING COUNT(*) = 1;

--check number of available coppys from books  (2)
SELECT b.BookID, b.BookName, b.categorys, b.author, sub.TotalCopies
FROM Book b
LEFT JOIN (
    SELECT BookID, COUNT(SerialNumber) AS TotalCopies
    FROM BookCoppy
    GROUP BY BookID
) sub ON b.BookID = sub.BookID
WHERE sub.TotalCopies < &<name="numCoppy" 
                          hint="number of available coppys from books" 
                          type="integer"
                          required="true">;
                          
                          
--customer that payd a high totalPrice   (3)
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
      
--insert new book into Book table  (4.1)    
INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers)      
VALUES (&<name="BookID" type="integer" hint="enter number between 400000-500000" required="true">, 
        &<name="BookName" type="string" hint="enter the name of the book" required="true">, 
        &<name="Categorys" type="string" hint="select the category of the book" 
                 list=" Childrens, cookingAndBaking,Fantasy, Fiction,  History, 
                     Memoir, Mstery, Poetry, Romance, Science ,
                     Thriller, Travel, Young ,Adult"
                     description="true" >,
       &<name="Author" type="string" hint="enter author of the book" >,
       &<name="Title" type="string" hint="enter title of the book">, 
       &<name="Price" type="integer" hint="enter the price of the book" required="true" default="50">,
       &<name="PageNumbers" type="integer" hint="enter the number of pages of the book" default="0">);

--insert new book into BookCoppy table  (4.2)
INSERT INTO BookCoppy (SerialNumber, Status, BookID)
VALUES (&<name="SerialNumber" type="integer" hint="select number between 1-200" type="integer" required="true" >, 
        &<name="Status" type="string" hint="select the status of the book" list="new, new-used, used"> , 
        &<name="BookID" type="integer" hint="select BookID from Book"  required="true">);


select * from book b natural join bookcoppy bc where bookid>=440000;



