﻿declare
  cursor c_books is
    select bookid, bookname
    from book;

  r_book c_books%rowtype;
  v_copy_count number;
begin
  open c_books;
  
  loop
    fetch c_books into r_book;
    exit when c_books%notfound;
    
    -- ספירת העותקים עבור הספר הנוכחי
    select count(*)
    into v_copy_count
    from bookcoppy
    where bookid = r_book.bookid;
    
    -- הדפסת כמות העותקים של הספר הנוכחי
    dbms_output.put_line('Book ID: ' || r_book.bookid || ' : ' || v_copy_count);
  end loop;
  
  close c_books;
end;


--select * from book_orders;
