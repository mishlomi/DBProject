ALTER TABLE Book
ADD DiscountPrice NUMBER;

ALTER TABLE Customer
ADD DiscountPercentage NUMBER DEFAULT 0;

ALTER TABLE Worker
ADD Bonus NUMBER DEFAULT 0;

update book
set availblecoppys = round(dbms_random.value(1, 20));

ALTER TABLE bookcoppy
RENAME COLUMN status TO condition;

ALTER TABLE bookcoppy
ADD status VARCHAR2(20);

UPDATE BookCoppy
SET Status = 'in stock';

select * from bookcoppy;



-- הגדרת סוג הטבלה של האובייקט
create or replace type book_table as table of book_obj;

