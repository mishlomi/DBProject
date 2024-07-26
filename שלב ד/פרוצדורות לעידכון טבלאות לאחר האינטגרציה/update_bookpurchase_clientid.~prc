CREATE OR REPLACE PROCEDURE update_bookpurchase_clientid IS
    -- משתנה לשמירת ערך חוקי מתוך טבלת client
    v_valid_clientid VARCHAR2(9);
    
    -- משתנה לשמירת ערך מספרי של clientid
    v_valid_clientid_num NUMBER;
    
    -- משתנה לספירת מספר השורות המעודכנות
    v_rows_updated NUMBER := 0;

    -- משתנה לכתובת של שורות שדורשות עדכון
    CURSOR c_bookpurchase IS
        SELECT ROWID AS r_id
        FROM bookpurchase
        WHERE clientid NOT IN (SELECT TO_NUMBER(clientid) FROM client);

BEGIN
    -- עבור על כל השורות עם ערכים לא חוקיים
    FOR rec IN c_bookpurchase LOOP
        -- בחר ערך חוקי אקראי מתוך טבלת client
        BEGIN
            SELECT clientid
            INTO v_valid_clientid
            FROM client
            ORDER BY DBMS_RANDOM.VALUE -- בחר ערך אקראי
            FETCH FIRST ROW ONLY;

            -- המר את ערך ה- clientid ל- NUMBER
            v_valid_clientid_num := TO_NUMBER(v_valid_clientid);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('No valid client ID found in client table.');
                CONTINUE; -- המשך לשורה הבאה אם אין נתונים
            WHEN VALUE_ERROR THEN
                DBMS_OUTPUT.PUT_LINE('Invalid client ID format.');
                CONTINUE; -- המשך לשורה הבאה אם יש בעיה בהמרה
        END;

        -- עדכן את השורה בטבלת bookpurchase
        UPDATE bookpurchase
        SET clientid = v_valid_clientid_num
        WHERE ROWID = rec.r_id;

        -- עדכן את הספירה של מספר השורות המעודכנות
        v_rows_updated := v_rows_updated + 1;
        
        -- הצג את מזהה השורה ומידע נוסף אם נדרש
        DBMS_OUTPUT.PUT_LINE('Updated ROWID: ' || rec.r_id || ' to ' || v_valid_clientid_num);
    END LOOP;

    -- הצג את מספר השורות שנעדכנו
    DBMS_OUTPUT.PUT_LINE(v_rows_updated || ' rows updated.');
    
    -- התחייב לשינויים
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; -- ביטול שינויים במקרה של שגיאה
END;
/
