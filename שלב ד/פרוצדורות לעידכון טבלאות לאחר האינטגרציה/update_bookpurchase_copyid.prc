CREATE OR REPLACE PROCEDURE update_bookpurchase_copyid IS
    -- משתנה לשמירת ערך חוקי מתוך טבלת bookCopy
    v_valid_copyid bookCopy.copyId%TYPE;

    -- משתנה לספירת מספר השורות המעודכנות
    v_rows_updated NUMBER := 0;

    -- משתנה לכתובת של שורות שדורשות עדכון
    CURSOR c_bookpurchase IS
        SELECT ROWID AS r_id
        FROM bookPurchase;

    -- רשימה של copyIds זמינים
    TYPE copyid_table IS TABLE OF bookCopy.copyId%TYPE;
    v_valid_copyids copyid_table;

BEGIN
    -- קבלת כל copyIds מתוך טבלת bookCopy
    SELECT copyId BULK COLLECT INTO v_valid_copyids FROM bookCopy;

    -- עבור על כל השורות בטבלת bookPurchase
    FOR rec IN c_bookpurchase LOOP
        -- בחר ערך חוקי אקראי מתוך הרשימה
        v_valid_copyid := v_valid_copyids(
            TRUNC(DBMS_RANDOM.VALUE(1, v_valid_copyids.COUNT) + 1)
        );

        -- עדכן את השורה בטבלת bookPurchase
        UPDATE bookPurchase
        SET copyId = v_valid_copyid
        WHERE ROWID = rec.r_id;

        -- עדכן את הספירה של מספר השורות המעודכנות
        v_rows_updated := v_rows_updated + 1;

        -- הצג את מזהה השורה ומידע נוסף אם נדרש
        DBMS_OUTPUT.PUT_LINE('Updated: ' || rec.r_id || ' to ' || v_valid_copyid);
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
