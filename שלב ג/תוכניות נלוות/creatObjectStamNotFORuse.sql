
-- 14/07/2024
-- create object type to hold book details
create or replace type book_obj as object (
    bookid number,
    copiesinstock number
);

-- create table type to hold multiple book objects
create or replace type book_table as table of book_obj;
