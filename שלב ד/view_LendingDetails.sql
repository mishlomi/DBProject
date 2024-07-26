CREATE OR REPLACE VIEW vw_LendingDetails AS
SELECT DISTINCT
    p.personId AS clientID,
    p.firstName || ' ' || p.lastName AS clientName,
    p.phone AS clientPhone,

    -- פרטי הספר
    CASE
        WHEN bl.copyId IS NOT NULL THEN b.title
        ELSE NULL
    END AS bookTitle,

    -- פרטי המשחק
    CASE
        WHEN pl.copyId IS NOT NULL THEN p1.playName
        ELSE NULL
    END AS playName,

    -- קטגוריות
    CASE
        WHEN bl.copyId IS NOT NULL THEN bcat.categoryName
        ELSE NULL
    END AS bookCategory,

    CASE
        WHEN pl.copyId IS NOT NULL THEN pc.categoryName
        ELSE NULL
    END AS playCategory,
    
    -- סוג הפריט
    CASE   
        WHEN bl.copyId IS NOT NULL THEN 'Book'
        WHEN pl.copyId IS NOT NULL THEN 'Play'
        ELSE NULL
    END AS itemType,

    -- תאריכים
    COALESCE(bl.lendingDate, pl.lendingDate) AS lendingDate,
    COALESCE(bl.dueDate, pl.dueDate) AS dueDate,
    COALESCE(bl.returnDate, pl.returnDate) AS returnDate
FROM
    person p
    LEFT JOIN bookLending bl ON p.personId = bl.clientId
    LEFT JOIN bookCopy bc ON bl.copyId = bc.copyId
    LEFT JOIN book b ON bc.bookId = b.bookId
    LEFT JOIN bookCategory bcat ON b.categoryId = bcat.categoryId
    LEFT JOIN book_author ba ON b.bookId = ba.bookId
    LEFT JOIN playLending pl ON p.personId = pl.clientId
    LEFT JOIN playCopy pc ON pl.copyId = pc.copyId
    LEFT JOIN play p1 ON pc.playId = p1.playId
    LEFT JOIN playCategory pc ON p1.categoryId = pc.categoryId
WHERE
    bl.copyId IS NOT NULL OR pl.copyId IS NOT NULL;


select * from vw_LendingDetails;



--quairy (1)
SELECT 
    p.personId AS clientID,
    p.firstName || ' ' || p.lastName AS clientName,
    p.phone AS clientPhone,
    'Book' AS itemType,
    b.title AS itemTitle,
    bl.lendingDate,
    bl.dueDate,
    bl.returnDate
FROM 
    bookLending bl
    JOIN bookCopy bc ON bl.copyId = bc.copyId
    JOIN book b ON bc.bookId = b.bookId
    JOIN person p ON bl.clientId = p.personId
WHERE 
    bl.returnDate > bl.dueDate
    AND bl.lendingDate >= TO_DATE('01-JAN-2024', 'DD-MON-YYYY')

UNION ALL

SELECT 
    p.personId AS clientID,
    p.firstName || ' ' || p.lastName AS clientName,
    p.phone AS clientPhone,
    'Play' AS itemType,
    p1.playName AS itemTitle,
    pl.lendingDate,
    pl.dueDate,
    pl.returnDate
FROM 
    playLending pl
    JOIN playCopy pc ON pl.copyId = pc.copyId
    JOIN play p1 ON pc.playId = p1.playId
    JOIN person p ON pl.clientId = p.personId
WHERE 
    pl.returnDate > pl.dueDate
    AND pl.lendingDate >= TO_DATE('01-JAN-2023', 'DD-MON-YYYY');


--quairy(2)
WITH LatestLending AS (
    SELECT clientID,MAX(lendingDate) AS maxLendingDate
    FROM vw_LendingDetails
    GROUP BY clientID
)

SELECT 
    p.personId AS clientID,
    p.firstName || ' ' || p.lastName AS clientName,
    p.phone AS clientPhone,
    COALESCE(vl.itemType, 'None') AS itemType,
    COALESCE(vl.bookTitle, vl.playName, 'No Item') AS itemTitle,
    vl.lendingDate AS lendingDate,
    vl.dueDate AS dueDate,
    vl.returnDate AS returnDate
FROM 
    person p
    LEFT JOIN LatestLending ll ON p.personId = ll.clientID
    LEFT JOIN vw_LendingDetails vl 
        ON p.personId = vl.clientID 
        AND ll.maxLendingDate = vl.lendingDate
ORDER BY p.personId;
