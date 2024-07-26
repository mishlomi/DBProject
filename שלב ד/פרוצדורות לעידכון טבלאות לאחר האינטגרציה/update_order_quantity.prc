CREATE OR REPLACE PROCEDURE update_order_quantity 
IS
       -- משתנה לאחסון הערך האקראי
    v_random_value NUMBER;

BEGIN
    

    -- לולאה לעבור על כל השורות בטבלת PlayOrders
    FOR r IN (SELECT orderID FROM PlayOrders) LOOP
        -- יצירת ערך אקראי בין 20 ל-25
        v_random_value := TRUNC(DBMS_RANDOM.VALUE(20, 26));

        -- עדכון השדה orderQuantity
        UPDATE PlayOrders
        SET orderQuantity = v_random_value
        WHERE orderID = r.orderID;

        -- הודעת פלט להצגת הערכים המעודכנים (אופציונלי)
        DBMS_OUTPUT.PUT_LINE('orderID: ' || r.orderID || ', orderQuantity: ' || v_random_value);
    END LOOP;

    -- התחייב לשינויים
    --COMMIT;
END;
/
