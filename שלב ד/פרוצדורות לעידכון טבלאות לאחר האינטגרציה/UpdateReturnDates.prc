CREATE OR REPLACE NONEDITIONABLE PROCEDURE UpdateDueDates AS
BEGIN
    -- ????? ???? playLending
    FOR rec IN (SELECT lendingId, lendingDate FROM playLending) LOOP
        -- ????? ????? ?????? ?? ????? ???? ???? ????? ??????
        UPDATE playLending
        SET dueDate = ADD_MONTHS(rec.lendingDate, 1)
        WHERE lendingId = rec.lendingId;
    END LOOP;

    -- ????? ???? bookLending
    FOR rec IN (SELECT lendingId, lendingDate FROM bookLending) LOOP
        -- ????? ????? ?????? ?? ????? ???? ???? ????? ??????
        UPDATE bookLending
        SET dueDate = ADD_MONTHS(rec.lendingDate, 1)
        WHERE lendingId = rec.lendingId;
    END LOOP;

    -- ?????? ????????
    --COMMIT;

    DBMS_OUTPUT.PUT_LINE('All due dates in playLending and bookLending have been updated.');
EXCEPTION
    WHEN OTHERS THEN
        -- ???? ?? ?????? ????? ?? ??????
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; -- ????? ???????? ????? ?? ?????
END;
/
