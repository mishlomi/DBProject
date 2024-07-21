create or replace procedure create_book_order(p_order_id in number, p_book_id in number) 
is
  cursor book_cursor is
    select count(*) as total_available_copies
    from bookcoppy
    where bookid = p_book_id
    and status = 'in stock' ;

  v_available_copies number;
  v_order_quantity number;
begin
  -- Open the cursor
  open book_cursor;
  fetch book_cursor into v_available_copies;
  
  if book_cursor%notfound then
    -- If no available copies found
    dbms_output.put_line('no available copies found for book id ' || p_book_id);
    close book_cursor;
    return;
  end if;

  -- Use CASE to determine order quantity
  v_order_quantity := case
    when v_available_copies < 5 then 30
    when v_available_copies < 10 then 20
    when v_available_copies < 20 then 10
    when v_available_copies < 30 then 0
    else 0
  end;

  -- Create a new order
  if v_order_quantity>0 then
     insert into book_orders (orderid, bookid, availablecopies, orderquantity)
     values (p_order_id, p_book_id, v_available_copies, v_order_quantity);
  end if;
  -- Close the cursor
  close book_cursor;

  -- Print message about the new order created
  --dbms_output.put_line('new order created: order id = ' || p_order_id || ', book id = ' || 
   --                         p_book_id || ', available copies = ' || v_available_copies || 
     --                       ', order quantity = ' || v_order_quantity);

exception
  when no_data_found then
    dbms_output.put_line('no available copies found for book id ' || p_book_id);
  when others then
    dbms_output.put_line('error occurred: ' || sqlerrm);
end create_book_order;
/
