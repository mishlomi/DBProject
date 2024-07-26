CREATE OR REPLACE PROCEDURE update_available_playcopy 
IS
       -- משתנה לשמירת מספר העותקים הזמינים
    v_available_copies NUMBER;

BEGIN
    

    -- לולאה לעבור על כל השורות בטבלת PlayOrders
    FOR r IN (SELECT orderID, playID FROM PlayOrders) LOOP
        -- חשב את מספר העותקים הזמינים עבור playID הנוכחי
        BEGIN
            SELECT COUNT(*)
            INTO v_available_copies
            FROM playCopy
            WHERE playID = r.playID
            AND available = 1;

            -- עדכן את הערך בעמודה availableCopies בטבלת PlayOrders
            UPDATE PlayOrders
            SET availableCopies = v_available_copies
            WHERE orderID = r.orderID;

            -- הודעת פלט להצגת הערכים המעודכנים
            DBMS_OUTPUT.PUT_LINE('orderID: ' || r.orderID || ', playID: ' || r.playID || ', availableCopies: ' || v_available_copies);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('No data found for playID: ' || r.playID);
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        END;
    END LOOP;

    -- התחייב לשינויים
    COMMIT;
END;
/
