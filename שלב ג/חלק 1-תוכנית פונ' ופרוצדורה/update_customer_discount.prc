create or replace procedure update_customer_discount(customer_id IN NUMBER, 
                                                                 discount_info OUT SYS_REFCURSOR) 
is
    type purchase_record_type is record (
        purchase_id number,
        total_items number
    );
    purchase_record purchase_record_type;

    cursor purchase_cursor is
        select p.purchaseid, count(bs.bookid) as total_items
        from purchase p
        join booksales bs on p.purchaseid = bs.purchaseid natural join bookcoppy bc
        where p.customerid = customer_id and bc.status='in stock'
        group by p.purchaseid;

    max_items number := 0;
    discount_percentage number := 0;

begin
    -- open cursor
    open purchase_cursor;
    
    loop
        fetch purchase_cursor into purchase_record;
        exit when purchase_cursor%notfound;

        -- check if the current purchase has more items than the previous maximum
        if purchase_record.total_items > max_items then
            max_items := purchase_record.total_items;
        end if;
    end loop;

    close purchase_cursor;

    -- determine discount percentage based on max items
    case
        when max_items >= 100 then
            discount_percentage := 70;
        when max_items >= 20 then
            discount_percentage := 40;
        when max_items >= 10 then
            discount_percentage := 20;
        else
            discount_percentage := 0;
    end case;

    -- update customer's discount percentage
    update customer
    set discountpercentage = discount_percentage
    where customerid = customer_id;

    -- open ref cursor to return discount info
    open discount_info for
        select customerid, customerfname, discountpercentage
        from customer
        where customerid = customer_id;

    -- print message based on discount applied
    if discount_percentage > 0 then
        dbms_output.put_line('customer ' || customer_id || ' is eligible for a ' || discount_percentage || 
        '% discount. discount updated.'|| ' he purchased '|| max_items||' items');
    else
        dbms_output.put_line('customer ' || customer_id || 
                                       ' is not eligible for any discount based on their purchase history.');
    end if;

exception
    when no_data_found then
        dbms_output.put_line('no purchase records found for customer ' || customer_id);
    when others then
        dbms_output.put_line('error updating discount for customer ' || customer_id);
end update_customer_discount;
/
