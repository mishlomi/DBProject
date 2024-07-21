--קוד להוספת עותקים עבור כל ספר בין 1 ל30
declare
  cursor c_books is
    select bookid
    from book;

  r_book c_books%rowtype;
  v_insert_count number;
  v_serialnumber number := 40000; -- המספר הסידורי ההתחלתי
begin
  open c_books;

  loop
    fetch c_books into r_book;
    exit when c_books%notfound;

    -- הגרלה של מספר עותקים להוספה בין 1 ל-30
    v_insert_count := round(dbms_random.value(1, 30));

    -- הוספת העותקים החדשים
    for i in 1..v_insert_count loop
      insert into bookcoppy (serialnumber, status, condition, bookid)
      values (v_serialnumber, 'in stock', 'new', r_book.bookid);
      
      v_serialnumber := v_serialnumber + 1; -- עדכון המספר הסידורי
    end loop;

    --dbms_output.put_line('Added ' || v_insert_count || ' copies of book ID ' || r_book.bookid);
  end loop;

  close c_books;
end;

--select * from bookcoppy;

