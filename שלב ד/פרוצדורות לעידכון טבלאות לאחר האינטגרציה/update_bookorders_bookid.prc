CREATE OR REPLACE PROCEDURE update_bookorders_bookid IS
    -- משתנה לשמירת ערך חוקי מתוך טבלת book
    v_valid_bookid book.bookId%TYPE;

    -- משתנה לספירת מספר השורות המעודכנות
    v_rows_updated NUMBER := 0;

    -- משתנה לכתובת של שורות שדורשות עדכון
    CURSOR c_bookorders IS
        SELECT ROWID AS r_id
        FROM bookorders;

    -- רשימה של bookIds זמינים
    TYPE bookid_table IS TABLE OF book.bookId%TYPE;
    v_valid_bookids bookid_table;

BEGIN
    -- קבלת כל bookIds מתוך טבלת book
    SELECT bookId BULK COLLECT INTO v_valid_bookids FROM book;

    -- עבור על כל השורות בטבלת bookorders
    FOR rec IN c_bookorders LOOP
        -- בחר ערך חוקי אקראי מתוך הרשימה
        v_valid_bookid := v_valid_bookids(
            TRUNC(DBMS_RANDOM.VALUE(1, v_valid_bookids.COUNT) + 1)
        );

        -- עדכן את השורה בטבלת bookorders
        UPDATE bookorders
        SET bookId = v_valid_bookid
        WHERE ROWID = rec.r_id;

        -- עדכן את הספירה של מספר השורות המעודכנות
        v_rows_updated := v_rows_updated + 1;

        -- הצג את מזהה השורה ומידע נוסף אם נדרש
        DBMS_OUTPUT.PUT_LINE('Updated: ' || rec.r_id || ' to ' || v_valid_bookid);
    END LOOP;

    -- הצג את מספר השורות שנעדכנו
    DBMS_OUTPUT.PUT_LINE(v_rows_updated || ' rows updated.');

    -- התחייב לשינויים
    --COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; -- ביטול שינויים במקרה של שגיאה
END;
/
