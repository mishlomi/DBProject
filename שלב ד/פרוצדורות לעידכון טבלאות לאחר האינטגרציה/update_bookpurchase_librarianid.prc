CREATE OR REPLACE PROCEDURE update_bookpurchase_librarianid IS
    -- משתנה לשמירת ערך חוקי מתוך טבלת librarian
    v_valid_librarianid librarian.librarianId%TYPE;

    -- משתנה לספירת מספר השורות המעודכנות
    v_rows_updated NUMBER := 0;

    -- משתנה לכתובת של שורות שדורשות עדכון
    CURSOR c_bookpurchase IS
        SELECT ROWID AS r_id
        FROM bookpurchase;

    -- רשימה של librarianIds זמינים
    TYPE librarianid_table IS TABLE OF librarian.librarianId%TYPE;
    v_valid_librarianids librarianid_table;

BEGIN
    -- קבלת כל librarianIds מתוך טבלת librarian
    SELECT librarianId BULK COLLECT INTO v_valid_librarianids FROM librarian;

    -- עבור על כל השורות בטבלת bookpurchase
    FOR rec IN c_bookpurchase LOOP
        -- בחר ערך חוקי אקראי מתוך הרשימה
        v_valid_librarianid := v_valid_librarianids(
            TRUNC(DBMS_RANDOM.VALUE(1, v_valid_librarianids.COUNT) + 1)
        );

        -- עדכן את השורה בטבלת bookpurchase
        UPDATE bookpurchase
        SET librarianId = v_valid_librarianid
        WHERE ROWID = rec.r_id;

        -- עדכן את הספירה של מספר השורות המעודכנות
        v_rows_updated := v_rows_updated + 1;

        -- הצג את מזהה השורה ומידע נוסף אם נדרש
        DBMS_OUTPUT.PUT_LINE('Updated: ' || rec.r_id || ' to ' || v_valid_librarianid);
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
