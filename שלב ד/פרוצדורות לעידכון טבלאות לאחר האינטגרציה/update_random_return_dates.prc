CREATE OR REPLACE PROCEDURE update_random_return_dates AS
BEGIN
    -- עדכון תאריך החזרה להשאלות של ספרים
    FOR rec IN (SELECT lendingId, lendingDate FROM bookLending) LOOP
        UPDATE bookLending
        SET returnDate = lendingDate + TRUNC(DBMS_RANDOM.VALUE(2, 42))
        WHERE lendingId = rec.lendingId;
    END LOOP;

    -- עדכון תאריך החזרה להשאלות של משחקים
    FOR rec IN (SELECT lendingId, lendingDate FROM playLending) LOOP
        UPDATE playLending
        SET returnDate = lendingDate + TRUNC(DBMS_RANDOM.VALUE(2, 42))
        WHERE lendingId = rec.lendingId;
    END LOOP;

    -- אישור השינויים
    --COMMIT;
END;
/
