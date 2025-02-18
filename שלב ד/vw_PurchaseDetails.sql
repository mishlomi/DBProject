﻿CREATE OR REPLACE VIEW vw_PurchaseDetails AS
SELECT
    p.personId AS clientID,
    p.firstName || ' ' || p.lastName AS clientName,
    p.phone AS clientPhone,

    -- פרטי הספר
    CASE
        WHEN bp.bookId IS NOT NULL THEN b.title
        ELSE NULL
    END AS bookTitle,

    -- פרטי המשחק
    CASE
        WHEN pp.copyId IS NOT NULL THEN p1.playName
        ELSE NULL
    END AS playName,

    -- סוג הפריט
    CASE
        WHEN bp.bookId IS NOT NULL THEN 'Book'
        WHEN pp.copyId IS NOT NULL THEN 'Play'
        ELSE NULL
    END AS itemType,

    -- פרטי הרכישה
    COALESCE(bp.purchaseDate, pp.purchaseDate) AS purchaseDate,
    COALESCE(bp.Quantity, pp.Quantity) AS quantity
FROM
    person p
    LEFT JOIN bookPurchase bp ON p.personId = bp.clientId
    LEFT JOIN book b ON bp.bookId = b.bookId
    LEFT JOIN playPurchase pp ON p.personId = pp.clientId
    LEFT JOIN playCopy pc ON pp.copyId = pc.copyId
    LEFT JOIN play p1 ON pc.playId = p1.playId;


select * from vw_PurchaseDetails;

--quairy (1)
WITH MonthlyPurchases AS (
    SELECT
        EXTRACT(YEAR FROM purchaseDate) AS purchaseYear,
        EXTRACT(MONTH FROM purchaseDate) AS purchaseMonth,
        itemType,
        COUNT(*) AS totalPurchases,
        SUM(quantity) AS totalItems
    FROM
        vw_PurchaseDetails
    WHERE
        EXTRACT(YEAR FROM purchaseDate) = 2024
    GROUP BY
        EXTRACT(YEAR FROM purchaseDate),
        EXTRACT(MONTH FROM purchaseDate),
        itemType
),
MonthlyAverages AS (
    SELECT
        purchaseYear,
        purchaseMonth,
        itemType,
        totalPurchases,
        totalItems,
        AVG(totalPurchases) OVER (PARTITION BY itemType) AS avgMonthlyPurchases,
        AVG(totalItems) OVER (PARTITION BY itemType) AS avgMonthlyItems
    FROM
        MonthlyPurchases
)
SELECT
    purchaseYear,
    purchaseMonth,
    itemType,
    totalPurchases,
    totalItems,
    ROUND(avgMonthlyPurchases, 2) AS avgMonthlyPurchases,
    ROUND(avgMonthlyItems, 2) AS avgMonthlyItems
FROM
    MonthlyAverages 
ORDER BY
    purchaseYear,
    purchaseMonth,
    itemType;


--quairy (2)
WITH LastPurchases AS (
    SELECT 
        clientID,
        clientName,
        clientPhone,
        itemType,
        COALESCE(bookTitle, playName) AS itemTitle,
        purchaseDate,
        quantity,
        ROW_NUMBER() OVER (PARTITION BY clientID ORDER BY purchaseDate DESC) AS rn
    FROM 
        vw_PurchaseDetails
)
SELECT clientID,clientName,clientPhone,itemType,itemTitle,purchaseDate,quantity
FROM LastPurchases
WHERE rn = 1
ORDER BY clientID;

