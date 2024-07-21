create or replace function create_book_copies(p_idbook in number, p_start_serialnumber in number) 
return number 
is
  cursor c_order is
    select bookid, orderquantity, availablecopies
    from book_orders
    where bookid = p_idbook
    for update;
    
  r_order c_order%rowtype;
  v_available_copies number;
  v_serialnumber number := p_start_serialnumber;
begin
  -- Open the cursor
  open c_order;
  fetch c_order into r_order;

  if c_order%notfound then
    -- If no order found
    close c_order;
    raise_application_error(-20001, 'No order found for the given book ID');
  end if;

  -- Create new copies in the BookCoppy table
  for i in 1..r_order.orderquantity loop
    insert into bookcoppy (serialnumber, status, condition, bookid)
    values (v_serialnumber, 'in stock', 'new', r_order.bookid);
    v_serialnumber := v_serialnumber + 1;
  end loop;

  -- Update availableCopies and reset orderQuantity in book_orders table
  update book_orders
  set availablecopies = r_order.availablecopies + r_order.orderquantity,
      orderquantity = 0
  where bookid = r_order.bookid;

  -- Close the cursor
  close c_order;

  -- Fetch the total available copies from the BookCoppy table
  select count(*)
  into v_available_copies
  from bookcoppy
  where bookid = p_idbook;

  -- Return the total available copies
  return v_available_copies;
exception
  when no_data_found then
    raise_application_error(-20001, 'No order found for the given book ID');
  when others then
    raise_application_error(-20002, 'An error occurred: ' || sqlerrm);
end create_book_copies;
/
