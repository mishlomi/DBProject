declare
  cursor c_books is
    select bookid
    from book;
  
  r_book c_books%rowtype;
  v_order_id number := 60000;  -- starting order ID
  v_start_serialnumber number := 20000;  -- starting serial number
  v_total_copies number;
  v_order_quantity number;
  type t_order_record is record (
    orderquantity number
  );
  r_order t_order_record;
  cursor c_orders(p_bookid number) is
    select orderquantity
    from book_orders
    where bookid = p_bookid
    for update;
begin
  -- Open the cursor for books
  open c_books;
  
  loop
    fetch c_books into r_book;
    exit when c_books%notfound;  -- exit if no more books
    
    -- Call the procedure to create a new book order
    create_book_order(v_order_id, r_book.bookid);
    
    -- Initialize order quantity
    v_order_quantity := 0;
    
    -- Open the cursor for orders
    open c_orders(r_book.bookid);
    fetch c_orders into r_order;
    
    if c_orders%found then
      v_order_quantity := r_order.orderquantity;
    end if;
    
    close c_orders;
    
    -- Call the function to create book copies
    if v_order_quantity > 0 then
      v_total_copies := create_book_copies(r_book.bookid, v_start_serialnumber);
      
      -- Increment order ID and starting serial number for the next iteration
      v_order_id := v_order_id + 1;
      v_start_serialnumber := v_start_serialnumber + v_order_quantity; 
      
      end if;
  end loop;
  
  -- Close the cursor
  close c_books;
exception
  when others then
    dbms_output.put_line('Error: ' || sqlerrm);
end;


--select * from book_orders;

--DELETE FROM book_orders;


