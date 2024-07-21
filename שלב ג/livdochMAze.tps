-- create object type to hold book details
create or replace type book_obj as object (
    bookid number,
    bookname varchar2(30),
    copiesinstock number
);

-- create table type to hold multiple book objects
create or replace type book_table as table of book_obj;

-- create the procedure
create or replace procedure get_top5_used_books_by_category (
    p_category in book.categorys%type
)
is
    -- define cursor to select books from given category with status 'used'
    cursor c_books is
        select b.bookid, b.bookname, count(bc.serialnumber) as copiesinstock
        from book b
        join bookcoppy bc on b.bookid = bc.bookid
        where b.categorys = p_category and bc.status = 'used'
        group by b.bookid, b.bookname
        order by copiesinstock desc;
    
    -- define record type to hold a book's details
    type bookrecord is record (
        bookid book.bookid%type,
        bookname book.bookname%type,
        copiesinstock number
    );

    -- variables to hold data during processing
    v_bookrecord bookrecord;
    v_counter pls_integer := 1;
    v_books book_table := book_table(); -- initialize table of book objects
    
begin
    open c_books;
    
    loop
        fetch c_books into v_bookrecord;
        exit when c_books%notfound or v_counter > 5;
        
        -- add book record to the table
        v_books.extend;
        v_books(v_counter) := book_obj(v_bookrecord.bookid, v_bookrecord.bookname, v_bookrecord.copiesinstock);
        
        v_counter := v_counter + 1;
    end loop;
    
    close c_books;
    
    -- print the top 5 books and their copies in stock
    for i in 1..v_books.count loop
        dbms_output.put_line('book id: ' || v_books(i).bookid || ', book name: ' || v_books(i).bookname || ', copies in stock: ' || v_books(i).copiesinstock);
    end loop;
    
exception
    when others then
        raise_application_error(-20001, 'an error occurred: ' || sqlerrm);
end;



--create or replace procedure get_top5_used_books_by_category ( p_category in book.categorys%type) is
--begin
  
--end get_top5_used_books_by_category ;
/
