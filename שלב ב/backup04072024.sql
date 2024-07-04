prompt PL/SQL Developer Export Tables for user MICHAL@XE
prompt Created by Avner on יום חמישי 04 יולי 2024
set feedback off
set define off

prompt Creating BOOK...
create table BOOK
(
  bookid      NUMBER not null,
  bookname    VARCHAR2(30) not null,
  categorys   VARCHAR2(30) not null,
  author      VARCHAR2(15),
  title       VARCHAR2(30) not null,
  price       NUMBER not null,
  pagenumbers NUMBER not null
)
;
alter table BOOK
  add primary key (BOOKID);

prompt Creating BOOKCOPPY...
create table BOOKCOPPY
(
  serialnumber NUMBER not null,
  status       VARCHAR2(15) not null,
  bookid       NUMBER not null
)
;
alter table BOOKCOPPY
  add primary key (SERIALNUMBER, BOOKID);
alter table BOOKCOPPY
  add foreign key (BOOKID)
  references BOOK (BOOKID);

prompt Creating WORKER...
create table WORKER
(
  workerid    NUMBER not null,
  workerfname VARCHAR2(15) not null,
  workerlname VARCHAR2(15) not null,
  workerphone NUMBER,
  position    VARCHAR2(15) default 'Employee',
  hiredate    DATE not null
)
;
alter table WORKER
  add primary key (WORKERID);

prompt Creating CUSTOMER...
create table CUSTOMER
(
  customerid    NUMBER not null,
  customerfname VARCHAR2(15) not null,
  customerlname VARCHAR2(15) not null,
  customerphone NUMBER not null,
  customeremail VARCHAR2(30)
)
;
alter table CUSTOMER
  add primary key (CUSTOMERID);
alter table CUSTOMER
  add constraint CHECK_CUSTOMERID_LENGTH
  check (LENGTH(TO_CHAR(CustomerID)) <= 9);

prompt Creating PURCHASE...
create table PURCHASE
(
  purchaseid   NUMBER not null,
  purchasedate DATE not null,
  quantity     NUMBER not null,
  customerid   NUMBER not null,
  workerid     NUMBER not null
)
;
alter table PURCHASE
  add primary key (PURCHASEID);
alter table PURCHASE
  add foreign key (CUSTOMERID)
  references CUSTOMER (CUSTOMERID);
alter table PURCHASE
  add foreign key (WORKERID)
  references WORKER (WORKERID);

prompt Creating BOOKSALES...
create table BOOKSALES
(
  bookid     NUMBER not null,
  purchaseid NUMBER not null
)
;
alter table BOOKSALES
  add primary key (BOOKID, PURCHASEID);
alter table BOOKSALES
  add foreign key (BOOKID)
  references BOOK (BOOKID);
alter table BOOKSALES
  add foreign key (PURCHASEID)
  references PURCHASE (PURCHASEID);

prompt Creating MEMBERSHIP...
create table MEMBERSHIP
(
  membershipid   NUMBER not null,
  startdate      DATE not null,
  enddate        DATE not null,
  membershiptype VARCHAR2(15) not null,
  customerid     NUMBER not null
)
;
alter table MEMBERSHIP
  add primary key (MEMBERSHIPID, CUSTOMERID);
alter table MEMBERSHIP
  add foreign key (CUSTOMERID)
  references CUSTOMER (CUSTOMERID);

prompt Disabling triggers for BOOK...
alter table BOOK disable all triggers;
prompt Disabling triggers for BOOKCOPPY...
alter table BOOKCOPPY disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for PURCHASE...
alter table PURCHASE disable all triggers;
prompt Disabling triggers for BOOKSALES...
alter table BOOKSALES disable all triggers;
prompt Disabling triggers for MEMBERSHIP...
alter table MEMBERSHIP disable all triggers;
prompt Disabling foreign key constraints for BOOKCOPPY...
alter table BOOKCOPPY disable constraint SYS_C008426;
prompt Disabling foreign key constraints for PURCHASE...
alter table PURCHASE disable constraint SYS_C008444;
alter table PURCHASE disable constraint SYS_C008445;
prompt Disabling foreign key constraints for BOOKSALES...
alter table BOOKSALES disable constraint SYS_C008449;
alter table BOOKSALES disable constraint SYS_C008450;
prompt Disabling foreign key constraints for MEMBERSHIP...
alter table MEMBERSHIP disable constraint SYS_C008457;
prompt Deleting MEMBERSHIP...
delete from MEMBERSHIP;
commit;
prompt Deleting BOOKSALES...
delete from BOOKSALES;
commit;
prompt Deleting PURCHASE...
delete from PURCHASE;
commit;
prompt Deleting CUSTOMER...
delete from CUSTOMER;
commit;
prompt Deleting WORKER...
delete from WORKER;
commit;
prompt Deleting BOOKCOPPY...
delete from BOOKCOPPY;
commit;
prompt Deleting BOOK...
delete from BOOK;
commit;
prompt Loading BOOK...
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112459, 'Gone with the Wind', 'Fantasy', 'J.R.R. Tolkien', 'Science Fiction', 66, 54);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112463, 'The Girl on the Train', 'Self-Help', 'Jane Austen', 'Young Adult', 854, 501);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112467, 'The Handmaid''s Tale', 'Cookbook', 'Dan Brown', 'Fantasy', 904, 220);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112471, 'The Handmaid''s Tale', 'Historical Fiction', 'J.R.R. Tolkien', 'Thriller', 87, 622);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112475, 'The Help', 'Business', 'George Orwell', 'Fantasy', 43, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112479, 'Educated', 'Biography', 'J.K. Rowling', 'Travel', 630, 53);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112483, 'One Hundred Years of Solitude', 'Science Fiction', 'William Blake', 'Fantasy', 115, 93);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112487, 'Sapiens', 'Self-Help', 'J.R.R. Tolkien', 'Business', 292, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112491, 'The Catcher in the Rye', 'Travel', 'Agatha Christie', 'Mystery', 10, 98);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112495, 'The Sun Also Rises', 'Biography', 'Dan Brown', 'Biography', 47, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112499, 'The Bell Jar', 'Romance', 'Harper Lee', 'Poetry', 37, 221);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112503, 'Dracula', 'Young Adult', 'J.K. Rowling', 'Poetry', 226, 242);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112507, 'Frankenstein', 'Mystery', 'Mark Twain', 'Fantasy', 626, 99);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112511, 'The Catcher in the Rye', 'Children', 'J.R.R. Tolkien', 'Self-Help', 566, 836);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112515, 'East of Eden', 'Children', 'George Eliot', 'Travel', 581, 19);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112519, 'The Bell Jar', 'Poetry', 'George Eliot', 'Biography', 35, 890);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112523, 'Charlotte''s Web', 'Historical Fiction', 'Margaret Atwood', 'Children', 846, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112527, 'Educated', 'Romance', 'F. Scott Fitzge', 'Mystery', 30, 9);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112531, 'The Handmaid''s Tale', 'Young Adult', 'J.R.R. Tolkien', 'Science Fiction', 79, 36);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112535, 'Little Women', 'Mystery', 'Charles Dickens', 'Mystery', 99, 39);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112539, 'Frankenstein', 'Travel', 'Mark Twain', 'Romance', 313, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112543, 'The Hobbit', 'Travel', 'J.K. Rowling', 'Young Adult', 40, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112547, 'Gone with the Wind', 'Romance', 'Charles Dickens', 'Biography', 41, 31);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112551, 'The Shining', 'Memoir', 'Stephen King', 'Mystery', 47, 83);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112555, 'Alice in Wonderland', 'Romance', 'Jane Austen', 'Business', 15, 332);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112559, 'The Secret History', 'Thriller', 'F. Scott Fitzge', 'Fantasy', 90, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112563, 'War and Peace', 'Biography', 'J.R.R. Tolkien', 'Young Adult', 347, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112567, 'To Kill a Mockingbird', 'Memoir', 'J.R.R. Tolkien', 'Children', 88, 45);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112571, 'In Cold Blood', 'Memoir', 'Agatha Christie', 'Business', 93, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112575, 'The Help', 'Travel', 'J.R.R. Tolkien', 'Business', 633, 35);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112579, 'Sapiens', 'Romance', 'J.K. Rowling', 'Biography', 53, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112583, 'A Game of Thrones', 'Young Adult', 'Mark Twain', 'Romance', 552, 85);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112587, 'Frankenstein', 'Travel', 'Agatha Christie', 'Business', 94, 48);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112591, 'Frankenstein', 'Travel', 'Stephen King', 'Poetry', 652, 67);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112595, 'A Game of Thrones', 'Poetry', 'Harper Lee', 'Poetry', 95, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112599, 'Frankenstein', 'Self-Help', 'Mark Twain', 'Cookbook', 475, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112603, 'Sapiens', 'Romance', 'George Eliot', 'Young Adult', 50, 92);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112607, 'Brave New World', 'Science Fiction', 'Charles Dickens', 'Poetry', 945, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112611, 'The Catcher in the Rye', 'Business', 'Mark Twain', 'Romance', 967, 45);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112615, 'The Help', 'Young Adult', 'Margaret Atwood', 'Self-Help', 820, 66);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112619, 'The Road Less Traveled', 'Cookbook', 'Jane Austen', 'Historical Fiction', 494, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112623, 'East of Eden', 'Thriller', 'Harper Lee', 'Business', 15, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112627, 'Gone with the Wind', 'Fantasy', 'F. Scott Fitzge', 'Business', 49, 67);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112631, 'The Road', 'Science Fiction', 'Dan Brown', 'Cookbook', 40, 720);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112635, 'The Kite Runner', 'Science Fiction', 'Margaret Atwood', 'Historical Fiction', 874, 529);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112639, 'Gone with the Wind', 'Self-Help', 'George Orwell', 'Biography', 483, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112643, 'Anna Karenina', 'Romance', 'F. Scott Fitzge', 'Travel', 90, 47);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112647, 'The Martian', 'Thriller', 'George Orwell', 'Cookbook', 32, 251);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112651, 'A Game of Thrones', 'Travel', 'Mark Twain', 'Memoir', 694, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112655, 'The Book Thief', 'Thriller', 'George Eliot', 'Business', 68, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112659, 'Brave New World', 'Travel', 'J.R.R. Tolkien', 'Travel', 86, 279);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112663, 'Catch-22', 'Cookbook', 'Harper Lee', 'Thriller', 868, 868);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112667, 'Anna Karenina', 'Memoir', 'Dan Brown', 'Biography', 61, 999);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (121212, ' ''The Human Body''', ' ''popular science''', ' ''noam-fine''', '''Biology''', 109.99, 204);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (131313, ' ''tiras ham'' ', ' ''Children Books'' ', ' ''noa-shabat''', ' ''Children''s Books''', 89.9, 9);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (141414, ' ''cheese''', ' ''cooking and baking''', ' ''aharoni'' ', ' ''Instructional''', 149.9, 156);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (151515, ' ''Animals'' ', ' ''Children Books''', ' etay-amos', ' ''picture books''', 60, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (161616, ' ''balloons''', ' ''Children Books''', ' etay-amos', ' ''picture books''', 60, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (21, 'Book1', 'Fiction', 'Author1', 'Title1', 29.99, 300);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (22, 'Book2', 'Fantasy', 'Author2', 'Title2', 19.99, 250);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (23, 'Book3', 'Science Fiction', 'Author3', 'Title3', 24.95, 320);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (24, 'Book4', 'Non-fiction', 'Author4', 'Title4', 34.5, 280);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (25, 'Book5', 'Mystery', 'Author5', 'Title5', 22.5, 400);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (26, 'Book6', 'Thriller', 'Author6', 'Title6', 27.99, 350);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (27, 'Book7', 'Romance', 'Author7', 'Title7', 18.75, 200);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (28, 'Book8', 'Biography', 'Author8', 'Title8', 32, 420);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (29, 'Book9', 'History', 'Author9', 'Title9', 26.5, 380);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (30, 'Book10', 'Self-help', 'Author10', 'Title10', 21.95, 260);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111111, 'The Alchemist', 'Self-Help', 'F. Scott Fitzge', 'Historical Fiction', 628, 24);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111115, 'To Kill a Mockingbird', 'Poetry', 'J.R.R. Tolkien', 'Memoir', 43, 475);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111119, 'Alice in Wonderland', 'Poetry', 'J.R.R. Tolkien', 'Cookbook', 36, 77);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111123, 'Catch-22', 'Travel', 'F. Scott Fitzge', 'Fantasy', 43, 515);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111127, 'The Help', 'Business', 'J.R.R. Tolkien', 'Science Fiction', 422, 404);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111131, 'The Secret History', 'Fantasy', 'Jane Austen', 'Romance', 318, 14);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111135, 'War and Peace', 'Fantasy', 'Mark Twain', 'Romance', 825, 712);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111139, 'The Road', 'Self-Help', 'J.R.R. Tolkien', 'Travel', 202, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111143, 'Jane Eyre', 'Historical Fiction', 'Harper Lee', 'Young Adult', 945, 39);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111147, 'The Goldfinch', 'Mystery', 'Agatha Christie', 'Children', 591, 320);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111151, 'The Kite Runner', 'Young Adult', 'William Blake', 'Cookbook', 91, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111155, 'Anna Karenina', 'Fantasy', 'J.K. Rowling', 'Mystery', 710, 320);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111159, 'Gone with the Wind', 'Poetry', 'Emily Bronte', 'Poetry', 733, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111163, 'Frankenstein', 'Romance', 'George Eliot', 'Biography', 717, 951);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111167, 'Anna Karenina', 'Mystery', 'Dan Brown', 'Business', 622, 253);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111171, 'Alice in Wonderland', 'Memoir', 'F. Scott Fitzge', 'Poetry', 303, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111175, 'Jane Eyre', 'Thriller', 'Stephen King', 'Children', 171, 48);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111179, 'The Secret Garden', 'Young Adult', 'William Blake', 'Romance', 39, 20);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111183, 'Gone with the Wind', 'Self-Help', 'Mark Twain', 'Biography', 97, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111187, 'Dune', 'Science Fiction', 'Harper Lee', 'Travel', 57, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111191, 'In Cold Blood', 'Mystery', 'Dan Brown', 'Travel', 648, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111195, 'Gone with the Wind', 'Biography', 'J.K. Rowling', 'Thriller', 771, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111199, 'The Handmaid''s Tale', 'Cookbook', 'J.K. Rowling', 'Science Fiction', 80, 24);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111203, 'The Hobbit', 'Cookbook', 'Harper Lee', 'Poetry', 95, 50);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111207, 'The Martian', 'Fantasy', 'Stephen King', 'Thriller', 228, 48);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111211, 'The Secret History', 'Poetry', 'J.R.R. Tolkien', 'Memoir', 30, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111215, 'The Book Thief', 'Poetry', 'Dan Brown', 'Young Adult', 481, 15);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111219, 'Gone with the Wind', 'Fantasy', 'Jane Austen', 'Children', 849, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111223, 'The Great Gatsby', 'Business', 'Mark Twain', 'Young Adult', 34, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111227, 'The Kite Runner', 'Poetry', 'Jane Austen', 'Biography', 38, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111231, 'The Goldfinch', 'Memoir', 'Jane Austen', 'Fantasy', 13, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111235, 'One Hundred Years of Solitude', 'Thriller', 'Stephen King', 'Young Adult', 51, 9);
commit;
prompt 100 records committed...
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111239, 'Brave New World', 'Mystery', 'J.K. Rowling', 'Memoir', 11, 69);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111243, 'One Hundred Years of Solitude', 'Historical Fiction', 'Margaret Atwood', 'Self-Help', 95, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111247, 'Jane Eyre', 'Business', 'J.K. Rowling', 'Poetry', 69, 28);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111251, 'The Book Thief', 'Thriller', 'William Blake', 'Young Adult', 163, 504);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111255, 'In Cold Blood', 'Business', 'F. Scott Fitzge', 'Historical Fiction', 414, 313);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111259, 'The Alchemist', 'Business', 'J.K. Rowling', 'Biography', 69, 401);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111263, 'The Road', 'Romance', 'Mark Twain', 'Travel', 691, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111267, 'Moby-Dick', 'Romance', 'Jane Austen', 'Memoir', 45, 70);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111271, 'Dune', 'Cookbook', 'William Blake', 'Mystery', 49, 69);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111275, 'Gone with the Wind', 'Fantasy', 'Harper Lee', 'Fantasy', 525, 304);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111279, 'To Kill a Mockingbird', 'Business', 'Margaret Atwood', 'Business', 66, 512);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111283, 'The Alchemist', 'Self-Help', 'William Blake', 'Poetry', 656, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111287, 'The Road Less Traveled', 'Memoir', 'J.K. Rowling', 'Mystery', 658, 950);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111291, 'The Handmaid''s Tale', 'Cookbook', 'Stephen King', 'Historical Fiction', 75, 885);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111295, 'The Da Vinci Code', 'Science Fiction', 'Jane Austen', 'Historical Fiction', 55, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111751, 'The Help', 'Memoir', 'J.R.R. Tolkien', 'Young Adult', 154, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111755, 'The Book Thief', 'Children', 'Charles Dickens', 'Children', 808, 904);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111759, 'The Road', 'Science Fiction', 'J.K. Rowling', 'Children', 82, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111763, 'The Girl on the Train', 'Fantasy', 'Margaret Atwood', 'Fantasy', 485, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111767, 'The Book Thief', 'Thriller', 'Dan Brown', 'Travel', 864, 27);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111771, 'A Game of Thrones', 'Self-Help', 'William Blake', 'Thriller', 319, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111775, 'One Hundred Years of Solitude', 'Thriller', 'Margaret Atwood', 'Science Fiction', 956, 555);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111779, 'Dracula', 'Young Adult', 'Agatha Christie', 'Children', 47, 668);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111783, 'The Martian', 'Cookbook', 'Margaret Atwood', 'Mystery', 28, 102);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111787, 'Gone with the Wind', 'Romance', 'J.K. Rowling', 'Mystery', 647, 50);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111791, 'The Alchemist', 'Romance', 'Dan Brown', 'Children', 111, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111795, 'Sapiens', 'Science Fiction', 'Charles Dickens', 'Self-Help', 74, 337);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111799, 'The Hunger Games', 'Fantasy', 'Margaret Atwood', 'Memoir', 929, 388);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111803, 'A Game of Thrones', 'Biography', 'George Eliot', 'Fantasy', 58, 655);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111807, 'East of Eden', 'Young Adult', 'George Orwell', 'Historical Fiction', 168, 26);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111811, 'The Shining', 'Historical Fiction', 'J.R.R. Tolkien', 'Children', 748, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111815, 'Educated', 'Poetry', 'William Blake', 'Memoir', 431, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111819, 'Dune', 'Business', 'Charles Dickens', 'Young Adult', 586, 732);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111823, 'The Alchemist', 'Memoir', 'Charles Dickens', 'Cookbook', 98, 520);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111827, 'The Outsiders', 'Science Fiction', 'Dan Brown', 'Business', 76, 45);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111831, 'The Secret Garden', 'Business', 'George Orwell', 'Mystery', 49, 9);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111835, 'To Kill a Mockingbird', 'Mystery', 'Mark Twain', 'Business', 441, 77);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111839, 'Pride and Prejudice', 'Science Fiction', 'Stephen King', 'Travel', 15, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111843, 'The Secret History', 'Children', 'Agatha Christie', 'Biography', 96, 808);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111847, 'Little Women', 'Children', 'George Eliot', 'Young Adult', 26, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111851, 'Frankenstein', 'Young Adult', 'Harper Lee', 'Mystery', 86, 70);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111855, 'The Road', 'Travel', 'Jane Austen', 'Poetry', 78, 753);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111859, 'Anna Karenina', 'Mystery', 'Harper Lee', 'Self-Help', 18, 45);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111863, 'Dracula', 'Self-Help', 'J.K. Rowling', 'Thriller', 38, 652);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111867, 'In Cold Blood', 'Thriller', 'Margaret Atwood', 'Biography', 58, 80);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111871, 'Alice in Wonderland', 'Historical Fiction', 'George Orwell', 'Historical Fiction', 67, 42);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111875, 'The Book Thief', 'Historical Fiction', 'J.R.R. Tolkien', 'Thriller', 230, 931);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111879, 'Moby-Dick', 'Business', 'Stephen King', 'Fantasy', 773, 824);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111883, 'Dracula', 'Travel', 'Mark Twain', 'Memoir', 497, 422);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111887, 'Gone with the Wind', 'Young Adult', 'Mark Twain', 'Travel', 72, 9);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111891, 'Frankenstein', 'Young Adult', 'Jane Austen', 'Memoir', 64, 948);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111895, 'Brave New World', 'Poetry', 'George Orwell', 'Romance', 36, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111899, '1984', 'Young Adult', 'Margaret Atwood', 'Romance', 30, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111903, 'The Sun Also Rises', 'Science Fiction', 'J.R.R. Tolkien', 'Romance', 62, 706);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111907, 'In Cold Blood', 'Fantasy', 'George Orwell', 'Science Fiction', 482, 928);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111911, 'In Cold Blood', 'Poetry', 'Mark Twain', 'Travel', 523, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111915, 'The Martian', 'Travel', 'Jane Austen', 'Self-Help', 240, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111919, 'The Road', 'Romance', 'Stephen King', 'Children', 206, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111923, 'Wuthering Heights', 'Mystery', 'Dan Brown', 'Mystery', 88, 813);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111927, 'The Catcher in the Rye', 'Mystery', 'Mark Twain', 'Poetry', 35, 802);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111931, 'Educated', 'Fantasy', 'F. Scott Fitzge', 'Self-Help', 13, 739);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111935, 'Moby-Dick', 'Self-Help', 'Margaret Atwood', 'Fantasy', 20, 129);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111939, 'Sapiens', 'Cookbook', 'Charles Dickens', 'Memoir', 29, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111943, 'The Da Vinci Code', 'Thriller', 'F. Scott Fitzge', 'Poetry', 41, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111947, 'The Outsiders', 'Thriller', 'Stephen King', 'Historical Fiction', 823, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111951, 'The Shining', 'Business', 'Dan Brown', 'Romance', 38, 880);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111955, 'The Sun Also Rises', 'Memoir', 'Margaret Atwood', 'Poetry', 73, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111959, 'The Book Thief', 'Poetry', 'Agatha Christie', 'Biography', 118, 473);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111963, 'Catch-22', 'Historical Fiction', 'Emily Bronte', 'Biography', 97, 787);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111967, 'The Shining', 'Mystery', 'Harper Lee', 'Self-Help', 48, 10);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111971, 'Frankenstein', 'Young Adult', 'Harper Lee', 'Fantasy', 24, 14);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111975, 'Alice in Wonderland', 'Self-Help', 'Harper Lee', 'Children', 94, 93);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111979, 'Sapiens', 'Children', 'J.R.R. Tolkien', 'Memoir', 61, 56);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111983, 'The Road', 'Poetry', 'Jane Austen', 'Children', 67, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111987, 'Alice in Wonderland', 'Mystery', 'Stephen King', 'Cookbook', 51, 166);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111991, 'The Book Thief', 'Poetry', 'Harper Lee', 'Business', 95, 14);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111995, '1984', 'Romance', 'J.K. Rowling', 'Children', 70, 970);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111999, 'The Sun Also Rises', 'Biography', 'Emily Bronte', 'Romance', 306, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112003, 'Alice in Wonderland', 'Travel', 'Harper Lee', 'Travel', 894, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112007, 'The Road', 'Cookbook', 'Emily Bronte', 'Children', 87, 61);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112011, 'Brave New World', 'Thriller', 'George Orwell', 'Memoir', 48, 96);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112015, 'The Outsiders', 'Cookbook', 'Stephen King', 'Children', 646, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112019, 'The Da Vinci Code', 'Travel', 'Harper Lee', 'Memoir', 788, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112023, 'The Kite Runner', 'Thriller', 'Dan Brown', 'Travel', 978, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112027, 'To Kill a Mockingbird', 'Memoir', 'F. Scott Fitzge', 'Travel', 78, 566);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112031, 'The Catcher in the Rye', 'Cookbook', 'Mark Twain', 'Historical Fiction', 79, 775);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112035, 'The Road Less Traveled', 'Children', 'Mark Twain', 'Biography', 83, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112039, 'Brave New World', 'Children', 'Dan Brown', 'Self-Help', 45, 70);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112043, 'Dracula', 'Business', 'J.K. Rowling', 'Young Adult', 49, 29);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112047, 'The Help', 'Biography', 'William Blake', 'Self-Help', 463, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112051, 'The Martian', 'Children', 'J.R.R. Tolkien', 'Biography', 926, 296);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112055, 'Dracula', 'Historical Fiction', 'F. Scott Fitzge', 'Travel', 16, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112059, 'Charlotte''s Web', 'Poetry', 'Emily Bronte', 'Self-Help', 94, 71);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112063, 'Educated', 'Poetry', 'George Orwell', 'Biography', 360, 992);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112067, 'The Handmaid''s Tale', 'Romance', 'Mark Twain', 'Memoir', 29, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112071, 'The Secret Garden', 'Historical Fiction', 'William Blake', 'Self-Help', 47, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112075, 'The Alchemist', 'Cookbook', 'George Orwell', 'Travel', 902, 67);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112079, 'The Alchemist', 'Historical Fiction', 'Jane Austen', 'Science Fiction', 478, 352);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112083, 'Gone with the Wind', 'Poetry', 'Mark Twain', 'Science Fiction', 24, 57);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112087, 'The Girl on the Train', 'Biography', 'Jane Austen', 'Biography', 48, 943);
commit;
prompt 200 records committed...
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112091, 'The Help', 'Poetry', 'George Orwell', 'Thriller', 58, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112095, 'The Road Less Traveled', 'Travel', 'Charles Dickens', 'Business', 47, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112099, 'The Martian', 'Mystery', 'George Eliot', 'Travel', 340, 845);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112103, 'The Sun Also Rises', 'Romance', 'Mark Twain', 'Cookbook', 228, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112107, 'One Hundred Years of Solitude', 'Historical Fiction', 'J.K. Rowling', 'Biography', 26, 107);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112111, 'Sapiens', 'Memoir', 'F. Scott Fitzge', 'Business', 10, 176);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112115, 'The Hunger Games', 'Biography', 'Harper Lee', 'Cookbook', 855, 26);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112119, 'To Kill a Mockingbird', 'Historical Fiction', 'Harper Lee', 'Romance', 139, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112123, 'Alice in Wonderland', 'Science Fiction', 'George Orwell', 'Travel', 952, 425);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112127, 'Moby-Dick', 'Romance', 'Charles Dickens', 'Thriller', 788, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112131, 'Anna Karenina', 'Fantasy', 'Charles Dickens', 'Young Adult', 740, 90);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112135, 'The Girl on the Train', 'Self-Help', 'Emily Bronte', 'Memoir', 211, 52);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112139, 'A Game of Thrones', 'Children', 'Harper Lee', 'Business', 465, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112143, 'Sapiens', 'Romance', 'F. Scott Fitzge', 'Biography', 37, 55);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112147, 'Dracula', 'Cookbook', 'Agatha Christie', 'Self-Help', 387, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112151, 'In Cold Blood', 'Mystery', 'Dan Brown', 'Cookbook', 38, 290);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112155, 'The Great Gatsby', 'Self-Help', 'Charles Dickens', 'Travel', 54, 34);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112159, 'A Game of Thrones', 'Business', 'Mark Twain', 'Thriller', 13, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112163, 'The Sun Also Rises', 'Travel', 'Stephen King', 'Children', 687, 20);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112167, 'In Cold Blood', 'Science Fiction', 'J.K. Rowling', 'Romance', 197, 103);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112171, 'Pride and Prejudice', 'Children', 'Dan Brown', 'Business', 16, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112175, 'In Cold Blood', 'Historical Fiction', 'Stephen King', 'Historical Fiction', 791, 94);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112179, 'The Hobbit', 'Cookbook', 'Emily Bronte', 'Biography', 70, 42);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112183, 'The Secret History', 'Memoir', 'Harper Lee', 'Biography', 36, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112187, 'Little Women', 'Romance', 'Mark Twain', 'Fantasy', 599, 69);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112191, 'Sapiens', 'Business', 'Dan Brown', 'Fantasy', 48, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112195, 'The Help', 'Biography', 'Charles Dickens', 'Self-Help', 199, 710);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112199, 'The Hobbit', 'Self-Help', 'Harper Lee', 'Memoir', 311, 544);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112203, 'The Great Gatsby', 'Biography', 'J.R.R. Tolkien', 'Poetry', 79, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112207, 'Educated', 'Science Fiction', 'Jane Austen', 'Self-Help', 443, 616);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112211, 'Gone with the Wind', 'Memoir', 'Harper Lee', 'Thriller', 938, 542);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112215, 'The Girl on the Train', 'Business', 'F. Scott Fitzge', 'Mystery', 93, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112219, 'War and Peace', 'Cookbook', 'Jane Austen', 'Young Adult', 830, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112223, 'The Catcher in the Rye', 'Science Fiction', 'Jane Austen', 'Young Adult', 627, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112227, 'The Goldfinch', 'Thriller', 'Jane Austen', 'Self-Help', 200, 173);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112231, 'The Kite Runner', 'Business', 'Charles Dickens', 'Fantasy', 473, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112235, 'A Game of Thrones', 'Memoir', 'Stephen King', 'Children', 87, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112239, 'Pride and Prejudice', 'Fantasy', 'Stephen King', 'Travel', 198, 82);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112243, 'The Catcher in the Rye', 'Mystery', 'J.R.R. Tolkien', 'Thriller', 82, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112247, 'Dracula', 'Cookbook', 'Dan Brown', 'Science Fiction', 46, 40);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112251, 'The Da Vinci Code', 'Travel', 'George Eliot', 'Biography', 58, 39);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112255, 'The Handmaid''s Tale', 'Children', 'George Eliot', 'Travel', 56, 389);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112259, 'Little Women', 'Memoir', 'Jane Austen', 'Young Adult', 36, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112263, 'War and Peace', 'Travel', 'William Blake', 'Travel', 80, 441);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112267, 'Pride and Prejudice', 'Romance', 'J.R.R. Tolkien', 'Romance', 39, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112271, 'One Hundred Years of Solitude', 'Travel', 'Margaret Atwood', 'Historical Fiction', 123, 46);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112275, 'The Great Gatsby', 'Memoir', 'Charles Dickens', 'Mystery', 69, 764);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112279, 'To Kill a Mockingbird', 'Self-Help', 'George Eliot', 'Business', 37, 78);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112283, 'East of Eden', 'Biography', 'J.R.R. Tolkien', 'Science Fiction', 75, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112287, 'The Lord of the Rings', 'Historical Fiction', 'Dan Brown', 'Romance', 989, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112291, 'The Road Less Traveled', 'Biography', 'Margaret Atwood', 'Young Adult', 707, 92);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112295, 'The Kite Runner', 'Science Fiction', 'Margaret Atwood', 'Travel', 28, 71);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112299, 'The Bell Jar', 'Mystery', 'George Eliot', 'Thriller', 30, 99);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112303, 'Anna Karenina', 'Thriller', 'Stephen King', 'Children', 822, 473);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112307, 'The Lord of the Rings', 'Business', 'George Eliot', 'Travel', 862, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112311, 'The Goldfinch', 'Self-Help', 'Dan Brown', 'Memoir', 54, 68);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112315, 'Frankenstein', 'Young Adult', 'Dan Brown', 'Cookbook', 94, 309);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112319, 'War and Peace', 'Business', 'Dan Brown', 'Poetry', 543, 623);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112323, 'Charlotte''s Web', 'Poetry', 'George Orwell', 'Fantasy', 39, 408);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112327, 'Wuthering Heights', 'Science Fiction', 'Agatha Christie', 'Cookbook', 439, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112331, 'Educated', 'Mystery', 'F. Scott Fitzge', 'Romance', 60, 72);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112335, 'Jane Eyre', 'Young Adult', 'J.R.R. Tolkien', 'Travel', 64, 895);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112339, 'Pride and Prejudice', 'Romance', 'J.R.R. Tolkien', 'Business', 58, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112343, 'The Martian', 'Business', 'Agatha Christie', 'Young Adult', 18, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112347, 'Sapiens', 'Children', 'J.R.R. Tolkien', 'Mystery', 283, 9);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112351, 'The Catcher in the Rye', 'Cookbook', 'George Eliot', 'Travel', 642, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112355, 'The Hobbit', 'Thriller', 'J.R.R. Tolkien', 'Cookbook', 71, 89);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112359, 'The Girl on the Train', 'Memoir', 'Agatha Christie', 'Young Adult', 394, 744);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112363, 'Wuthering Heights', 'Poetry', 'Emily Bronte', 'Cookbook', 195, 214);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112367, 'Anna Karenina', 'Memoir', 'Jane Austen', 'Thriller', 740, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112371, 'The Book Thief', 'Children', 'Stephen King', 'Biography', 18, 69);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112375, 'Anna Karenina', 'Poetry', 'J.K. Rowling', 'Travel', 18, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112379, 'To Kill a Mockingbird', 'Children', 'Jane Austen', 'Memoir', 12, 9);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112383, 'Gone with the Wind', 'Children', 'Dan Brown', 'Cookbook', 897, 23);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112387, 'The Goldfinch', 'Science Fiction', 'J.R.R. Tolkien', 'Memoir', 35, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112391, 'The Alchemist', 'Mystery', 'George Eliot', 'Mystery', 318, 36);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112395, 'The Handmaid''s Tale', 'Young Adult', 'Stephen King', 'Mystery', 543, 959);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112399, 'The Road', 'Business', 'Jane Austen', 'Children', 106, 43);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112403, 'The Secret History', 'Self-Help', 'George Eliot', 'Mystery', 255, 21);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112407, 'Brave New World', 'Travel', 'Stephen King', 'Travel', 33, 10);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112411, 'Alice in Wonderland', 'Self-Help', 'Stephen King', 'Fantasy', 548, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112415, 'Frankenstein', 'Travel', 'Margaret Atwood', 'Biography', 32, 15);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112419, 'The Book Thief', 'Mystery', 'Mark Twain', 'Cookbook', 670, 97);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112423, 'To Kill a Mockingbird', 'Poetry', 'Harper Lee', 'Business', 644, 53);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112427, 'The Road Less Traveled', 'Cookbook', 'William Blake', 'Fantasy', 996, 180);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112431, 'The Book Thief', 'Cookbook', 'J.R.R. Tolkien', 'Self-Help', 276, 47);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112435, 'Catch-22', 'Biography', 'Stephen King', 'Travel', 947, 89);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112439, 'The Great Gatsby', 'Travel', 'Dan Brown', 'Biography', 160, 675);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112443, 'The Hunger Games', 'Mystery', 'George Orwell', 'Science Fiction', 224, 800);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112447, 'Frankenstein', 'Science Fiction', 'Jane Austen', 'Cookbook', 16, 61);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112451, 'The Goldfinch', 'Mystery', 'Agatha Christie', 'Memoir', 93, 438);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (112455, 'Dracula', 'Poetry', 'Emily Bronte', 'Memoir', 478, 77);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (400001, 'looly', 'Mstery', 'chaim nachmani', 'baby', 65, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (440000, 'the brain ', 'Romance', 'chaim nachmani', 'brain', 179, 312);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (440001, 'the brain ', 'Childrens', 'chana fine', 'baking', 89, 249);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111299, 'The Bell Jar', 'Children', 'Dan Brown', 'Business', 63, 9);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111303, 'The Hunger Games', 'Science Fiction', 'Margaret Atwood', 'Thriller', 773, 92);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111307, 'Charlotte''s Web', 'Memoir', 'William Blake', 'Romance', 58, 50);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111311, 'The Girl on the Train', 'Fantasy', 'J.K. Rowling', 'Science Fiction', 97, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111315, 'The Outsiders', 'Poetry', 'William Blake', 'Biography', 631, 67);
commit;
prompt 300 records committed...
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111319, 'Brave New World', 'Self-Help', 'Margaret Atwood', 'Business', 591, 566);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111323, 'Catch-22', 'Young Adult', 'Jane Austen', 'Business', 609, 70);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111327, 'The Bell Jar', 'Poetry', 'F. Scott Fitzge', 'Young Adult', 49, 914);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111331, 'Dracula', 'Self-Help', 'J.K. Rowling', 'Children', 21, 402);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111335, 'The Bell Jar', 'Young Adult', 'Margaret Atwood', 'Travel', 88, 20);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111339, 'A Game of Thrones', 'Fantasy', 'Margaret Atwood', 'Biography', 72, 44);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111343, 'The Bell Jar', 'Travel', 'Charles Dickens', 'Fantasy', 921, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111347, '1984', 'Memoir', 'Mark Twain', 'Children', 47, 946);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111351, 'The Hunger Games', 'Memoir', 'Mark Twain', 'Cookbook', 58, 42);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111355, 'The Road', 'Travel', 'William Blake', 'Memoir', 377, 90);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111359, 'The Girl on the Train', 'Travel', 'Agatha Christie', 'Cookbook', 53, 90);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111363, 'The Girl on the Train', 'Mystery', 'Charles Dickens', 'Fantasy', 611, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111367, 'Moby-Dick', 'Travel', 'Agatha Christie', 'Thriller', 55, 44);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111371, 'In Cold Blood', 'Thriller', 'Emily Bronte', 'Mystery', 10, 12);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111375, 'Wuthering Heights', 'Fantasy', 'Margaret Atwood', 'Young Adult', 229, 274);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111379, 'The Alchemist', 'Memoir', 'Mark Twain', 'Biography', 571, 961);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111383, 'The Secret Garden', 'Biography', 'Harper Lee', 'Mystery', 64, 388);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111387, 'The Catcher in the Rye', 'Self-Help', 'J.K. Rowling', 'Romance', 396, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111391, 'The Outsiders', 'Self-Help', 'J.R.R. Tolkien', 'Poetry', 17, 57);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111395, 'Gone with the Wind', 'Travel', 'Harper Lee', 'Romance', 953, 285);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111399, 'The Bell Jar', 'Romance', 'Stephen King', 'Children', 13, 77);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111403, 'Little Women', 'Poetry', 'Mark Twain', 'Young Adult', 95, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111407, 'Jane Eyre', 'Science Fiction', 'Jane Austen', 'Historical Fiction', 23, 905);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111411, 'Little Women', 'Science Fiction', 'Charles Dickens', 'Children', 580, 252);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111415, 'The Outsiders', 'Business', 'Mark Twain', 'Romance', 206, 36);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111419, 'Frankenstein', 'Business', 'J.K. Rowling', 'Travel', 694, 55);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111423, 'Dracula', 'Travel', 'Emily Bronte', 'Thriller', 45, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111427, 'East of Eden', 'Fantasy', 'Agatha Christie', 'Poetry', 80, 432);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111431, '1984', 'Biography', 'Emily Bronte', 'Children', 509, 777);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111435, 'The Catcher in the Rye', 'Thriller', 'Mark Twain', 'Children', 68, 61);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111439, 'The Help', 'Travel', 'Charles Dickens', 'Memoir', 20, 144);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111443, '1984', 'Thriller', 'Emily Bronte', 'Young Adult', 93, 73);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111447, 'Little Women', 'Biography', 'F. Scott Fitzge', 'Children', 952, 78);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111451, 'The Catcher in the Rye', 'Science Fiction', 'Agatha Christie', 'Romance', 321, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111455, 'Dracula', 'Romance', 'Agatha Christie', 'Biography', 971, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111459, 'Dune', 'Travel', 'George Eliot', 'Fantasy', 375, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111463, 'Wuthering Heights', 'Thriller', 'Margaret Atwood', 'Biography', 89, 75);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111467, 'Brave New World', 'Children', 'Margaret Atwood', 'Business', 39, 451);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111471, 'The Girl on the Train', 'Historical Fiction', 'George Orwell', 'Poetry', 386, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111475, 'Frankenstein', 'Cookbook', 'Agatha Christie', 'Science Fiction', 39, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111479, 'The Alchemist', 'Thriller', 'J.K. Rowling', 'Cookbook', 485, 19);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111483, 'Anna Karenina', 'Science Fiction', 'Charles Dickens', 'Cookbook', 99, 3);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111487, 'The Goldfinch', 'Fantasy', 'William Blake', 'Mystery', 592, 369);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111491, 'The Road', 'Memoir', 'Harper Lee', 'Business', 26, 673);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111495, 'Brave New World', 'Children', 'George Eliot', 'Science Fiction', 655, 487);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111499, 'Alice in Wonderland', 'Memoir', 'William Blake', 'Young Adult', 178, 62);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111503, '1984', 'Self-Help', 'Agatha Christie', 'Biography', 933, 44);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111507, 'Wuthering Heights', 'Historical Fiction', 'Emily Bronte', 'Historical Fiction', 96, 166);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111511, 'The Secret History', 'Fantasy', 'William Blake', 'Young Adult', 676, 92);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111515, 'The Bell Jar', 'Science Fiction', 'William Blake', 'Biography', 12, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111519, 'The Kite Runner', 'Cookbook', 'Mark Twain', 'Cookbook', 48, 82);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111523, 'Gone with the Wind', 'Memoir', 'F. Scott Fitzge', 'Fantasy', 633, 34);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111527, 'The Catcher in the Rye', 'Romance', 'George Eliot', 'Biography', 467, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111531, 'The Bell Jar', 'Business', 'Agatha Christie', 'Biography', 24, 512);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111535, 'The Secret Garden', 'Self-Help', 'Charles Dickens', 'Travel', 218, 12);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111539, 'East of Eden', 'Science Fiction', 'Mark Twain', 'Self-Help', 820, 393);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111543, '1984', 'Travel', 'Harper Lee', 'Science Fiction', 621, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111547, 'The Da Vinci Code', 'Fantasy', 'Mark Twain', 'Fantasy', 88, 28);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111551, 'The Secret Garden', 'Business', 'Harper Lee', 'Biography', 29, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111555, 'The Martian', 'Mystery', 'Agatha Christie', 'Science Fiction', 56, 82);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111559, 'The Outsiders', 'Science Fiction', 'J.R.R. Tolkien', 'Mystery', 444, 83);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111563, 'Anna Karenina', 'Biography', 'Jane Austen', 'Self-Help', 648, 223);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111567, 'To Kill a Mockingbird', 'Young Adult', 'Agatha Christie', 'Thriller', 65, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111571, 'The Hunger Games', 'Thriller', 'Agatha Christie', 'Cookbook', 13, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111575, 'Dracula', 'Travel', 'Mark Twain', 'Self-Help', 883, 7);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111579, 'The Sun Also Rises', 'Biography', 'Dan Brown', 'Mystery', 74, 30);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111583, '1984', 'Cookbook', 'Emily Bronte', 'Young Adult', 244, 461);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111587, 'The Catcher in the Rye', 'Business', 'Margaret Atwood', 'Science Fiction', 235, 993);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111591, 'The Hobbit', 'Biography', 'William Blake', 'Science Fiction', 632, 24);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111595, 'The Book Thief', 'Poetry', 'Charles Dickens', 'Young Adult', 61, 69);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111599, 'The Outsiders', 'Fantasy', 'Jane Austen', 'Thriller', 111, 76);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111603, 'The Martian', 'Travel', 'J.K. Rowling', 'Science Fiction', 37, 126);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111607, 'Dracula', 'Cookbook', 'George Orwell', 'Romance', 122, 1);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111611, 'The Martian', 'Cookbook', 'J.K. Rowling', 'Mystery', 12, 40);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111615, 'The Hobbit', 'Fantasy', 'Dan Brown', 'Mystery', 33, 156);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111619, 'The Great Gatsby', 'Memoir', 'Margaret Atwood', 'Young Adult', 423, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111623, 'The Secret History', 'Business', 'George Eliot', 'Business', 17, 213);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111627, 'One Hundred Years of Solitude', 'Mystery', 'Harper Lee', 'Romance', 10, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111631, 'Educated', 'Science Fiction', 'Dan Brown', 'Romance', 82, 95);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111635, 'In Cold Blood', 'Biography', 'J.K. Rowling', 'Biography', 531, 33);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111639, 'The Help', 'Romance', 'J.R.R. Tolkien', 'Thriller', 989, 831);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111643, 'Educated', 'Travel', 'Emily Bronte', 'Children', 37, 652);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111647, 'Jane Eyre', 'Historical Fiction', 'Agatha Christie', 'Young Adult', 639, 26);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111651, 'The Goldfinch', 'Young Adult', 'Agatha Christie', 'Travel', 592, 5);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111655, 'Sapiens', 'Young Adult', 'George Eliot', 'Cookbook', 71, 8);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111659, 'The Da Vinci Code', 'Biography', 'Charles Dickens', 'Science Fiction', 399, 13);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111663, 'Frankenstein', 'Thriller', 'George Orwell', 'Cookbook', 28, 37);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111667, 'The Book Thief', 'Young Adult', 'Jane Austen', 'Fantasy', 65, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111671, 'Catch-22', 'Thriller', 'Mark Twain', 'Mystery', 269, 501);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111675, 'The Hunger Games', 'Cookbook', 'J.K. Rowling', 'Young Adult', 972, 381);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111679, 'Little Women', 'Poetry', 'Emily Bronte', 'Biography', 796, 69);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111683, 'Frankenstein', 'Historical Fiction', 'Mark Twain', 'Memoir', 146, 58);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111687, 'Moby-Dick', 'Science Fiction', 'Charles Dickens', 'Self-Help', 777, 48);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111691, 'The Catcher in the Rye', 'Young Adult', 'Agatha Christie', 'Children', 56, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111695, 'Catch-22', 'Thriller', 'Harper Lee', 'Thriller', 38, 99);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111699, 'Catch-22', 'Mystery', 'Harper Lee', 'Mystery', 11, 2);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111703, 'A Game of Thrones', 'Memoir', 'George Eliot', 'Self-Help', 44, 39);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111707, 'The Goldfinch', 'Children', 'Harper Lee', 'Thriller', 730, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111711, 'Brave New World', 'Poetry', 'Harper Lee', 'Romance', 35, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111715, 'The Secret History', 'Fantasy', 'Stephen King', 'Cookbook', 496, 21);
commit;
prompt 400 records committed...
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111719, 'Jane Eyre', 'Children', 'Emily Bronte', 'Cookbook', 19, 67);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111723, 'The Book Thief', 'Memoir', 'Charles Dickens', 'Romance', 505, 77);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111727, 'The Hunger Games', 'Biography', 'George Orwell', 'Mystery', 79, 19);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111731, 'Catch-22', 'Business', 'J.R.R. Tolkien', 'Memoir', 17, 79);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111735, 'The Sun Also Rises', 'Mystery', 'J.R.R. Tolkien', 'Business', 752, 6);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111739, 'The Goldfinch', 'Self-Help', 'William Blake', 'Biography', 284, 4);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111743, 'Dracula', 'Cookbook', 'George Eliot', 'Biography', 853, 63);
insert into BOOK (bookid, bookname, categorys, author, title, price, pagenumbers)
values (111747, 'The Kite Runner', 'Cookbook', 'F. Scott Fitzge', 'Young Adult', 820, 911);
commit;
prompt 408 records loaded
prompt Loading BOOKCOPPY...
insert into BOOKCOPPY (serialnumber, status, bookid)
values (12502, ' new', 112459);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (1, 'new', 440001);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (96504, ' new', 112463);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211111, 'used', 112287);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (2, 'used', 440000);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211131, 'new', 112067);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211135, 'new', 112231);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211167, 'new-used', 111131);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211183, 'used', 111279);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211187, 'new', 112167);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211191, 'new-used', 112519);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211211, 'used', 111659);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211219, 'used', 111155);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211223, 'new-used', 111659);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211235, 'used', 112599);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211247, 'used', 111407);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211259, 'new-used', 111447);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211275, 'used', 111651);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211279, 'used', 111303);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211295, 'used', 111219);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211303, 'new', 112111);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211319, 'used', 112107);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211323, 'used', 111475);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211327, 'new-used', 111139);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211335, 'new-used', 111515);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211339, 'new', 111395);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211343, 'new', 112595);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211347, 'used', 111319);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211359, 'new', 111415);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211371, 'new-used', 111299);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211379, 'used', 112395);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211387, 'new', 111559);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211403, 'new-used', 111279);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211415, 'used', 111607);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211423, 'new-used', 112387);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211427, 'used', 112179);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211463, 'new-used', 112223);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211471, 'new-used', 27);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211483, 'used', 112067);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211491, 'used', 112519);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211511, 'new-used', 111475);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211519, 'new-used', 112187);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211527, 'new-used', 111219);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211535, 'new-used', 111419);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211547, 'new', 111591);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211559, 'new-used', 112363);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211563, 'new', 112511);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211595, 'new-used', 111583);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211599, 'new', 112223);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211603, 'used', 111163);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211607, 'new', 111939);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211619, 'used', 112279);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211631, 'new-used', 111603);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211639, 'new-used', 111671);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211643, 'new-used', 112443);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211651, 'new-used', 111603);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211655, 'new-used', 111283);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211667, 'new-used', 112051);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211671, 'used', 112083);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211687, 'new', 112187);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211695, 'new-used', 112051);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211723, 'used', 111171);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211743, 'new', 111939);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211767, 'new', 112391);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211771, 'used', 112659);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211779, 'used', 112203);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211783, 'new-used', 111675);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211787, 'new-used', 111755);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211799, 'used', 111475);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211807, 'used', 112511);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211823, 'used', 111475);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211851, 'new-used', 131313);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211863, 'used', 111671);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211871, 'used', 131313);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211891, 'used', 111803);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211895, 'used', 111675);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211903, 'new', 112639);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211907, 'used', 111407);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211911, 'used', 112515);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211939, 'new-used', 111139);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211947, 'new', 112131);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211959, 'new', 112423);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211963, 'used', 112567);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211975, 'new-used', 112459);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211991, 'new', 112499);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (211995, 'used', 112111);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212003, 'new-used', 112567);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212031, 'used', 112363);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212035, 'new', 112611);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212043, 'new', 111711);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212047, 'new', 112163);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212055, 'new', 111399);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212063, 'new', 121212);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212079, 'new', 111831);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212083, 'new', 111803);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212087, 'new', 111407);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212091, 'used', 112599);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212095, 'new-used', 111619);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212099, 'new-used', 112295);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212103, 'new-used', 112431);
commit;
prompt 100 records committed...
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212107, 'new-used', 111215);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212115, 'new-used', 111711);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212147, 'new', 111495);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212195, 'new-used', 112271);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212203, 'used', 111155);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212219, 'used', 111995);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212223, 'new', 112107);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212259, 'used', 111859);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212291, 'new', 112287);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212295, 'new-used', 111931);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212319, 'used', 112355);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212327, 'new-used', 111215);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212335, 'new-used', 112423);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212343, 'used', 112519);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212351, 'used', 121212);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212371, 'new-used', 112391);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212375, 'new', 111467);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212391, 'new-used', 111659);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212395, 'used', 112363);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212419, 'used', 111471);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212423, 'new-used', 112431);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212427, 'new', 111375);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212435, 'new', 111155);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212439, 'new-used', 112131);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212467, 'used', 112567);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212471, 'new-used', 112339);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212475, 'used', 111407);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (350163, 'new', 111803);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (366688, 'new-used', 111967);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (391141, 'new', 111131);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (346094, 'new', 112135);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (314664, 'new', 112423);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (327786, 'used', 112107);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (384469, 'used', 112219);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (364189, 'new-used', 112295);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (301685, 'used', 111239);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (366679, 'used', 112195);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (345173, 'used', 112463);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (336332, 'used', 111583);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (337842, 'new', 111603);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (373068, 'new', 111931);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (309870, 'new-used', 111967);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (322367, 'new-used', 112179);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212483, 'new', 111603);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212499, 'new', 112271);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212503, 'new', 112247);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212507, 'new-used', 111227);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212511, 'new-used', 111619);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212523, 'used', 112083);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212543, 'new', 112511);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212547, 'used', 112439);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212563, 'new-used', 112255);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212567, 'used', 111875);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212575, 'new-used', 111447);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212579, 'used', 111219);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212599, 'used', 112423);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212603, 'used', 111271);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212619, 'new-used', 111115);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212631, 'new', 112515);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212635, 'used', 112259);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212651, 'used', 112251);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212659, 'new-used', 111619);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212663, 'new-used', 112175);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (212667, 'new-used', 121212);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (567890, 'used', 25);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (789012, 'new', 27);
insert into BOOKCOPPY (serialnumber, status, bookid)
values (901234, 'used-new', 29);
commit;
prompt 167 records loaded
prompt Loading WORKER...
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (123456789, ' noam', ' levi', 504865985, 'Manager', to_date('01-01-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (123568974, ' chen', ' naki', 526486564, ' Employee', to_date('04-07-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (323564871, ' shai', ' gamliel', 584571323, 'Manager', to_date('04-05-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (323135648, ' noga', ' okashi', 544696812, ' Employee', to_date('06-02-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (315556965, ' avi', ' shlomi', 524493683, ' Manager', to_date('01-01-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (226755554, 'Cesar', 'Wincott', 515565640, 'Employee', to_date('12-06-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (743502274, 'Hikaru', 'Stevenson', 511360250, 'Manager', to_date('17-09-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (718109763, 'Emilio', 'Pollak', 500886993, 'Manager', to_date('19-04-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (335673276, 'Marlon', 'Moraz', 513212401, 'Employee', to_date('11-11-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (901683660, 'Marianne', 'Shatner', 517220436, 'Manager', to_date('29-01-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (137920011, 'Andy', 'Fender', 500238138, 'Employee', to_date('02-02-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (397989285, 'Harold', 'Caine', 524902515, 'Manager', to_date('01-03-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (294357585, 'Leo', 'Short', 511008908, 'Employee', to_date('04-01-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (822958626, 'Cesar', 'Barry', 529528556, 'Employee', to_date('20-12-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (742845569, 'Mira', 'DeVito', 502201028, 'Employee', to_date('30-03-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (869170359, 'Avenged', 'Rio', 513089126, 'Employee', to_date('15-02-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (467290523, 'Earl', 'Posener', 513449316, 'Employee', to_date('30-07-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (340224289, 'Merle', 'Aykroyd', 510102395, 'Manager', to_date('13-04-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (678043802, 'Jean-Luc', 'Colman', 519048307, 'Employee', to_date('01-03-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (257664812, 'Horace', 'Caviezel', 515036445, 'Manager', to_date('09-11-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (472750278, 'Nicole', 'Judd', 509116458, 'Manager', to_date('15-01-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (537175010, 'Shelby', 'Plowright', 527196093, 'Manager', to_date('16-11-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (869630705, 'Darius', 'Schwarzenegger', 503923739, 'Manager', to_date('09-11-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (858430175, 'Rolando', 'O''Neill', 517763444, 'Manager', to_date('16-12-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (201724578, 'Nick', 'Carmen', 528504726, 'Employee', to_date('21-01-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (279898030, 'Gil', 'Heche', 512937288, 'Manager', to_date('05-05-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (247415819, 'Leon', 'Benoit', 510652888, 'Manager', to_date('15-01-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (884761221, 'Olympia', 'Cromwell', 508174440, 'Employee', to_date('06-07-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (790099134, 'Elvis', 'Quatro', 515424139, 'Manager', to_date('18-05-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (312667361, 'Dom', 'Kleinenberg', 529657011, 'Employee', to_date('13-08-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (853460347, 'Nancy', 'Neill', 529471814, 'Employee', to_date('01-06-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (787782944, 'Buffy', 'Niven', 524464496, 'Manager', to_date('22-03-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (359530012, 'Ed', 'Carnes', 528806003, 'Manager', to_date('23-03-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (685959705, 'Wang', 'Pacino', 502367565, 'Employee', to_date('09-11-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (692167351, 'Darius', 'Barnett', 528322000, 'Manager', to_date('31-01-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (467953577, 'Liam', 'D''Onofrio', 521268523, 'Manager', to_date('20-05-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (693305212, 'Carole', 'Myers', 516621973, 'Employee', to_date('27-06-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (275220702, 'Rickie', 'Zellweger', 520362708, 'Employee', to_date('08-10-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (994126989, 'Ralph', 'Conners', 515086206, 'Manager', to_date('10-05-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (837631502, 'Marianne', 'Garcia', 512980623, 'Manager', to_date('28-08-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (125388019, 'Phoebe', 'McCabe', 514204716, 'Manager', to_date('17-12-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (573605423, 'Lila', 'McIntyre', 511307222, 'Employee', to_date('17-06-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (817519630, 'Kelly', 'Folds', 514008077, 'Manager', to_date('17-05-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (868010190, 'Jose', 'Stowe', 504274585, 'Employee', to_date('20-08-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (867861179, 'Viggo', 'Sample', 524286029, 'Employee', to_date('15-07-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (718269705, 'Brenda', 'Haynes', 528317294, 'Manager', to_date('08-03-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (297428959, 'Toni', 'Webb', 523884513, 'Manager', to_date('02-01-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (434604261, 'Malcolm', 'Jeter', 509763802, 'Manager', to_date('16-09-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (896388336, 'Armin', 'Irving', 512391083, 'Manager', to_date('29-09-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (580938331, 'Lucy', 'Laws', 521195466, 'Employee', to_date('15-03-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (675032366, 'Danni', 'Ingram', 503166473, 'Manager', to_date('12-04-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (529796133, 'Hector', 'Ammons', 524853601, 'Employee', to_date('07-02-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (149491501, 'Emma', 'Benet', 500382430, 'Manager', to_date('21-09-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (893305971, 'Edie', 'Durning', 528046662, 'Employee', to_date('11-01-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (505193395, 'Danni', 'Lillard', 524548877, 'Employee', to_date('12-02-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (113027456, 'Rowan', 'Davidson', 505373744, 'Manager', to_date('11-03-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (865122099, 'Joe', 'Gandolfini', 519773697, 'Manager', to_date('27-10-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (852132031, 'Raul', 'Shatner', 520348816, 'Manager', to_date('24-07-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (518512882, 'Xander', 'English', 526757056, 'Employee', to_date('24-01-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (691039126, 'Rolando', 'Gyllenhaal', 524124483, 'Employee', to_date('08-03-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (974407742, 'Lucy', 'Calle', 503367982, 'Employee', to_date('20-04-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (698726616, 'Simon', 'Marsden', 506275609, 'Manager', to_date('07-10-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (765071785, 'Geoffrey', 'Fehr', 523610971, 'Employee', to_date('20-08-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (917429476, 'Joaquim', 'Leigh', 509288621, 'Employee', to_date('13-06-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (361856328, 'Jodie', 'Fraser', 516088001, 'Manager', to_date('08-07-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (405518744, 'Jackson', 'Suvari', 529027746, 'Employee', to_date('13-11-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (474749393, 'Elizabeth', 'Dern', 523174342, 'Employee', to_date('01-06-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (701492410, 'Emm', 'Whitman', 515596575, 'Employee', to_date('05-01-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (951566280, 'Debi', 'Johansen', 505008025, 'Employee', to_date('17-06-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (237149146, 'Vin', 'Rooker', 519663886, 'Manager', to_date('14-10-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (464008405, 'Gran', 'McGinley', 512998346, 'Employee', to_date('09-08-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (554530420, 'Ice', 'Aykroyd', 511837306, 'Employee', to_date('27-09-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (903485761, 'Caroline', 'Lyonne', 524175762, 'Manager', to_date('06-03-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (281955267, 'Heather', 'Whitwam', 521889734, 'Employee', to_date('07-11-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (283118474, 'Alannah', 'Danger', 506750651, 'Manager', to_date('06-01-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (793125478, 'Mena', 'Almond', 514155037, 'Manager', to_date('23-08-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (793872119, 'Woody', 'Cross', 514949135, 'Manager', to_date('16-09-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (814410876, 'Graham', 'Ceasar', 513491791, 'Manager', to_date('17-12-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (931865584, 'Gilbert', 'Avital', 514479452, 'Employee', to_date('03-08-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (570809177, 'Gavin', 'Cook', 510982529, 'Manager', to_date('01-05-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (892790074, 'Kenneth', 'Lightfoot', 500565693, 'Employee', to_date('30-11-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (388100398, 'Celia', 'Hawthorne', 503780871, 'Manager', to_date('28-01-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (345128351, 'Jeff', 'Dempsey', 517383667, 'Employee', to_date('17-09-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (192622498, 'Javon', 'Santa Rosa', 529818879, 'Manager', to_date('25-11-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (396638853, 'Buffy', 'Mac', 526338991, 'Manager', to_date('26-01-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (734090667, 'Brooke', 'Koteas', 513417012, 'Manager', to_date('19-05-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (101601397, 'Davy', 'Houston', 527136958, 'Employee', to_date('07-01-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (307647370, 'Humberto', 'Kahn', 520917690, 'Manager', to_date('13-05-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (356792142, 'Ving', 'Day-Lewis', 510553994, 'Manager', to_date('10-11-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (136534555, 'Rachel', 'Noseworthy', 510939243, 'Employee', to_date('08-03-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (937724880, 'Lennie', 'Jonze', 516539673, 'Employee', to_date('07-05-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (146785613, 'Natascha', 'Stanley', 500688238, 'Manager', to_date('23-02-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (787852802, 'Elisabeth', 'Rucker', 501102471, 'Manager', to_date('21-01-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (557110167, 'Kazem', 'Parm', 525190411, 'Manager', to_date('29-12-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (185749732, 'Brittany', 'Broadbent', 512028115, 'Manager', to_date('30-01-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (911440098, 'Roberta', 'Cotton', 529562252, 'Employee', to_date('21-11-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (261877320, 'Gabriel', 'Redford', 522183014, 'Manager', to_date('11-05-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (857465480, 'Vanessa', 'Leary', 527201309, 'Employee', to_date('04-01-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (141627986, 'Desmond', 'Whitmore', 515824683, 'Employee', to_date('31-01-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (475128065, 'Andre', 'Mraz', 516833918, 'Manager', to_date('19-07-2018', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (569717639, 'Jean-Claude', 'Griffiths', 526191464, 'Manager', to_date('20-04-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (444849375, 'Paul', 'Viterelli', 515139108, 'Employee', to_date('05-03-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (373594668, 'Jesse', 'Coe', 519840293, 'Employee', to_date('30-10-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (524045728, 'Juliette', 'Detmer', 510701271, 'Employee', to_date('13-08-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (181754932, 'Ike', 'Eldard', 510273398, 'Manager', to_date('08-06-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (931841670, 'Paul', 'Addy', 514317769, 'Manager', to_date('06-09-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (273530645, 'Ani', 'Rockwell', 500240844, 'Employee', to_date('26-09-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (323271094, 'Chet', 'Ferry', 526097277, 'Manager', to_date('27-11-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (472629040, 'Frances', 'Chesnutt', 508046689, 'Employee', to_date('23-08-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (217681825, 'Belinda', 'Englund', 518503179, 'Employee', to_date('09-05-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (744634308, 'Taryn', 'Kurtz', 529945891, 'Employee', to_date('19-10-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (735201166, 'Rachel', 'McDormand', 524323449, 'Manager', to_date('30-06-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (294705447, 'Minnie', 'McGregor', 520453227, 'Employee', to_date('16-08-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (891525851, 'Gin', 'McGinley', 523711120, 'Manager', to_date('13-03-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (417955120, 'Johnnie', 'Capshaw', 511086763, 'Employee', to_date('09-03-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (240131835, 'Jimmie', 'Carrington', 507755316, 'Manager', to_date('16-01-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (536542194, 'Joaquim', 'Hawkins', 515564997, 'Employee', to_date('21-03-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (742083164, 'Collective', 'Dooley', 511134444, 'Employee', to_date('09-01-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (186815840, 'Ice', 'Loggins', 518470799, 'Manager', to_date('09-07-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (315600338, 'Temuera', 'Dupree', 510033072, 'Manager', to_date('24-12-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (206835352, 'Nile', 'Dean', 517850899, 'Manager', to_date('17-12-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (405564635, 'Courtney', 'Irons', 504541213, 'Manager', to_date('09-12-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (902342065, 'Giancarlo', 'Thurman', 512254797, 'Manager', to_date('12-06-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (979765409, 'Ray', 'Shandling', 519935958, 'Employee', to_date('01-02-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (573169589, 'Neneh', 'Flanery', 511768311, 'Employee', to_date('17-05-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (683493754, 'Sissy', 'Guinness', 523368579, 'Manager', to_date('15-08-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (824395243, 'Frederic', 'Fender', 511124856, 'Employee', to_date('05-11-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (758032935, 'Kathy', 'Morton', 518105598, 'Employee', to_date('31-05-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (805966662, 'Celia', 'Lipnicki', 518636669, 'Employee', to_date('01-12-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (867644454, 'Garland', 'Archer', 525979701, 'Employee', to_date('30-08-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (496511036, 'Michael', 'Studi', 528444385, 'Manager', to_date('16-08-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (576383177, 'Nicky', 'Playboys', 515497567, 'Employee', to_date('13-09-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (347492168, 'Elizabeth', 'Lawrence', 509233766, 'Manager', to_date('25-12-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (658378872, 'Larenz', 'MacIsaac', 517093518, 'Employee', to_date('02-05-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (285010258, 'Sophie', 'Brown', 521233481, 'Manager', to_date('04-11-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (926143716, 'Spencer', 'Dysart', 510699716, 'Manager', to_date('29-10-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (707348055, 'Claire', 'McGoohan', 529674441, 'Manager', to_date('01-04-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (860858559, 'Isabella', 'Withers', 503455164, 'Manager', to_date('20-08-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (450862672, 'Dick', 'Cube', 509565936, 'Employee', to_date('20-02-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (783322814, 'Davey', 'Gallagher', 500196648, 'Employee', to_date('07-09-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (622242527, 'Claire', 'Buscemi', 510741575, 'Manager', to_date('24-11-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (825535316, 'Gena', 'Hoffman', 516587334, 'Manager', to_date('02-01-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (430642901, 'Brooke', 'Tyler', 521426423, 'Employee', to_date('02-07-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (908768841, 'Rick', 'Idol', 500544606, 'Manager', to_date('23-03-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (186990480, 'Darren', 'Myers', 521169114, 'Employee', to_date('16-03-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (722387738, 'Alessandro', 'Burmester', 518977462, 'Employee', to_date('17-07-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (363074678, 'Robbie', 'Goodman', 523773483, 'Manager', to_date('09-04-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (226660644, 'Renee', 'Cobbs', 519492121, 'Employee', to_date('18-08-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (721012119, 'Richie', 'Johnson', 521321001, 'Manager', to_date('21-06-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (798856860, 'Grace', 'Numan', 513340022, 'Manager', to_date('21-01-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (950018081, 'Ian', 'Whitwam', 514793008, 'Manager', to_date('01-09-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (435549885, 'Claire', 'Navarro', 504682062, 'Manager', to_date('19-10-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (995446511, 'Wayman', 'Spiner', 525993347, 'Manager', to_date('23-11-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (216237124, 'Pablo', 'Frampton', 529363681, 'Manager', to_date('30-07-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (610922130, 'Carl', 'Aaron', 518805301, 'Employee', to_date('15-08-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (479653978, 'Taryn', 'von Sydow', 517583550, 'Employee', to_date('12-05-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (187629959, 'Hookah', 'Addy', 517063352, 'Employee', to_date('07-12-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (679680071, 'Patti', 'Camp', 511080410, 'Manager', to_date('03-11-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (633178649, 'Rawlins', 'Trejo', 506034100, 'Employee', to_date('04-09-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (874815954, 'Fairuza', 'Norton', 506969965, 'Manager', to_date('02-06-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (607253067, 'Frances', 'Nielsen', 504957532, 'Employee', to_date('20-01-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (344294455, 'Johnny', 'Danes', 518900797, 'Employee', to_date('08-04-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (130906949, 'Chi', 'Klugh', 515748966, 'Manager', to_date('12-10-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (481889344, 'Suzi', 'Lapointe', 527420100, 'Employee', to_date('08-05-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (828480722, 'Paul', 'Patrick', 528226945, 'Employee', to_date('05-06-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (179466821, 'Ceili', 'Carrere', 515674795, 'Manager', to_date('20-10-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (849786859, 'Tea', 'Keaton', 510499310, 'Employee', to_date('27-02-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (271195493, 'Teri', 'Thewlis', 517857147, 'Manager', to_date('13-11-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (949015324, 'Kazem', 'Donovan', 507549017, 'Manager', to_date('07-12-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (390394008, 'Donna', 'Patton', 512505497, 'Employee', to_date('07-05-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (999334789, 'Alex', 'Macht', 527515477, 'Employee', to_date('06-11-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (802206576, 'Ruth', 'Quinn', 508570318, 'Manager', to_date('13-02-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (353012298, 'Carlos', 'Coverdale', 518907257, 'Employee', to_date('15-03-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (279081753, 'Linda', 'Schiff', 502022896, 'Employee', to_date('22-06-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (799059898, 'Tori', 'Fiorentino', 502417229, 'Employee', to_date('23-05-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (201113379, 'Harriet', 'Thompson', 529646709, 'Manager', to_date('18-03-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (420797123, 'Roberta', 'Harrison', 510334232, 'Manager', to_date('04-02-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (763379076, 'Holland', 'Greenwood', 507016993, 'Employee', to_date('17-03-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (809275567, 'Mandy', 'Robards', 520596548, 'Employee', to_date('19-01-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (872249982, 'Al', 'Hynde', 514846851, 'Manager', to_date('15-02-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (547452879, 'Amanda', 'Hackman', 508539936, 'Employee', to_date('21-08-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (631808469, 'Bryan', 'Estevez', 517912635, 'Employee', to_date('21-09-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (795835397, 'Annette', 'Lithgow', 503711387, 'Manager', to_date('12-06-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (135935044, 'Alfie', 'Napolitano', 527237757, 'Employee', to_date('19-05-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (705935024, 'Scott', 'McGinley', 510549672, 'Employee', to_date('29-06-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (426628857, 'Karen', 'Forster', 524127730, 'Manager', to_date('05-09-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (391698835, 'Charlton', 'Lloyd', 512767052, 'Manager', to_date('06-06-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (417509944, 'Dermot', 'Davis', 514078242, 'Employee', to_date('10-10-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (331752778, 'Loretta', 'Diaz', 505650913, 'Manager', to_date('23-11-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (235148144, 'Daryl', 'Robinson', 523525038, 'Employee', to_date('26-09-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (616890176, 'James', 'Sample', 508004077, 'Employee', to_date('07-02-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (660898968, 'Lucy', 'Turturro', 509904344, 'Manager', to_date('13-12-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (597318657, 'Liam', 'Singletary', 512942530, 'Manager', to_date('31-10-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (477394794, 'Anne', 'Elizabeth', 522992586, 'Manager', to_date('20-09-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (992164595, 'Mary-Louise', 'Rock', 524269322, 'Employee', to_date('05-12-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (478812574, 'Madeline', 'Zane', 502994164, 'Employee', to_date('04-03-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (546242151, 'Merillee', 'Llewelyn', 502643393, 'Manager', to_date('01-06-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (817051842, 'Joan', 'Marsden', 513707717, 'Employee', to_date('30-07-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (269249560, 'Nile', 'Northam', 514275958, 'Manager', to_date('14-10-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (522749150, 'Ralph', 'Cronin', 506105916, 'Employee', to_date('16-03-2016', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (108686577, 'Ron', 'Dourif', 502655088, 'Manager', to_date('19-02-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (273751555, 'Machine', 'Quinones', 524701766, 'Manager', to_date('13-12-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (538765227, 'Dustin', 'Nielsen', 521724866, 'Manager', to_date('01-07-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (871427453, 'Lynette', 'Heatherly', 527150189, 'Employee', to_date('05-11-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (365075699, 'Miguel', 'Loveless', 502090786, 'Employee', to_date('07-08-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (823304673, 'William', 'Llewelyn', 503019673, 'Manager', to_date('27-12-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (613225413, 'Alfie', 'Eastwood', 525170532, 'Employee', to_date('29-05-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (203256363, 'Freddy', 'Meniketti', 502241371, 'Employee', to_date('19-03-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (266398616, 'Red', 'Parker', 514056240, 'Employee', to_date('23-01-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (11, 'Alice', 'Smith', 1234567890, 'Manager', to_date('15-01-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (12, 'Bob', 'Johnson', -1949288395, 'Engineer', to_date('22-03-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (13, 'Charlie', 'Williams', -838178284, 'Technician', to_date('30-07-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (14, 'David', 'Jones', 272922827, 'Clerk', to_date('12-11-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (15, 'Eva', 'Brown', 1383933938, 'Analyst', to_date('06-05-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (16, 'Frank', 'Davis', -1800922247, 'Supervisor', to_date('18-09-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (17, 'Grace', 'Miller', -699811136, 'Operator', to_date('25-02-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (18, 'Hannah', 'Wilson', 311299975, 'Coordinator', to_date('11-04-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (19, 'Ivy', 'Moore', 422411086, 'Administrator', to_date('19-08-2015', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (20, 'Jack', 'Taylor', 1234567809, 'Consultant', to_date('29-12-2014', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (427762437, 'Howie', 'MacDonald', 507296048, 'Manager', to_date('12-01-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (298792712, 'Gino', 'Vance', 526421717, 'Manager', to_date('29-04-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (132218533, 'Larenz', 'Bugnon', 526472549, 'Employee', to_date('11-12-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (323231267, 'Nile', 'Cage', 512191174, 'Manager', to_date('22-10-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (571324275, 'Charlton', 'Monk', 511793719, 'Manager', to_date('04-04-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (464679908, 'Darren', 'Theron', 507159306, 'Manager', to_date('02-06-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (641478703, 'Geena', 'Englund', 514198360, 'Employee', to_date('29-01-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (902025228, 'Bernard', 'Chilton', 525767744, 'Employee', to_date('28-10-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (195571448, 'Minnie', 'Burrows', 522411163, 'Manager', to_date('22-03-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (124911743, 'Nanci', 'Portman', 512975835, 'Manager', to_date('13-03-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (439584128, 'Orlando', 'Mac', 518089989, 'Manager', to_date('08-11-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (724025315, 'Isaac', 'Diffie', 501329718, 'Employee', to_date('27-04-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (686967036, 'Danni', 'Gore', 511850227, 'Employee', to_date('09-07-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (764601934, 'Jarvis', 'Shaw', 523764037, 'Employee', to_date('11-11-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (249732553, 'Julianne', 'McDowall', 515749209, 'Manager', to_date('25-12-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (533663538, 'Toni', 'Olyphant', 500393452, 'Employee', to_date('24-02-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (629885540, 'Fred', 'Freeman', 501015554, 'Manager', to_date('21-10-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (993308503, 'Bernie', 'Collie', 515973827, 'Manager', to_date('13-11-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (616481208, 'Blair', 'Astin', 516944751, 'Employee', to_date('21-10-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (454288381, 'Franco', 'Arjona', 523934241, 'Manager', to_date('29-06-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (812378169, 'Hope', 'Prinze', 508735041, 'Manager', to_date('20-09-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (720668684, 'Solomon', 'Malkovich', 526078004, 'Employee', to_date('05-08-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (215332630, 'Javon', 'Gandolfini', 528954719, 'Employee', to_date('03-03-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (105083788, 'Tramaine', 'Waits', 510801225, 'Manager', to_date('04-08-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (951142488, 'Richie', 'Tippe', 507330511, 'Employee', to_date('26-03-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (706525266, 'Christmas', 'Spacek', 512289573, 'Employee', to_date('06-03-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (664734015, 'Belinda', 'Gambon', 503567792, 'Manager', to_date('24-07-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (452498810, 'Lesley', 'McGinley', 500389761, 'Employee', to_date('21-05-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (932063112, 'Bruce', 'Zahn', 516112804, 'Manager', to_date('15-08-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (970648797, 'Sander', 'Goodall', 519705240, 'Employee', to_date('29-02-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (352592593, 'Ricky', 'Cruise', 526746005, 'Employee', to_date('22-01-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (768576074, 'Anita', 'Badalucco', 511405462, 'Employee', to_date('14-01-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (868430235, 'Miranda', 'Underwood', 510160843, 'Manager', to_date('30-01-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (878615316, 'Alan', 'Evanswood', 508369774, 'Manager', to_date('25-05-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (105989920, 'Guy', 'Cromwell', 512422810, 'Manager', to_date('15-12-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (877541391, 'Jack', 'Lonsdale', 500534648, 'Employee', to_date('24-10-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (421762580, 'Shannon', 'Tarantino', 527333515, 'Employee', to_date('26-10-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (544885594, 'Mika', 'Kimball', 521464118, 'Manager', to_date('10-09-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (632557658, 'Lindsey', 'Flack', 500450322, 'Employee', to_date('05-02-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (416244260, 'Ike', 'Warwick', 511352838, 'Manager', to_date('16-11-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (264866553, 'Geoffrey', 'Furtado', 504463554, 'Employee', to_date('18-07-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (158432589, 'Jena', 'Vanian', 503300234, 'Manager', to_date('18-03-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (661309884, 'Rebecca', 'Ali', 527844797, 'Manager', to_date('05-03-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (998226308, 'Kevn', 'Dafoe', 504258214, 'Manager', to_date('07-03-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (203177232, 'Geoff', 'Paymer', 510035617, 'Employee', to_date('21-10-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (550634443, 'Jay', 'Mellencamp', 524199590, 'Employee', to_date('01-08-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (672385701, 'Oliver', 'Griffiths', 525936277, 'Employee', to_date('25-11-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (442952372, 'Wesley', 'Davison', 511759586, 'Manager', to_date('07-08-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (809570703, 'Joan', 'Lennox', 513083555, 'Manager', to_date('08-11-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (657669208, 'Christine', 'Leguizamo', 510122569, 'Manager', to_date('19-10-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (781797266, 'Patty', 'LuPone', 513886170, 'Manager', to_date('27-03-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (901756155, 'Gord', 'Hanks', 501417786, 'Employee', to_date('06-01-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (417890599, 'Alfred', 'Rockwell', 517093540, 'Employee', to_date('23-08-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (854266943, 'Ashley', 'Calle', 507935187, 'Manager', to_date('23-11-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (797694929, 'Merrilee', 'Conroy', 527144949, 'Manager', to_date('04-07-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (795523664, 'Glenn', 'Cazale', 505958672, 'Employee', to_date('15-03-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (284127270, 'Vertical', 'Dillane', 503474303, 'Employee', to_date('12-07-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (203546832, 'Edwin', 'Sheen', 509220072, 'Employee', to_date('26-02-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (858595390, 'Saul', 'Yorn', 520429298, 'Manager', to_date('22-04-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (882392837, 'Beverley', 'Chilton', 528399456, 'Manager', to_date('01-06-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (564319391, 'Nora', 'Miller', 505099414, 'Manager', to_date('17-01-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (881996190, 'Orlando', 'Scott', 512258902, 'Manager', to_date('21-07-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (857481927, 'Irene', 'Taha', 501155240, 'Employee', to_date('09-06-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (438687886, 'Tobey', 'Trevino', 521303829, 'Employee', to_date('28-01-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (493444601, 'Howie', 'Frakes', 528733013, 'Employee', to_date('23-10-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (743499049, 'Judy', 'Tillis', 517488010, 'Employee', to_date('28-12-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (228296234, 'Louise', 'Christie', 518304908, 'Employee', to_date('26-03-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (129939954, 'Mykelti', 'Elizabeth', 518121725, 'Employee', to_date('04-09-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (269880341, 'Jeff', 'Torn', 514163809, 'Employee', to_date('12-12-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (168396581, 'Illeana', 'Jessee', 515650211, 'Employee', to_date('16-01-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (819629728, 'Emilio', 'Freeman', 514238467, 'Employee', to_date('15-05-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (132840801, 'Gailard', 'Hart', 506688453, 'Manager', to_date('28-06-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (135138235, 'Roy', 'Coughlan', 517263365, 'Manager', to_date('27-07-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (424494863, 'Ricardo', 'Ryan', 500969831, 'Employee', to_date('27-11-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (483639945, 'Giancarlo', 'Lipnicki', 500659543, 'Manager', to_date('03-04-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (893698379, 'Kirsten', 'Marley', 523262484, 'Manager', to_date('09-10-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (919317998, 'Taylor', 'Mars', 502183122, 'Employee', to_date('17-06-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (511652755, 'Suzi', 'Collette', 506524124, 'Manager', to_date('06-07-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (990981562, 'Edgar', 'Willard', 512906822, 'Employee', to_date('25-03-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (543316031, 'Mary', 'Senior', 522794648, 'Manager', to_date('02-09-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (450961899, 'Mae', 'Miller', 526105785, 'Manager', to_date('17-04-2018', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (358365099, 'Brenda', 'Creek', 504245219, 'Employee', to_date('26-09-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (588365109, 'Jann', 'Whitley', 504537398, 'Manager', to_date('24-10-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (980774607, 'Dabney', 'Richards', 527264353, 'Manager', to_date('15-07-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (441147157, 'Bette', 'Zappacosta', 513424094, 'Manager', to_date('18-10-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (653906682, 'Franz', 'Rickles', 503463593, 'Manager', to_date('20-11-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (151126233, 'Toshiro', 'Holiday', 526451640, 'Manager', to_date('11-01-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (116131515, 'Candice', 'Elwes', 505091410, 'Employee', to_date('05-04-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (397924247, 'Joely', 'Moorer', 501667747, 'Employee', to_date('20-04-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (281724600, 'Roger', 'Webb', 521324484, 'Manager', to_date('19-10-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (272550574, 'Bernie', 'Zellweger', 505164376, 'Manager', to_date('05-04-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (318062617, 'Rita', 'Wopat', 512656886, 'Manager', to_date('18-05-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (646542153, 'Kenny', 'Polito', 522048034, 'Employee', to_date('20-07-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (105629063, 'Alan', 'Paquin', 511804753, 'Employee', to_date('22-06-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (924607628, 'Harrison', 'urban', 520074253, 'Employee', to_date('28-03-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (935844232, 'Gladys', 'Holland', 514546031, 'Manager', to_date('17-05-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (763759293, 'Raul', 'Folds', 525507854, 'Manager', to_date('29-06-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (424143766, 'Uma', 'Marshall', 509295658, 'Employee', to_date('02-01-2017', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (133365860, 'Dom', 'Nelligan', 510274887, 'Employee', to_date('24-01-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (530943900, 'Courtney', 'Moss', 518066444, 'Employee', to_date('28-08-2020', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (553780623, 'Edwin', 'Hagar', 528006462, 'Employee', to_date('24-02-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (309276586, 'Katie', 'Byrd', 524287095, 'Manager', to_date('22-01-2022', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (488127037, 'Lupe', 'Solido', 514606630, 'Manager', to_date('14-02-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (334753703, 'Madeleine', 'Lillard', 507707109, 'Employee', to_date('31-10-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (587229426, 'Bernie', 'Doucette', 504350741, 'Employee', to_date('31-12-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (388068182, 'Ali', 'Mitra', 517713314, 'Employee', to_date('01-02-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (560553396, 'Cevin', 'Diesel', 519884424, 'Manager', to_date('14-11-2021', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (456387075, 'Anna', 'Potter', 516601729, 'Manager', to_date('09-10-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (999898886, 'Cheryl', 'Lynskey', 514204817, 'Employee', to_date('28-06-2023', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (302453160, 'Cyndi', 'Ruiz', 505216146, 'Manager', to_date('06-04-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (951147722, 'Andie', 'Spears', 520514237, 'Manager', to_date('27-08-2018', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (797728760, 'Azucar', 'Katt', 517036634, 'Employee', to_date('09-08-2019', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (310053477, 'Frankie', 'Church', 502047173, 'Employee', to_date('21-12-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (647328070, 'Raul', 'Costello', 510662623, 'Employee', to_date('15-03-2016', 'dd-mm-yyyy'));
insert into WORKER (workerid, workerfname, workerlname, workerphone, position, hiredate)
values (962330174, 'Chloe', 'Ellis', 529760825, 'Employee', to_date('09-05-2018', 'dd-mm-yyyy'));
commit;
prompt 334 records loaded
prompt Loading CUSTOMER...
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (325625541, ' tov', ' avni', 586645247, ' tom@gmail.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (245556898, ' dov', ' barak', 524960993, ' dov@gmail.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (987564231, ' nir', ' jank', 507884545, 'nir@g.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (123456789, ' John', ' Doe', 551234567, ' john.doe@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (544125895, ' Jane', ' Smith', 557654321, ' jane.smith@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (263933120, 'Annette', 'Nolte', 508529887, 'annette.nolte@d');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (421988038, 'Harris', 'Redgrave', 500843066, 'harris.redgrave');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (143136513, 'Saul', 'Pollack', 503668483, 's.pollack@mls.i');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (906571901, 'Lari', 'Matarazzo', 501731458, 'lari.matarazzo@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (428081030, 'Etta', 'Pierce', 503456002, 'etta.p@midwestm');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (766023468, 'Rolando', 'Kravitz', 506398566, 'rolando.kravitz');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (938819453, 'Meryl', 'Parsons', 506848355, 'meryl.parsons@c');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (945180637, 'Rose', 'Judd', 508135056, 'rjudd@unica.uk');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (374349078, 'Ned', 'Giraldo', 507794914, 'ned.giraldo@sds');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (301747054, 'Lindsay', 'Sweet', 500819328, 'lindsay.s@intel');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (943740069, 'Thelma', 'Elwes', 505381616, 'thelma.elwes@ma');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (277455942, 'Donal', 'Fisher', 506667667, 'donal.fisher@am');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (447792762, 'Rik', 'Curtis', 503984436, 'rcurtis@capital');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (192504260, 'Carla', 'Brooke', 505794663, 'carla.brooke@gd');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (255266167, 'Charles', 'Tah', 507703026, 'charles.tah@por');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (697081561, 'Cloris', 'Rudd', 501232941, 'crudd@lfg.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (744166842, 'Cloris', 'Marie', 505962230, 'cloris.marie@fm');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (197227393, 'Murray', 'Swank', 501742380, 'murray.swank@mc');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (584051995, 'Dar', 'Carlton', 509639698, 'darc@sht.ca');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (674942711, 'Kate', 'Theron', 501325077, 'kate.theron@chh');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (420639562, 'Merrilee', 'McCann', 504854452, 'merrilee@labrad');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (371721560, 'Noah', 'Rauhofer', 502235058, 'nrauhofer@johnk');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (134230339, 'Trick', 'Day-Lewis', 501740632, 't.daylewis@afs.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (624502369, 'Wallace', 'Mifune', 500143051, 'wallace.mifune@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (729475230, 'Cathy', 'Pressly', 508716145, 'cpressly@kingla');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (836348702, 'Ronny', 'Benson', 507604569, 'ronny.benson@sm');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (802288035, 'Ned', 'Feore', 509886274, 'nfeore@tasteful');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (253985889, 'Armand', 'Ribisi', 507370784, 'armandr@meridia');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (583202281, 'Elijah', 'Mueller-Stahl', 509670752, 'elijah.m@homede');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (268305846, 'Jesus', 'Lithgow', 501609834, 'jesus.l@captech');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (707625834, 'Heather', 'Tilly', 508260720, 'heather.tilly@h');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (134272963, 'Bebe', 'Roundtree', 508199751, 'bebe.roundtree@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (513484972, 'Toshiro', 'Bergen', 503934733, 'toshiro.bergen@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (483436747, 'Chubby', 'Spears', 504221922, 'chubby.spears@i');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (403494067, 'Ralph', 'Gold', 501245662, 'ralph.g@philipm');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (989150100, 'Davis', 'Nicholson', 507913140, 'davis.nicholson');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (327654260, 'Tamala', 'Hauser', 504203293, 'tamala.hauser@a');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (974867756, 'Andre', 'Barnett', 503800143, 'abarnett@dvdt.d');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (790547437, 'Lili', 'Pollack', 503539683, 'lpollack@oneida');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (778296365, 'Kevin', 'Curfman', 504316621, 'kevin.curfman@t');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (567842670, 'Tara', 'Brosnan', 509985892, 'tara.brosnan@pr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (592869436, 'Stanley', 'Whitaker', 501734973, 'stanley.whitake');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (808917655, 'Christian', 'Fierstein', 508024862, 'christian.fiers');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (973406121, 'Ronnie', 'Ali', 505692195, 'ronnie.ali@cima');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (196581216, 'Shannyn', 'Schock', 505373217, 'shannyn.schock@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (123329657, 'Vertical', 'El-Saher', 507600719, 'vertical.e@hers');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (221469518, 'Tara', 'Summer', 501409774, 'taras@actechnol');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (113323897, 'Juliana', 'Gibson', 503996845, 'juliana.gibson@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (895647398, 'Dan', 'Williamson', 504753952, 'dan.williamson@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (868910800, 'Christina', 'Linney', 505194147, 'christina.linne');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (968299891, 'Charlize', 'Cox', 505930035, 'charlizec@pepsi');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (558097639, 'Gwyneth', 'Stoltz', 501188764, 'gstoltz@axis.de');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (240910785, 'Barbara', 'Penn', 500297023, 'barbara.penn@pr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (581317488, 'Viggo', 'Depp', 501776499, 'viggo.depp@nike');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (161560240, 'Delroy', 'Venora', 509846125, 'delroy@signalpe');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (467555878, 'Larnelle', 'Malone', 507761847, 'larnelle.malone');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (599844884, 'Franz', 'Gayle', 501786755, 'franz.gayle@usp');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (455900063, 'Ethan', 'Statham', 508164220, 'ethan.statham@n');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (306366983, 'Sigourney', 'McKean', 501697873, 'sigourney.mckea');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (968495860, 'Tia', 'Sharp', 501879213, 'tia.s@bedfordba');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (228002510, 'Adam', 'Luongo', 501835206, 'adam.luongo@int');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (258121065, 'Tcheky', 'Christie', 504861760, 't.christie@glac');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (691755625, 'Bette', 'Field', 501642781, 'bette.f@stm.it');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (724905945, 'Dianne', 'Reiner', 500949032, 'dianner@whitewa');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (545448531, 'Louise', 'Diesel', 506669504, 'louise.diesel@p');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (681343156, 'Johnnie', 'Culkin', 501767530, 'johnnie.culkin@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (886879923, 'Raymond', 'Redgrave', 509802355, 'raymond.redgrav');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (522778039, 'Ryan', 'Shandling', 501963736, 'ryan@consultant');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (266263726, 'Cornell', 'Allison', 506836876, 'cornell.allison');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (124217936, 'Max', 'Adams', 503379925, 'madams@nobraine');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (807905294, 'Jeffrey', 'McKean', 508180627, 'jeffrey.mckean@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (650466341, 'Miki', 'Hector', 502520623, 'miki.hector@blu');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (553370732, 'Karen', 'McCabe', 507055820, 'karen.mccabe@nt');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (389914550, 'Kevin', 'Crouse', 502189069, 'kevin.crouse@ib');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (703867230, 'Michael', 'Wilson', 507307230, 'm.wilson@qas.br');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (740249479, 'Ricky', 'Unger', 506802975, 'rickyu@connecte');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (480670356, 'Temuera', 'Palmer', 501282702, 'temuerap@ceo.co');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (316124648, 'Rhett', 'Sewell', 509061880, 'rhetts@envision');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (942723809, 'Winona', 'Jackson', 504659896, 'wjackson@boldte');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (218295795, 'Alec', 'Witt', 506446790, 'awitt@valleyoak');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (780324751, 'Emmylou', 'Weiland', 500948070, 'emmylouw@procla');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (825936905, 'Jean', 'Burton', 505804570, 'jean.burton@ver');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (803780520, 'Queen', 'Crudup', 508444126, 'q.crudup@refine');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (437393325, 'Mykelti', 'David', 500840054, 'mykelti@mls.fr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (439553439, 'Sylvester', 'Margulies', 508140708, 'sylvester.margu');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (873385477, 'Mickey', 'Watson', 503234202, 'mickey.watson@b');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (936794880, 'Ricardo', 'Rizzo', 504379107, 'ricardo@bioanal');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (943647325, 'Jerry', 'Austin', 509473098, 'jerry.austin@de');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (673035860, 'Harrison', 'Reubens', 503029226, 'hreubens@mls.de');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (546898866, 'Tom', 'Moriarty', 503292714, 'tom.moriarty@st');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (449457599, 'Meryl', 'Carlisle', 505472658, 'mcarlisle@epiqs');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (697718660, 'Loreena', 'Cagle', 508200251, 'loreena.cagle@t');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (722138215, 'Ty', 'Dench', 506654509, 'ty23@catamount.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (560576995, 'Katrin', 'Travers', 508741981, 'katrin@pulaskif');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (287753188, 'Cherry', 'Bedelia', 509762144, 'cbedelia@efcban');
commit;
prompt 100 records committed...
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (827905570, 'Armin', 'Affleck', 507209252, 'armina@qestrel.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (122807530, 'Mint', 'Foxx', 508148063, 'mint@nobrainerb');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (808037039, 'Anne', 'Sewell', 507590791, 'annes@scooterst');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (503985065, 'Mint', 'Marsden', 504723994, 'mint.marsden@ca');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (729902851, 'Sally', 'McCracken', 504359793, 'sally.m@vfs.de');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (647758895, 'Mark', 'MacLachlan', 505006078, 'mmaclachlan@ade');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (907648704, 'Corey', 'Ceasar', 507499655, 'c.ceasar@provid');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (868375445, 'Nora', 'Pepper', 501337848, 'npepper@bigyank');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (420763488, 'Heather', 'Sevigny', 508484123, 'heathers@provid');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (954578245, 'Jeroen', 'Janssen', 509449158, 'jeroenj@elmco.d');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (198213026, 'Franco', 'Skerritt', 507057269, 'franco.skerritt');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (697412816, 'Rebecca', 'Weber', 504329338, 'rebecca.weber@g');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (703141922, 'Joy', 'Orton', 508969973, 'joy@pioneermort');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (741906391, 'Maury', 'Hewett', 507162792, 'maury.hewett@as');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (729109513, 'Kitty', 'Rossellini', 505725087, 'krossellini@dir');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (213288859, 'Jaime', 'Gibbons', 504883976, 'jaime.gibbons@i');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (666319395, 'Taylor', 'Giannini', 508236076, 'taylor.giannini');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (216313836, 'Colin', 'Paige', 505370554, 'cpaige@shar.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (285837012, 'Juliana', 'Ledger', 508232119, 'jledger@afs.uk');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (788384990, 'Kurtwood', 'Lipnicki', 503431235, 'kurtwood.l@math');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (515593162, 'Eddie', 'Firth', 501631371, 'eddie.firth@noo');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (324274105, 'Tyrone', 'Winans', 509708456, 'tyrone@greene.n');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (974845127, 'Praga', 'Guinness', 501273965, 'praga.guinness@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (431716178, 'Kris', 'Beckinsale', 503369342, 'k.beckinsale@am');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (896331645, 'Joaquim', 'Curtis', 509256125, 'joaquimc@bedfor');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (817343643, 'Micky', 'Utada', 509507041, 'micky.utada@tig');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (837815367, 'Bernard', 'Perry', 501758939, 'bernardp@perfec');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (639109815, 'Martin', 'Ifans', 508133022, 'm.ifans@inspira');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (938901812, 'Mark', 'Nightingale', 501791339, 'mark.nightingal');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (131740753, 'Liquid', 'Hoffman', 500776007, 'liquid.h@dis.co');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (906439118, 'Terrence', 'Hector', 502874226, 'thector@acsis.c');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (257844327, 'Queen', 'Leoni', 501352845, 'queen.leoni@ppr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (780026125, 'Charlton', 'Cook', 508191873, 'charlton.cook@t');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (137444356, 'Cesar', 'Whitmore', 501563471, 'cesar.whitmore@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (352081244, 'Gailard', 'Mandrell', 503208546, 'gailard.m@manha');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (757178484, 'Angela', 'Lonsdale', 503159905, 'angela@waltdisn');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (793265229, 'Howie', 'Myers', 503583980, 'hmyers@quakerci');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (817458147, 'Adrien', 'Levert', 500161553, 'a.levert@linacs');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (552191541, 'Glen', 'Ball', 503863116, 'gball@infinity.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (955098908, 'Kevn', 'Romijn-Stamos', 500592437, 'kevnr@mindworks');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (156797910, 'Albert', 'Peterson', 507197685, 'albert.peterson');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (249557147, 'Jude', 'Nielsen', 506461457, 'juden@palmbeach');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (682390517, 'Gene', 'Borgnine', 505519121, 'geneb@learningv');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (313753604, 'Laurence', 'Pride', 504019584, 'l.pride@pis.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (919967767, 'Vonda', 'Eldard', 504837833, 'vonda.eldard@ma');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (730310194, 'Franco', 'Gambon', 500248278, 'francog@scjohns');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (421262884, 'Spencer', 'Turturro', 509170342, 'spencer.turturr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (526605638, 'Adina', 'Young', 505486198, 'adina@anworthmo');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (627648086, 'Remy', 'Gatlin', 505159617, 'remy.gatlin@psc');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (859179543, 'Brian', 'McDonnell', 508860750, 'brian@wyeth.tr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (192749622, 'Cyndi', 'de Lancie', 509142605, 'cyndid@oriservi');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (164240019, 'Rene', 'Damon', 501462191, 'rene@trusecure.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (673479105, 'Christopher', 'Reiner', 501153403, 'christopher@als');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (956801078, 'Hope', 'Buscemi', 502711948, 'hbuscemi@pionee');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (623232154, 'Goldie', 'Moriarty', 508029464, 'goldie.m@prahs.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (545206449, 'Albert', 'Glenn', 509842609, 'albert.glenn@vm');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (542435161, 'Hector', 'Biggs', 502672319, 'h.biggs@usphysi');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (719289034, 'Brent', 'Jackman', 504178230, 'brent.jackman@a');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (701966333, 'Anjelica', 'Emmett', 507225311, 'anjelica@nha.co');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (467941416, 'Shannyn', 'Zellweger', 504665015, 'shannyn.zellweg');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (542907098, 'Paula', 'Peterson', 509968473, 'paula.peterson@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (599264563, 'Freda', 'Coburn', 500047752, 'freda.coburn@un');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (913624590, 'Denise', 'Andrews', 501166947, 'denisea@dbprofe');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (441856095, 'Patty', 'Gambon', 500912044, 'patty.gambon@mo');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (821182940, 'Timothy', 'Stampley', 506456058, 'timothy.stample');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (234377155, 'Leonardo', 'Duschel', 502793621, 'leonardo.dusche');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (681611216, 'Bobbi', 'Lizzy', 500948911, 'b.lizzy@trekequ');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (103136089, 'Kylie', 'Hornsby', 500155256, 'kylie.hornsby@b');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (917606772, 'Edgar', 'Watson', 501407184, 'edgar@base.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (426285667, 'Alannah', 'Epps', 505215511, 'aepps@elitemedi');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (606415760, 'Geoffrey', 'Glover', 503580628, 'geoffreyg@virba');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (636694801, 'Joan', 'Alexander', 500549951, 'jalexander@seia');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (389665892, 'Lindsey', 'Rucker', 509852621, 'lindseyr@enterp');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (930733425, 'Lance', 'Robbins', 504489476, 'l.robbins@fns.c');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (797907755, 'Shawn', 'Church', 508059945, 'shawn.church@la');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (912201109, 'Franz', 'Blanchett', 500166022, 'franz.blanchett');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (510440272, 'Gran', 'Ranger', 501150045, 'gran.r@perfecto');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (848493303, 'Mary-Louise', 'Payne', 503267141, 'marylouise.payn');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (291414436, 'Davy', 'MacDowell', 500825036, 'davy@inzone.de');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (372877495, 'Betty', 'Edmunds', 500029454, 'bedmunds@csi.br');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (299967787, 'Ray', 'Keeslar', 508460425, 'rayk@bayer.dk');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (269683950, 'Shannon', 'Kahn', 501593466, 'skahn@berkshire');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (950783774, 'Sandra', 'Badalucco', 506423397, 'sandra.badalucc');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (986298985, 'Carlene', 'Piven', 506055059, 'carlene.piven@u');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (831414158, 'Andre', 'Olin', 508907256, 'andre.olin@card');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (452049063, 'Teri', 'Carnes', 504843431, 'tcarnes@onesour');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (851779666, 'Colleen', 'MacNeil', 500056304, 'colleen@hiltonh');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (471730270, 'Irene', 'Puckett', 509474819, 'irene.puckett@i');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (345395796, 'Celia', 'Perlman', 508837112, 'celia@capstone.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (122753845, 'Sheryl', 'Fox', 503212005, 'sheryl.fox@refi');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (524965504, 'First', 'Prinze', 500780376, 'first@jlphor.co');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (272193034, 'Juliana', 'Apple', 501489100, 'juliana.apple@l');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (803138572, 'Christopher', 'Hawn', 509655894, 'christopher.haw');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (944607210, 'Judge', 'Van Der Beek', 508940089, 'judge.v@dcgroup');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (295746078, 'Cathy', 'Fierstein', 507783856, 'cfierstein@eagl');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (950467563, 'Freddy', 'Visnjic', 508741626, 'fvisnjic@tlsser');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (806862152, 'Nikka', 'Griffin', 507574153, 'nikka.griffin@p');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (165389268, 'Jet', 'Weber', 503845441, 'jet.weber@ceom.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (145384950, 'Omar', 'Nielsen', 504568466, 'omar.nielsen@at');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (800709965, 'Janice', 'Brothers', 508168145, 'janice.brothers');
commit;
prompt 200 records committed...
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (778703444, 'Steve', 'Unger', 508708542, 'sunger@bigyanks');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (610054864, 'Lennie', 'Atlas', 501209278, 'lennie.atlas@si');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (786282221, 'Kris', 'Finney', 503340266, 'kris.finney@aco');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (429620988, 'Giovanni', 'Gagnon', 507244465, 'giovanni.gagnon');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (637754619, 'Guy', 'Beckinsale', 509595319, 'gbeckinsale@dil');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (538844626, 'Gran', 'Fichtner', 504559751, 'gfichtner@cardt');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (725086744, 'Shirley', 'Gordon', 502844878, 'sgordon@nestle.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (945279866, 'Saffron', 'Stigers', 505294058, 'saffrons@extrem');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (129018780, 'Liquid', 'Sainte-Marie', 509881023, 'liquid.saintema');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (749939457, 'Sophie', 'Chaplin', 505555937, 'sophie.chaplin@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (346065648, 'Judd', 'Rossellini', 500515717, 'judd.rossellini');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (311775493, 'Maria', 'Paltrow', 509065407, 'maria@pinnacles');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (554015100, 'Gino', 'Stiers', 505764681, 'gstiers@ssi.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (789041031, 'Kathleen', 'McGovern', 508623018, 'kathleen@nestle');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (643989569, 'Sandra', 'Diddley', 506907795, 'sandra.diddley@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (818787363, 'Lea', 'Barry', 507470447, 'lea.barry@quest');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (716892768, 'Ewan', 'Soul', 508750031, 'esoul@at.no');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (696875532, 'Pam', 'Roy Parnell', 503800959, 'pam.royparnell@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (444657296, 'Alicia', 'Flatts', 504991291, 'aliciaf@pragmat');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (626936785, 'Nelly', 'Irving', 501922084, 'n.irving@diamon');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (480311544, 'Neneh', 'Stiers', 507669487, 'neneh.stiers@wa');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (834541158, 'Buffy', 'Kinnear', 506600055, 'buffyk@sensorte');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (210106163, 'Nik', 'Hiatt', 507427236, 'nik.hiatt@heart');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (631849990, 'Robby', 'Norton', 505538830, 'robby@fmb.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (938459826, 'Barbara', 'May', 502759828, 'barbara.may@key');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (325511943, 'Rosario', 'Crosby', 505485058, 'rosario.crosby@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (472169395, 'Quentin', 'Arden', 507136953, 'quentin@hershey');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (589587031, 'Max', 'Cattrall', 501919064, 'max.cattrall@ki');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (482275465, 'Louise', 'Warwick', 503148960, 'lwarwick@monarc');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (265517964, 'Maureen', 'Durning', 500216816, 'maureen.durning');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (895518662, 'Tea', 'Statham', 501034119, 'tea@cooktek.jp');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (629940780, 'Leslie', 'Howard', 501908361, 'leslie.howard@a');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (560025062, 'Wallace', 'Tah', 501376096, 'wallace@virbac.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (417183880, 'Derek', 'Freeman', 503570998, 'derek.freeman@n');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (240772731, 'Leon', 'Kilmer', 502656879, 'leonk@irissoftw');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (974824879, 'Vonda', 'Elizabeth', 507329906, 'v.elizabeth@hen');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (278575869, 'Marley', 'Nelson', 506721286, 'marley.n@ivorys');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (260972543, 'April', 'Paquin', 503991148, 'april.paquin@be');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (706361513, 'Franz', 'Page', 501043492, 'fpage@heartlab.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (197764210, 'Vincent', 'Uggams', 509616071, 'vincent.uggams@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (583491287, 'Ruth', 'Short', 504973265, 'ruth.short@slt.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (121281852, 'Rosanna', 'Leigh', 500206136, 'rosanna.leigh@s');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (271772311, 'Kid', 'Garr', 502536470, 'kid.garr@chipss');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (473309507, 'Clay', 'Sarsgaard', 504665121, 'clay@hospitalso');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (391929257, 'Cevin', 'Weaving', 501708271, 'cevinw@monarchc');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (549769099, 'Jonathan', 'Hunter', 508432706, 'jonathanh@recki');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (1, 'John', 'Doe', 1234567890, 'john.doe@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (2, 'Jane', 'Smith', -1949288395, 'jane.smith@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (3, 'Alice', 'Johnson', -838178284, 'alice.johnson@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (4, 'Bob', 'Brown', 272922827, 'bob.brown@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (5, 'Charlie', 'Williams', 1383933938, 'charlie.williams@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (6, 'David', 'Jones', -1800922247, 'david.jones@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (7, 'Eva', 'Garcia', -699811136, 'eva.garcia@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (8, 'Frank', 'Miller', 311299975, 'frank.miller@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (9, 'Grace', 'Davis', 422411086, 'grace.davis@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (10, 'Hannah', 'Rodriguez', 1234567809, 'hannah.rodriguez@example.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (804212216, 'Ethan', 'Forrest', 504859843, 'ethan@hiltonhot');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (299448259, 'Judi', 'Thorton', 506721123, 'judi.thorton@in');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (745045181, 'Jason', 'Rodgers', 508712995, 'jason@lfg.uk');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (507799270, 'Tanya', 'Dalton', 504091439, 'tanya@hospitals');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (105303177, 'Marty', 'Elwes', 505610733, 'melwes@stonetec');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (132169290, 'Nils', 'Frakes', 506320001, 'nils.f@base.ch');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (542605612, 'Adam', 'Duchovny', 509650975, 'adamd@atxforms.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (186952282, 'Loretta', 'Wilson', 508295236, 'loretta@alberts');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (706969463, 'Ed', 'Weisz', 501228843, 'ed.weisz@mcdona');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (616910574, 'Paul', 'Brolin', 506810657, 'paul.brolin@lab');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (787347918, 'Frank', 'Zellweger', 509110279, 'frank.zellweger');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (125608783, 'Sally', 'Allen', 507876868, 'sally.allen@key');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (300062466, 'Stephen', 'Waits', 508718240, 'stephen.waits@n');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (874705561, 'Burt', 'Irving', 503240515, 'b.irving@gbas.u');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (775383331, 'Hal', 'Wells', 507427851, 'h.wells@capital');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (194232301, 'First', 'Keaton', 500532070, 'first.keaton@ne');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (225307756, 'Yolanda', 'Baldwin', 503816488, 'y.baldwin@traff');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (162396918, 'Tobey', 'Kattan', 502244242, 'tobey.k@ameriso');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (284565143, 'Laurie', 'Haynes', 500004241, 'laurie.haynes@s');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (436250931, 'Scott', 'Freeman', 509687063, 'scott.freeman@a');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (669597925, 'Greg', 'Richards', 505044755, 'greg.richards@p');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (799220603, 'Juliette', 'Piven', 503419183, 'jpiven@lydiantr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (397502047, 'Vin', 'Macy', 500182739, 'vin@clubone.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (804079896, 'Brent', 'Sevigny', 503841152, 'brent.sevigny@d');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (813641457, 'Nicky', 'Chinlund', 500017563, 'nicky.chinlund@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (457979501, 'Corey', 'Posey', 509510141, 'coreyp@abatix.c');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (623366011, 'Vanessa', 'Mattea', 503178203, 'vanessa.mattea@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (181840584, 'Ving', 'Harper', 501723437, 'ving.harper@pro');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (448016271, 'Mitchell', 'Kravitz', 504692520, 'mitchell.kravit');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (654434419, 'Steven', 'Willard', 506911724, 'steven.willard@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (501163002, 'Herbie', 'Bancroft', 504736397, 'herbie.bancroft');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (342892110, 'Martha', 'Hynde', 509663249, 'martha.hynde@se');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (649086355, 'Jean-Luc', 'Cozier', 507114445, 'jeanluc.c@educa');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (935840799, 'Elizabeth', 'Isaacs', 506314784, 'elizabeth@cardt');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (559150491, 'Chris', 'Osmond', 504652522, 'c.osmond@univer');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (566221274, 'Vienna', 'McGill', 501729037, 'v.mcgill@vertex');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (861809618, 'Carla', 'Weaving', 507752090, 'carla@fflcbanco');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (365418624, 'Loren', 'Lipnicki', 508018378, 'loren.lipnicki@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (236750514, 'Rick', 'Russo', 503622796, 'rick.russo@lina');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (393036291, 'Todd', 'Tucker', 503082666, 'todd@emt.ca');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (390851039, 'Eileen', 'DeVito', 503765876, 'eileen.devito@s');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (725731892, 'Howie', 'Conway', 503465532, 'howiec@clubone.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (960372598, 'Vondie', 'Cattrall', 509115777, 'vondie.cattrall');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (691582492, 'Thora', 'Latifah', 502259338, 'thora.latifah@v');
commit;
prompt 300 records committed...
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (592018226, 'Ed', 'Mellencamp', 503811072, 'ed.m@softworld.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (491125002, 'Rosie', 'Presley', 501065399, 'rosiep@ositisso');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (704314082, 'Natacha', 'Affleck', 507176927, 'natachaa@outsou');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (584001587, 'Elizabeth', 'Branch', 502553293, 'elizabeth.branc');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (657420745, 'Kathleen', 'Venora', 504728371, 'kathleen.venora');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (508936899, 'Rupert', 'Beck', 500029379, 'rupert.beck@gre');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (859662161, 'Millie', 'Rudd', 501514545, 'millie.rudd@hen');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (688306157, 'Fats', 'Perrineau', 509692527, 'fats@techbooks.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (614431600, 'Leo', 'Pacino', 508582378, 'leo.p@serentec.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (445212798, 'Cary', 'Valentin', 507221773, 'cary@deutschete');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (795240217, 'Steve', 'Broza', 503069904, 'steve@atxforms.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (969810041, 'Murray', 'Green', 503227012, 'murray.green@ca');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (689650907, 'Jessica', 'Gibbons', 501687733, 'jgibbons@magnet');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (157834477, 'Phoebe', 'El-Saher', 508766827, 'phoebe.e@chhc.n');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (754327619, 'Claire', 'MacIsaac', 507828625, 'claire.macisaac');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (300719389, 'Vondie', 'Jeffreys', 505850734, 'vondie@fmt.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (561339567, 'Uma', 'Kinnear', 500819759, 'uma@universalso');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (124880565, 'Red', 'Overstreet', 502621087, 'red.overstreet@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (243930676, 'Charlton', 'Osbourne', 501950785, 'c.osbourne@diag');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (108115017, 'Yolanda', 'Ferrer', 506488807, 'yolanda.ferrer@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (514086159, 'Jennifer', 'Jonze', 502443778, 'jennifer.jonze@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (732884302, 'Debby', 'Ermey', 501458674, 'debby.ermey@mar');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (294340413, 'Tori', 'Frost', 504504543, 'tori@spd.ch');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (337725570, 'Paula', 'Kristofferson', 505800414, 'paula.kristoffe');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (278052511, 'Herbie', 'Palmer', 503339148, 'herbie@capitala');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (875284104, 'Bo', 'Goldwyn', 506606469, 'bo.goldwyn@virb');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (205673704, 'Penelope', 'Nicks', 505408506, 'penelope.n@swee');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (155852248, 'Eileen', 'Gryner', 509400827, 'eileen.gryner@m');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (850155210, 'Paula', 'McCabe', 508983977, 'paula.mccabe@ev');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (161048354, 'Millie', 'Rippy', 505898296, 'millie.rippy@pf');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (563088236, 'Micky', 'Barry', 509212132, 'micky.b@tilia.d');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (416008888, 'Ernie', 'Coltrane', 501904196, 'ernie.coltrane@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (721838773, 'Aidan', 'Brosnan', 508082680, 'aidan.brosnan@m');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (767948216, 'Bryan', 'Miller', 500230900, 'bmiller@nat.dk');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (140924331, 'Tara', 'Mac', 507571318, 'tara.mac@mls.fr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (669392193, 'Fiona', 'Sayer', 504956121, 'fiona.sayer@vit');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (631161240, 'Tobey', 'Margolyes', 504889487, 'tobey.margolyes');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (617468816, 'Johnny', 'Allen', 507413839, 'johnny.allen@da');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (648472634, 'Gene', 'Sweeney', 505561500, 'gene.s@marathon');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (281153050, 'Geraldine', 'Church', 509254604, 'gchurch@waltdis');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (566176030, 'Elle', 'Tarantino', 502277755, 'elle.t@dearborn');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (843168457, 'Bobby', 'Keith', 502581270, 'bobby.keith@otb');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (566975851, 'Colm', 'Tyson', 501947282, 'colmt@perfector');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (720514714, 'Joely', 'Crimson', 505072456, 'joely@fpf.de');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (128425932, 'Joely', 'Wheel', 501486756, 'joely.w@nobrain');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (262547088, 'Will', 'Orbit', 509901640, 'willo@infovisio');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (331947476, 'Hugh', 'Spacey', 500338875, 'hugh.s@gdi.se');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (742296256, 'Ani', 'Hershey', 500683490, 'anih@ceb.fr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (940073998, 'Arturo', 'Baker', 509842345, 'arturo.baker@sf');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (470027926, 'Ramsey', 'Kweller', 508608472, 'ramsey.kweller@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (736426750, 'Jonny', 'Craddock', 504746326, 'jonny@capellaed');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (605694546, 'Edward', 'Giraldo', 500354425, 'edward.giraldo@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (659242904, 'Ashley', 'Paquin', 501633927, 'ashley.paquin@a');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (540858162, 'Annie', 'Dawson', 503729121, 'a.dawson@securi');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (401282566, 'Edgar', 'Visnjic', 506611372, 'edgar.visnjic@j');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (220530132, 'Rip', 'Ceasar', 506193213, 'rip.ceasar@yumb');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (216899652, 'Robin', 'Driver', 509294446, 'robin.d@prometh');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (365095569, 'Simon', 'Burrows', 508466108, 'simon.burrows@f');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (782002700, 'Jamie', 'Jeffreys', 500767294, 'jamie.jeffreys@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (352842816, 'Madeline', 'Mraz', 506716966, 'madeline.mraz@l');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (455838725, 'Ed', 'Logue', 508434791, 'ed.logue@advert');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (650638242, 'Warren', 'Schiff', 507459902, 'warren.schiff@f');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (346393390, 'Spencer', 'Ramirez', 505755483, 'spencerr@data.c');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (736690718, 'Rory', 'MacDonald', 505649511, 'rory@chipssolut');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (389436980, 'Lionel', 'Borgnine', 507461134, 'lborgnine@hcoa.');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (961019140, 'Ashley', 'Tambor', 502605760, 'atambor@globalw');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (278828881, 'Lena', 'Marx', 502849827, 'lena.marx@balch');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (669676531, 'Talvin', 'Johansen', 507733883, 't.johansen@ezec');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (222833529, 'Ivan', 'Balaban', 507600152, 'ivan.b@proclari');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (609825545, 'Art', 'Choice', 509058389, 'art.c@trusecure');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (313269756, 'Lari', 'Carmen', 507718670, 'laric@asa.br');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (999414117, 'Talvin', 'Skerritt', 501712223, 'talvin.s@tmares');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (671146058, 'Maury', 'Madonna', 502234769, 'm.madonna@newto');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (937782877, 'Kieran', 'Macy', 507120110, 'kieran.macy@dil');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (584067256, 'Kate', 'Osbourne', 508968133, 'kate.osbourne@i');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (545992521, 'Rachid', 'Tsettos', 508856671, 'rachid.tsettos@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (589996156, 'Stellan', 'Stowe', 508142356, 'stellan@atlanti');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (319362863, 'Manu', 'Carmen', 506106123, 'manu.c@oss.de');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (788254160, 'Jena', 'Clooney', 506091051, 'jena@caliber.co');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (241803888, 'Joely', 'Robinson', 508706295, 'joely.robinson@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (301020418, 'Luis', 'Pride', 504845245, 'luis.pride@wyet');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (794558299, 'Elle', 'Rickman', 505377504, 'elle.rickman@tr');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (483245816, 'Emerson', 'Rhys-Davies', 500824069, 'emerson@printte');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (918411684, 'Kathleen', 'Chilton', 507233521, 'kathleen.chilto');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (598119884, 'Manu', 'Domino', 507095785, 'manu@arkidata.c');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (613268978, 'Busta', 'McDowell', 509332160, 'busta@cns.com');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (165940640, 'Sander', 'Studi', 501328983, 'sander.studi@ac');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (160970769, 'Sharon', 'Craig', 504331645, 'sharonc@usdairy');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (780229275, 'Grace', 'Flanagan', 505173492, 'gflanagan@parke');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (334500851, 'Rachael', 'Tobolowsky', 509531430, 'rachael@cartere');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (706217250, 'Ryan', 'Phifer', 506069490, 'ryan.phifer@pri');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (780428506, 'Miki', 'Diddley', 503213559, 'miki.diddley@ap');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (342543356, 'Radney', 'Camp', 503883207, 'radney@reckittb');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (578949305, 'Deborah', 'Broderick', 503571541, 'deborah.broderi');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (249341091, 'Jimmy', 'Harrison', 508240841, 'jimmy.harrison@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (399186364, 'Rosanne', 'Taylor', 504693537, 'rosanne.taylor@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (362292428, 'Forest', 'Visnjic', 506784907, 'forest.visnjic@');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (887596245, 'Buddy', 'Tierney', 503349149, 'buddy.tierney@p');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (725769483, 'Kathleen', 'King', 508059745, 'kathleenk@netnu');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (232836791, 'Suzi', 'LaSalle', 502636126, 'slasalle@restau');
commit;
prompt 400 records committed...
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (947427896, 'Dylan', 'Parsons', 509692388, 'dylan.parsons@p');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (202719248, 'Tramaine', 'Jonze', 504788376, 'tramaine@scjohn');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (108897540, 'Goran', 'Bridges', 505645105, 'goran.bridges@s');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (237823390, 'Rupert', 'Suchet', 502060377, 'rupert.suchet@k');
insert into CUSTOMER (customerid, customerfname, customerlname, customerphone, customeremail)
values (213783892, 'Udo', 'Donovan', 501649531, 'udo.d@kimberlyc');
commit;
prompt 405 records loaded
prompt Loading PURCHASE...
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6238, to_date('15-08-2023', 'dd-mm-yyyy'), 1, 266263726, 158432589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5007, to_date('11-02-2024', 'dd-mm-yyyy'), 8, 682390517, 123568974);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3680, to_date('25-04-2020', 'dd-mm-yyyy'), 3, 868375445, 576383177);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2580, to_date('27-10-2019', 'dd-mm-yyyy'), 7, 778296365, 993308503);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1518, to_date('20-03-2020', 'dd-mm-yyyy'), 7, 260972543, 823304673);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8922, to_date('24-10-2018', 'dd-mm-yyyy'), 5, 851779666, 569717639);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1784, to_date('11-04-2021', 'dd-mm-yyyy'), 4, 249341091, 192622498);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6828, to_date('07-11-2021', 'dd-mm-yyyy'), 1, 225307756, 185749732);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (377, to_date('13-06-2019', 'dd-mm-yyyy'), 7, 143136513, 454288381);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5572, to_date('08-09-2023', 'dd-mm-yyyy'), 8, 802288035, 917429476);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2596, to_date('05-04-2020', 'dd-mm-yyyy'), 8, 637754619, 867644454);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7651, to_date('24-11-2020', 'dd-mm-yyyy'), 2, 365418624, 632557658);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6927, to_date('20-02-2022', 'dd-mm-yyyy'), 4, 722138215, 860858559);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7697, to_date('23-03-2022', 'dd-mm-yyyy'), 1, 961019140, 799059898);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (550, to_date('15-11-2018', 'dd-mm-yyyy'), 6, 449457599, 310053477);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2437, to_date('31-10-2019', 'dd-mm-yyyy'), 7, 417183880, 475128065);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5784, to_date('09-07-2020', 'dd-mm-yyyy'), 6, 706217250, 426628857);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6105, to_date('01-04-2019', 'dd-mm-yyyy'), 4, 255266167, 19);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4631, to_date('06-11-2020', 'dd-mm-yyyy'), 8, 265517964, 828480722);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8496, to_date('15-06-2019', 'dd-mm-yyyy'), 9, 778703444, 707348055);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (170, to_date('16-10-2021', 'dd-mm-yyyy'), 3, 859662161, 522749150);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6239, to_date('03-05-2018', 'dd-mm-yyyy'), 7, 581317488, 467953577);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4926, to_date('05-08-2018', 'dd-mm-yyyy'), 4, 804212216, 647328070);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3599, to_date('30-09-2018', 'dd-mm-yyyy'), 6, 277455942, 901683660);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6997, to_date('03-10-2018', 'dd-mm-yyyy'), 4, 401282566, 18);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3393, to_date('14-11-2021', 'dd-mm-yyyy'), 9, 457979501, 597318657);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7189, to_date('26-06-2019', 'dd-mm-yyyy'), 3, 253985889, 569717639);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8977, to_date('03-09-2021', 'dd-mm-yyyy'), 8, 954578245, 924607628);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (847, to_date('02-02-2020', 'dd-mm-yyyy'), 7, 780324751, 529796133);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8789, to_date('09-01-2022', 'dd-mm-yyyy'), 8, 313753604, 216237124);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4551, to_date('03-12-2018', 'dd-mm-yyyy'), 5, 736426750, 587229426);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (878, to_date('11-10-2022', 'dd-mm-yyyy'), 6, 627648086, 557110167);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1975, to_date('08-04-2022', 'dd-mm-yyyy'), 5, 362292428, 141627986);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (679, to_date('22-12-2022', 'dd-mm-yyyy'), 9, 181840584, 101601397);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6964, to_date('10-01-2021', 'dd-mm-yyyy'), 2, 345395796, 691039126);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6591, to_date('09-06-2022', 'dd-mm-yyyy'), 7, 389665892, 396638853);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7230, to_date('13-06-2018', 'dd-mm-yyyy'), 7, 657420745, 135935044);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6145, to_date('17-12-2020', 'dd-mm-yyyy'), 9, 610054864, 814410876);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1940, to_date('13-06-2023', 'dd-mm-yyyy'), 5, 513484972, 12);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4265, to_date('01-07-2021', 'dd-mm-yyyy'), 5, 113323897, 691039126);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7983, to_date('07-05-2019', 'dd-mm-yyyy'), 2, 681343156, 281955267);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5274, to_date('27-03-2024', 'dd-mm-yyyy'), 4, 599844884, 14);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7231, to_date('05-03-2019', 'dd-mm-yyyy'), 4, 807905294, 868430235);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4695, to_date('13-09-2023', 'dd-mm-yyyy'), 4, 545448531, 547452879);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3124, to_date('23-04-2024', 'dd-mm-yyyy'), 5, 262547088, 192622498);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1371, to_date('19-05-2023', 'dd-mm-yyyy'), 2, 560025062, 852132031);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4474, to_date('30-05-2018', 'dd-mm-yyyy'), 2, 793265229, 692167351);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1158, to_date('05-02-2018', 'dd-mm-yyyy'), 7, 788254160, 493444601);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6432, to_date('03-06-2023', 'dd-mm-yyyy'), 5, 610054864, 691039126);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6710, to_date('31-12-2022', 'dd-mm-yyyy'), 7, 736426750, 797694929);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7877, to_date('08-04-2018', 'dd-mm-yyyy'), 2, 720514714, 356792142);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (800, to_date('26-05-2024', 'dd-mm-yyyy'), 1, 918411684, 937724880);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5351, to_date('08-05-2023', 'dd-mm-yyyy'), 5, 643989569, 935844232);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7140, to_date('21-10-2022', 'dd-mm-yyyy'), 1, 584001587, 660898968);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8037, to_date('18-10-2022', 'dd-mm-yyyy'), 8, 389665892, 356792142);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6132, to_date('10-09-2022', 'dd-mm-yyyy'), 9, 716892768, 837631502);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8433, to_date('25-08-2020', 'dd-mm-yyyy'), 7, 164240019, 511652755);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6618, to_date('24-09-2023', 'dd-mm-yyyy'), 2, 3, 607253067);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4899, to_date('28-08-2018', 'dd-mm-yyyy'), 2, 491125002, 464679908);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4359, to_date('29-05-2020', 'dd-mm-yyyy'), 8, 767948216, 903485761);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (516, to_date('25-01-2021', 'dd-mm-yyyy'), 7, 365418624, 529796133);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5801, to_date('19-12-2020', 'dd-mm-yyyy'), 6, 697718660, 550634443);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7919, to_date('26-07-2018', 'dd-mm-yyyy'), 4, 540858162, 284127270);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6686, to_date('06-08-2023', 'dd-mm-yyyy'), 2, 331947476, 472750278);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (753, to_date('29-11-2018', 'dd-mm-yyyy'), 4, 123329657, 478812574);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2445, to_date('25-03-2024', 'dd-mm-yyyy'), 6, 455900063, 992164595);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8262, to_date('22-04-2023', 'dd-mm-yyyy'), 1, 817458147, 421762580);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3930, to_date('20-11-2020', 'dd-mm-yyyy'), 1, 639109815, 576383177);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2506, to_date('08-01-2019', 'dd-mm-yyyy'), 7, 606415760, 417890599);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5685, to_date('07-01-2019', 'dd-mm-yyyy'), 5, 331947476, 613225413);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (774, to_date('08-12-2019', 'dd-mm-yyyy'), 8, 834541158, 543316031);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3580, to_date('15-08-2018', 'dd-mm-yyyy'), 4, 311775493, 483639945);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5094, to_date('25-06-2021', 'dd-mm-yyyy'), 5, 429620988, 858430175);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6896, to_date('24-09-2020', 'dd-mm-yyyy'), 1, 598119884, 893698379);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8320, to_date('21-05-2023', 'dd-mm-yyyy'), 2, 439553439, 307647370);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8165, to_date('03-12-2021', 'dd-mm-yyyy'), 7, 3, 192622498);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6740, to_date('17-12-2021', 'dd-mm-yyyy'), 5, 480311544, 359530012);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8519, to_date('08-08-2021', 'dd-mm-yyyy'), 3, 540858162, 133365860);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1515, to_date('23-05-2019', 'dd-mm-yyyy'), 8, 631849990, 397924247);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8687, to_date('04-11-2020', 'dd-mm-yyyy'), 4, 311775493, 444849375);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1500, to_date('26-04-2024', 'dd-mm-yyyy'), 6, 241803888, 11);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5473, to_date('17-04-2021', 'dd-mm-yyyy'), 2, 503985065, 105083788);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1507, to_date('03-03-2018', 'dd-mm-yyyy'), 1, 346065648, 438687886);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2505, to_date('21-04-2024', 'dd-mm-yyyy'), 3, 766023468, 363074678);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8993, to_date('08-04-2024', 'dd-mm-yyyy'), 9, 719289034, 294357585);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4821, to_date('15-06-2022', 'dd-mm-yyyy'), 9, 426285667, 284127270);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (186, to_date('08-04-2020', 'dd-mm-yyyy'), 3, 895518662, 678043802);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2711, to_date('14-05-2021', 'dd-mm-yyyy'), 4, 165389268, 824395243);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4536, to_date('01-08-2021', 'dd-mm-yyyy'), 2, 803138572, 203256363);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7162, to_date('10-11-2021', 'dd-mm-yyyy'), 2, 859179543, 361856328);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4503, to_date('17-08-2021', 'dd-mm-yyyy'), 9, 688306157, 132218533);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1548, to_date('21-07-2021', 'dd-mm-yyyy'), 5, 767948216, 17);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5408, to_date('24-11-2023', 'dd-mm-yyyy'), 6, 786282221, 388068182);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3191, to_date('24-11-2022', 'dd-mm-yyyy'), 5, 589996156, 828480722);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4339, to_date('24-10-2022', 'dd-mm-yyyy'), 2, 637754619, 799059898);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3349, to_date('06-04-2021', 'dd-mm-yyyy'), 1, 552191541, 130906949);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3897, to_date('23-09-2022', 'dd-mm-yyyy'), 5, 8, 298792712);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4619, to_date('31-05-2018', 'dd-mm-yyyy'), 5, 938819453, 787852802);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2213, to_date('08-03-2020', 'dd-mm-yyyy'), 3, 935840799, 149491501);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3319, to_date('10-08-2022', 'dd-mm-yyyy'), 1, 362292428, 721012119);
commit;
prompt 100 records committed...
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7547, to_date('27-03-2020', 'dd-mm-yyyy'), 1, 836348702, 962330174);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (620, to_date('28-11-2018', 'dd-mm-yyyy'), 5, 218295795, 798856860);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8588, to_date('23-11-2019', 'dd-mm-yyyy'), 3, 875284104, 793872119);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1032, to_date('16-06-2019', 'dd-mm-yyyy'), 7, 729109513, 101601397);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3236, to_date('09-06-2020', 'dd-mm-yyyy'), 2, 103136089, 123456789);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7859, to_date('17-03-2019', 'dd-mm-yyyy'), 5, 818787363, 397989285);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8582, to_date('02-03-2020', 'dd-mm-yyyy'), 9, 145384950, 546242151);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4178, to_date('01-06-2023', 'dd-mm-yyyy'), 5, 721838773, 573169589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4891, to_date('04-01-2022', 'dd-mm-yyyy'), 5, 161048354, 783322814);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8786, to_date('02-09-2022', 'dd-mm-yyyy'), 6, 552191541, 15);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7303, to_date('13-12-2021', 'dd-mm-yyyy'), 2, 277455942, 744634308);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6120, to_date('17-01-2021', 'dd-mm-yyyy'), 7, 859662161, 853460347);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7722, to_date('20-02-2018', 'dd-mm-yyyy'), 5, 299967787, 951566280);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4856, to_date('02-02-2024', 'dd-mm-yyyy'), 6, 643989569, 857465480);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6570, to_date('27-02-2023', 'dd-mm-yyyy'), 4, 263933120, 980774607);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2358, to_date('27-12-2019', 'dd-mm-yyyy'), 6, 129018780, 872249982);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2264, to_date('24-06-2019', 'dd-mm-yyyy'), 2, 197227393, 273751555);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8734, to_date('25-11-2022', 'dd-mm-yyyy'), 7, 124880565, 994126989);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5760, to_date('21-12-2022', 'dd-mm-yyyy'), 8, 228002510, 891525851);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4621, to_date('24-04-2022', 'dd-mm-yyyy'), 5, 467555878, 657669208);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4145, to_date('11-04-2018', 'dd-mm-yyyy'), 3, 428081030, 679680071);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6509, to_date('07-02-2018', 'dd-mm-yyyy'), 2, 257844327, 125388019);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6083, to_date('07-03-2019', 'dd-mm-yyyy'), 3, 542907098, 564319391);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4567, to_date('27-08-2021', 'dd-mm-yyyy'), 3, 4, 477394794);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4313, to_date('13-09-2018', 'dd-mm-yyyy'), 5, 299967787, 724025315);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3249, to_date('20-04-2021', 'dd-mm-yyyy'), 5, 561339567, 795835397);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8669, to_date('24-09-2021', 'dd-mm-yyyy'), 9, 9, 179466821);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1583, to_date('31-07-2019', 'dd-mm-yyyy'), 1, 631849990, 783322814);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4801, to_date('06-08-2022', 'dd-mm-yyyy'), 7, 524965504, 279081753);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (459, to_date('24-02-2023', 'dd-mm-yyyy'), 8, 804212216, 822958626);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8006, to_date('22-11-2023', 'dd-mm-yyyy'), 6, 137444356, 970648797);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6640, to_date('25-10-2019', 'dd-mm-yyyy'), 6, 938901812, 13);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4713, to_date('16-11-2021', 'dd-mm-yyyy'), 7, 868375445, 279898030);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5430, to_date('19-06-2023', 'dd-mm-yyyy'), 9, 421262884, 994126989);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2289, to_date('21-06-2021', 'dd-mm-yyyy'), 4, 691755625, 797694929);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7585, to_date('11-04-2018', 'dd-mm-yyyy'), 4, 803780520, 151126233);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8050, to_date('25-04-2018', 'dd-mm-yyyy'), 6, 132169290, 352592593);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5582, to_date('14-07-2018', 'dd-mm-yyyy'), 3, 374349078, 557110167);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8844, to_date('26-04-2018', 'dd-mm-yyyy'), 4, 393036291, 768576074);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8130, to_date('05-04-2021', 'dd-mm-yyyy'), 6, 813641457, 347492168);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2626, to_date('10-07-2022', 'dd-mm-yyyy'), 1, 697718660, 576383177);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3350, to_date('01-08-2020', 'dd-mm-yyyy'), 8, 614431600, 352592593);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3848, to_date('17-12-2021', 'dd-mm-yyyy'), 2, 616910574, 216237124);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5756, to_date('26-02-2023', 'dd-mm-yyyy'), 2, 467941416, 616890176);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3929, to_date('27-12-2023', 'dd-mm-yyyy'), 7, 108897540, 483639945);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4663, to_date('31-01-2019', 'dd-mm-yyyy'), 2, 673035860, 705935024);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1467, to_date('09-02-2022', 'dd-mm-yyyy'), 5, 337725570, 479653978);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7417, to_date('24-02-2024', 'dd-mm-yyyy'), 7, 703867230, 203546832);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1924, to_date('22-11-2021', 'dd-mm-yyyy'), 5, 650638242, 283118474);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7603, to_date('25-08-2019', 'dd-mm-yyyy'), 2, 352842816, 891525851);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (266, to_date('22-03-2023', 'dd-mm-yyyy'), 1, 324274105, 664734015);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6142, to_date('27-06-2022', 'dd-mm-yyyy'), 8, 222833529, 203546832);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7025, to_date('18-12-2021', 'dd-mm-yyyy'), 7, 258121065, 464679908);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4460, to_date('07-03-2022', 'dd-mm-yyyy'), 3, 319362863, 237149146);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7571, to_date('24-01-2018', 'dd-mm-yyyy'), 9, 473309507, 974407742);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4058, to_date('21-01-2020', 'dd-mm-yyyy'), 3, 480311544, 235148144);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2058, to_date('03-10-2021', 'dd-mm-yyyy'), 5, 799220603, 790099134);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3720, to_date('10-07-2019', 'dd-mm-yyyy'), 1, 736426750, 424143766);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7591, to_date('27-07-2021', 'dd-mm-yyyy'), 5, 124880565, 141627986);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (484, to_date('27-12-2023', 'dd-mm-yyyy'), 7, 260972543, 825535316);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (903, to_date('07-02-2021', 'dd-mm-yyyy'), 4, 843168457, 653906682);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (637, to_date('03-07-2022', 'dd-mm-yyyy'), 5, 896331645, 312667361);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8329, to_date('22-12-2022', 'dd-mm-yyyy'), 1, 813641457, 926143716);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8365, to_date('27-01-2022', 'dd-mm-yyyy'), 6, 542907098, 518512882);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7292, to_date('05-03-2019', 'dd-mm-yyyy'), 4, 157834477, 721012119);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5283, to_date('21-09-2022', 'dd-mm-yyyy'), 1, 806862152, 269880341);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1930, to_date('06-10-2023', 'dd-mm-yyyy'), 8, 950467563, 203177232);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4343, to_date('27-07-2020', 'dd-mm-yyyy'), 1, 681343156, 405564635);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7687, to_date('20-11-2018', 'dd-mm-yyyy'), 8, 134272963, 564319391);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7787, to_date('09-01-2024', 'dd-mm-yyyy'), 2, 945279866, 724025315);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4662, to_date('22-07-2022', 'dd-mm-yyyy'), 8, 682390517, 999898886);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4809, to_date('29-09-2022', 'dd-mm-yyyy'), 7, 804079896, 16);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (883, to_date('08-07-2022', 'dd-mm-yyyy'), 3, 584067256, 20);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2999, to_date('18-09-2018', 'dd-mm-yyyy'), 9, 371721560, 123456789);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6704, to_date('02-06-2021', 'dd-mm-yyyy'), 5, 240910785, 869170359);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8545, to_date('30-08-2020', 'dd-mm-yyyy'), 6, 697412816, 14);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6899, to_date('31-03-2023', 'dd-mm-yyyy'), 8, 780026125, 373594668);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3232, to_date('25-06-2023', 'dd-mm-yyyy'), 7, 421988038, 186815840);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2413, to_date('28-08-2020', 'dd-mm-yyyy'), 8, 804079896, 647328070);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2769, to_date('24-12-2022', 'dd-mm-yyyy'), 8, 666319395, 865122099);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8837, to_date('04-03-2018', 'dd-mm-yyyy'), 9, 721838773, 450961899);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5578, to_date('16-02-2022', 'dd-mm-yyyy'), 2, 706217250, 837631502);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6887, to_date('22-12-2021', 'dd-mm-yyyy'), 1, 696875532, 980774607);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (162, to_date('03-03-2021', 'dd-mm-yyyy'), 1, 240910785, 743502274);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6159, to_date('03-09-2018', 'dd-mm-yyyy'), 7, 688306157, 472629040);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7106, to_date('28-02-2023', 'dd-mm-yyyy'), 4, 342543356, 962330174);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2522, to_date('12-02-2023', 'dd-mm-yyyy'), 6, 157834477, 279898030);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5499, to_date('09-11-2022', 'dd-mm-yyyy'), 6, 566176030, 203256363);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3990, to_date('02-09-2022', 'dd-mm-yyyy'), 4, 701966333, 632557658);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3274, to_date('18-05-2018', 'dd-mm-yyyy'), 2, 213288859, 743502274);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1770, to_date('15-09-2020', 'dd-mm-yyyy'), 2, 213783892, 849786859);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8534, to_date('07-05-2019', 'dd-mm-yyyy'), 6, 124217936, 434604261);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5634, to_date('26-02-2024', 'dd-mm-yyyy'), 8, 968299891, 226660644);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5021, to_date('11-08-2021', 'dd-mm-yyyy'), 1, 945180637, 472629040);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5113, to_date('22-05-2020', 'dd-mm-yyyy'), 9, 526605638, 273751555);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4127, to_date('09-04-2019', 'dd-mm-yyyy'), 5, 301747054, 187629959);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6481, to_date('22-04-2021', 'dd-mm-yyyy'), 2, 989150100, 849786859);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5420, to_date('07-12-2021', 'dd-mm-yyyy'), 3, 749939457, 871427453);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (424, to_date('16-11-2022', 'dd-mm-yyyy'), 7, 374349078, 622242527);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7195, to_date('24-08-2018', 'dd-mm-yyyy'), 9, 968495860, 962330174);
commit;
prompt 200 records committed...
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7546, to_date('13-05-2018', 'dd-mm-yyyy'), 6, 8, 496511036);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7008, to_date('17-10-2020', 'dd-mm-yyyy'), 8, 542605612, 999334789);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (784, to_date('30-04-2020', 'dd-mm-yyyy'), 4, 821182940, 344294455);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5600, to_date('13-03-2023', 'dd-mm-yyyy'), 8, 243930676, 685959705);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6750, to_date('12-04-2024', 'dd-mm-yyyy'), 9, 399186364, 373594668);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (630, to_date('26-09-2022', 'dd-mm-yyyy'), 1, 650638242, 12);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4366, to_date('04-10-2019', 'dd-mm-yyyy'), 6, 613268978, 454288381);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1063, to_date('21-02-2022', 'dd-mm-yyyy'), 2, 782002700, 203546832);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8439, to_date('11-11-2020', 'dd-mm-yyyy'), 3, 561339567, 787782944);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2447, to_date('09-01-2024', 'dd-mm-yyyy'), 5, 873385477, 105629063);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2507, to_date('04-01-2022', 'dd-mm-yyyy'), 1, 8, 588365109);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5536, to_date('24-08-2019', 'dd-mm-yyyy'), 6, 989150100, 793125478);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4813, to_date('28-02-2022', 'dd-mm-yyyy'), 1, 125608783, 101601397);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8804, to_date('10-08-2019', 'dd-mm-yyyy'), 5, 161560240, 743499049);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4138, to_date('14-03-2021', 'dd-mm-yyyy'), 1, 742296256, 868430235);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5143, to_date('10-12-2019', 'dd-mm-yyyy'), 6, 403494067, 185749732);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (123, to_date('01-05-2024', 'dd-mm-yyyy'), 1, 245556898, 123456789);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10000, to_date('04-05-2021', 'dd-mm-yyyy'), 1, 503985065, 809275567);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10001, to_date('18-10-2019', 'dd-mm-yyyy'), 2, 691582492, 435549885);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10002, to_date('22-02-2018', 'dd-mm-yyyy'), 3, 913624590, 764601934);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10003, to_date('22-04-2023', 'dd-mm-yyyy'), 2, 9, 474749393);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10004, to_date('02-05-2020', 'dd-mm-yyyy'), 6, 240772731, 616481208);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10005, to_date('18-05-2021', 'dd-mm-yyyy'), 6, 560025062, 550634443);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10006, to_date('18-03-2019', 'dd-mm-yyyy'), 1, 938901812, 158432589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10007, to_date('14-01-2023', 'dd-mm-yyyy'), 6, 598119884, 931841670);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10008, to_date('18-02-2022', 'dd-mm-yyyy'), 6, 736690718, 999334789);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10009, to_date('24-06-2019', 'dd-mm-yyyy'), 6, 255266167, 302453160);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10010, to_date('19-09-2022', 'dd-mm-yyyy'), 5, 624502369, 735201166);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10011, to_date('14-05-2022', 'dd-mm-yyyy'), 2, 455900063, 206835352);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10012, to_date('20-11-2020', 'dd-mm-yyyy'), 7, 306366983, 763759293);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10013, to_date('02-01-2024', 'dd-mm-yyyy'), 3, 802288035, 787782944);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10014, to_date('13-07-2022', 'dd-mm-yyyy'), 6, 873385477, 616890176);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10015, to_date('31-05-2020', 'dd-mm-yyyy'), 7, 673479105, 631808469);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10016, to_date('01-09-2018', 'dd-mm-yyyy'), 2, 788254160, 315600338);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10017, to_date('24-05-2020', 'dd-mm-yyyy'), 6, 134230339, 261877320);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10018, to_date('14-03-2021', 'dd-mm-yyyy'), 4, 778703444, 390394008);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10019, to_date('21-04-2021', 'dd-mm-yyyy'), 3, 789041031, 116131515);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10020, to_date('04-06-2020', 'dd-mm-yyyy'), 6, 616910574, 479653978);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10021, to_date('17-02-2022', 'dd-mm-yyyy'), 2, 968495860, 356792142);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10022, to_date('12-05-2018', 'dd-mm-yyyy'), 2, 780229275, 629885540);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10023, to_date('10-07-2022', 'dd-mm-yyyy'), 3, 563088236, 16);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10024, to_date('17-05-2022', 'dd-mm-yyyy'), 7, 834541158, 805966662);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10025, to_date('15-08-2020', 'dd-mm-yyyy'), 3, 584001587, 809570703);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10026, to_date('04-05-2018', 'dd-mm-yyyy'), 1, 729109513, 396638853);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10027, to_date('14-07-2022', 'dd-mm-yyyy'), 6, 362292428, 240131835);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10028, to_date('11-08-2019', 'dd-mm-yyyy'), 1, 515593162, 891525851);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10029, to_date('28-06-2018', 'dd-mm-yyyy'), 7, 470027926, 660898968);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10030, to_date('10-07-2018', 'dd-mm-yyyy'), 6, 457979501, 557110167);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10031, to_date('29-12-2021', 'dd-mm-yyyy'), 4, 266263726, 852132031);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10032, to_date('19-02-2020', 'dd-mm-yyyy'), 7, 606415760, 108686577);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10033, to_date('06-05-2024', 'dd-mm-yyyy'), 1, 688306157, 765071785);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10034, to_date('26-05-2023', 'dd-mm-yyyy'), 6, 331947476, 358365099);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10035, to_date('14-07-2018', 'dd-mm-yyyy'), 3, 483436747, 285010258);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10036, to_date('30-05-2020', 'dd-mm-yyyy'), 6, 390851039, 543316031);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10037, to_date('05-12-2021', 'dd-mm-yyyy'), 5, 416008888, 273751555);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10038, to_date('05-02-2020', 'dd-mm-yyyy'), 6, 237823390, 698726616);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10039, to_date('14-10-2020', 'dd-mm-yyyy'), 2, 186952282, 294705447);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10040, to_date('20-05-2019', 'dd-mm-yyyy'), 3, 669676531, 19);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10041, to_date('14-08-2022', 'dd-mm-yyyy'), 2, 389914550, 901756155);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10042, to_date('28-01-2018', 'dd-mm-yyyy'), 7, 895518662, 758032935);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10043, to_date('11-12-2023', 'dd-mm-yyyy'), 4, 943740069, 573169589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10044, to_date('09-09-2019', 'dd-mm-yyyy'), 7, 724905945, 279081753);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10045, to_date('30-09-2021', 'dd-mm-yyyy'), 5, 834541158, 787852802);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10046, to_date('05-04-2018', 'dd-mm-yyyy'), 6, 10, 272550574);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10047, to_date('07-10-2023', 'dd-mm-yyyy'), 6, 919967767, 271195493);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10048, to_date('10-06-2022', 'dd-mm-yyyy'), 5, 850155210, 130906949);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10049, to_date('12-01-2019', 'dd-mm-yyyy'), 2, 325625541, 323135648);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10050, to_date('25-08-2020', 'dd-mm-yyyy'), 1, 584001587, 931865584);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10051, to_date('24-03-2024', 'dd-mm-yyyy'), 3, 955098908, 133365860);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10052, to_date('06-01-2022', 'dd-mm-yyyy'), 3, 232836791, 344294455);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10053, to_date('13-10-2019', 'dd-mm-yyyy'), 4, 794558299, 113027456);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10054, to_date('12-02-2019', 'dd-mm-yyyy'), 7, 560025062, 266398616);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10055, to_date('16-06-2019', 'dd-mm-yyyy'), 5, 696875532, 283118474);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10056, to_date('05-02-2020', 'dd-mm-yyyy'), 5, 192749622, 893698379);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10057, to_date('13-04-2023', 'dd-mm-yyyy'), 6, 129018780, 15);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10058, to_date('04-11-2021', 'dd-mm-yyyy'), 3, 790547437, 279081753);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10059, to_date('06-08-2020', 'dd-mm-yyyy'), 3, 942723809, 464008405);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10060, to_date('11-06-2020', 'dd-mm-yyyy'), 7, 417183880, 467290523);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10061, to_date('24-12-2023', 'dd-mm-yyyy'), 7, 913624590, 125388019);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10062, to_date('15-06-2020', 'dd-mm-yyyy'), 6, 736426750, 633178649);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10063, to_date('15-07-2018', 'dd-mm-yyyy'), 4, 729109513, 538765227);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10064, to_date('12-09-2023', 'dd-mm-yyyy'), 7, 393036291, 653906682);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10065, to_date('09-02-2019', 'dd-mm-yyyy'), 5, 123456789, 417890599);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10066, to_date('19-04-2023', 'dd-mm-yyyy'), 3, 804079896, 768576074);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10067, to_date('31-07-2023', 'dd-mm-yyyy'), 7, 673479105, 869630705);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10068, to_date('25-02-2022', 'dd-mm-yyyy'), 6, 103136089, 692167351);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10069, to_date('25-09-2022', 'dd-mm-yyyy'), 2, 736426750, 896388336);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10070, to_date('24-02-2018', 'dd-mm-yyyy'), 4, 448016271, 309276586);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10071, to_date('04-10-2021', 'dd-mm-yyyy'), 2, 767948216, 867644454);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10072, to_date('23-03-2020', 'dd-mm-yyyy'), 4, 609825545, 793872119);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10073, to_date('10-01-2022', 'dd-mm-yyyy'), 3, 513484972, 802206576);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10074, to_date('03-05-2018', 'dd-mm-yyyy'), 3, 399186364, 547452879);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10075, to_date('10-12-2020', 'dd-mm-yyyy'), 1, 243930676, 298792712);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10076, to_date('19-10-2022', 'dd-mm-yyyy'), 7, 974845127, 481889344);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10077, to_date('24-05-2023', 'dd-mm-yyyy'), 4, 669392193, 809275567);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10078, to_date('05-01-2019', 'dd-mm-yyyy'), 7, 780229275, 931841670);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10079, to_date('15-12-2019', 'dd-mm-yyyy'), 7, 799220603, 742845569);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10080, to_date('17-08-2023', 'dd-mm-yyyy'), 5, 895518662, 269249560);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10081, to_date('03-08-2021', 'dd-mm-yyyy'), 1, 352081244, 799059898);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10082, to_date('15-01-2024', 'dd-mm-yyyy'), 7, 706361513, 537175010);
commit;
prompt 300 records committed...
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10083, to_date('12-08-2022', 'dd-mm-yyyy'), 6, 973406121, 201113379);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10084, to_date('04-05-2019', 'dd-mm-yyyy'), 2, 210106163, 686967036);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10085, to_date('04-03-2020', 'dd-mm-yyyy'), 4, 804079896, 146785613);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10086, to_date('11-07-2021', 'dd-mm-yyyy'), 1, 725086744, 281955267);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10087, to_date('10-09-2019', 'dd-mm-yyyy'), 4, 263933120, 266398616);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10088, to_date('29-06-2023', 'dd-mm-yyyy'), 5, 561339567, 294705447);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10089, to_date('17-11-2019', 'dd-mm-yyyy'), 6, 545448531, 129939954);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10090, to_date('05-07-2023', 'dd-mm-yyyy'), 4, 740249479, 553780623);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10091, to_date('08-03-2022', 'dd-mm-yyyy'), 4, 799220603, 722387738);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10092, to_date('11-11-2022', 'dd-mm-yyyy'), 6, 507799270, 536542194);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10093, to_date('24-10-2019', 'dd-mm-yyyy'), 7, 362292428, 405518744);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10094, to_date('09-04-2022', 'dd-mm-yyyy'), 6, 671146058, 701492410);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10095, to_date('11-01-2024', 'dd-mm-yyyy'), 3, 669392193, 123456789);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10096, to_date('19-07-2023', 'dd-mm-yyyy'), 5, 701966333, 607253067);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10097, to_date('03-09-2018', 'dd-mm-yyyy'), 3, 697081561, 530943900);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10098, to_date('08-08-2023', 'dd-mm-yyyy'), 4, 950467563, 323135648);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10099, to_date('23-07-2022', 'dd-mm-yyyy'), 7, 741906391, 764601934);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10100, to_date('07-02-2020', 'dd-mm-yyyy'), 4, 950783774, 641478703);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10101, to_date('05-05-2022', 'dd-mm-yyyy'), 3, 968299891, 284127270);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10102, to_date('05-05-2022', 'dd-mm-yyyy'), 2, 613268978, 718109763);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10103, to_date('09-09-2019', 'dd-mm-yyyy'), 5, 155852248, 685959705);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10104, to_date('27-05-2022', 'dd-mm-yyyy'), 2, 736426750, 294357585);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10105, to_date('16-06-2019', 'dd-mm-yyyy'), 3, 444657296, 113027456);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10106, to_date('06-11-2022', 'dd-mm-yyyy'), 2, 449457599, 435549885);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10107, to_date('20-02-2023', 'dd-mm-yyyy'), 6, 258121065, 720668684);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10108, to_date('06-05-2018', 'dd-mm-yyyy'), 5, 803138572, 998226308);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10109, to_date('27-01-2021', 'dd-mm-yyyy'), 5, 549769099, 550634443);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10110, to_date('05-12-2020', 'dd-mm-yyyy'), 2, 155852248, 588365109);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10111, to_date('16-12-2021', 'dd-mm-yyyy'), 5, 887596245, 105083788);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10112, to_date('21-12-2019', 'dd-mm-yyyy'), 4, 157834477, 765071785);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10113, to_date('29-05-2023', 'dd-mm-yyyy'), 6, 974824879, 857481927);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10114, to_date('20-04-2024', 'dd-mm-yyyy'), 5, 703867230, 397989285);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10115, to_date('26-10-2019', 'dd-mm-yyyy'), 3, 936794880, 701492410);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10116, to_date('03-10-2019', 'dd-mm-yyyy'), 2, 265517964, 135138235);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10117, to_date('05-11-2021', 'dd-mm-yyyy'), 7, 429620988, 203546832);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10118, to_date('22-09-2021', 'dd-mm-yyyy'), 6, 399186364, 522749150);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10119, to_date('17-05-2023', 'dd-mm-yyyy'), 7, 725731892, 865122099);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10120, to_date('20-11-2023', 'dd-mm-yyyy'), 6, 299448259, 891525851);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10121, to_date('30-07-2018', 'dd-mm-yyyy'), 1, 673035860, 168396581);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10122, to_date('08-09-2022', 'dd-mm-yyyy'), 6, 5, 587229426);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10123, to_date('23-03-2024', 'dd-mm-yyyy'), 1, 987564231, 444849375);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10124, to_date('24-05-2021', 'dd-mm-yyyy'), 2, 482275465, 675032366);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10125, to_date('14-10-2023', 'dd-mm-yyyy'), 6, 950783774, 273530645);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10126, to_date('11-02-2020', 'dd-mm-yyyy'), 7, 161560240, 580938331);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10127, to_date('17-05-2019', 'dd-mm-yyyy'), 3, 584001587, 426628857);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10128, to_date('04-11-2023', 'dd-mm-yyyy'), 4, 787347918, 949015324);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10129, to_date('16-05-2018', 'dd-mm-yyyy'), 6, 420639562, 323231267);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10130, to_date('28-08-2023', 'dd-mm-yyyy'), 4, 236750514, 310053477);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10131, to_date('29-10-2018', 'dd-mm-yyyy'), 5, 799220603, 323135648);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10132, to_date('15-08-2021', 'dd-mm-yyyy'), 6, 825936905, 893305971);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10133, to_date('21-04-2019', 'dd-mm-yyyy'), 6, 473309507, 919317998);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10134, to_date('26-05-2022', 'dd-mm-yyyy'), 7, 682390517, 768576074);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10135, to_date('21-02-2021', 'dd-mm-yyyy'), 7, 697412816, 646542153);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10136, to_date('29-08-2023', 'dd-mm-yyyy'), 1, 397502047, 573169589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10137, to_date('27-01-2023', 'dd-mm-yyyy'), 4, 961019140, 902025228);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10138, to_date('17-02-2018', 'dd-mm-yyyy'), 2, 561339567, 692167351);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10139, to_date('21-01-2021', 'dd-mm-yyyy'), 1, 155852248, 331752778);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10140, to_date('08-02-2020', 'dd-mm-yyyy'), 1, 886879923, 427762437);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10141, to_date('01-10-2019', 'dd-mm-yyyy'), 1, 775383331, 675032366);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10142, to_date('24-02-2020', 'dd-mm-yyyy'), 4, 930733425, 893698379);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10143, to_date('07-07-2023', 'dd-mm-yyyy'), 7, 778296365, 158432589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10144, to_date('18-01-2022', 'dd-mm-yyyy'), 5, 689650907, 744634308);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10145, to_date('29-10-2019', 'dd-mm-yyyy'), 6, 216899652, 672385701);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10146, to_date('13-10-2020', 'dd-mm-yyyy'), 4, 968495860, 824395243);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10147, to_date('14-03-2019', 'dd-mm-yyyy'), 4, 875284104, 168396581);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10148, to_date('21-03-2024', 'dd-mm-yyyy'), 1, 155852248, 179466821);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10149, to_date('08-05-2023', 'dd-mm-yyyy'), 5, 794558299, 892790074);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10150, to_date('10-04-2022', 'dd-mm-yyyy'), 7, 428081030, 809570703);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10151, to_date('28-03-2024', 'dd-mm-yyyy'), 2, 782002700, 141627986);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10152, to_date('10-01-2019', 'dd-mm-yyyy'), 6, 584067256, 874815954);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10153, to_date('18-02-2021', 'dd-mm-yyyy'), 5, 421988038, 359530012);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10154, to_date('21-09-2018', 'dd-mm-yyyy'), 7, 143136513, 664734015);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10155, to_date('03-09-2023', 'dd-mm-yyyy'), 4, 631849990, 14);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10156, to_date('31-05-2023', 'dd-mm-yyyy'), 1, 103136089, 452498810);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10157, to_date('12-08-2021', 'dd-mm-yyyy'), 2, 249341091, 323271094);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10158, to_date('15-12-2022', 'dd-mm-yyyy'), 2, 125608783, 113027456);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10159, to_date('21-12-2023', 'dd-mm-yyyy'), 4, 7, 467290523);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10160, to_date('29-04-2022', 'dd-mm-yyyy'), 6, 859179543, 823304673);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10161, to_date('19-12-2019', 'dd-mm-yyyy'), 1, 945180637, 917429476);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10162, to_date('25-10-2022', 'dd-mm-yyyy'), 1, 917606772, 998226308);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10163, to_date('26-02-2022', 'dd-mm-yyyy'), 6, 937782877, 951147722);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10164, to_date('02-04-2021', 'dd-mm-yyyy'), 2, 447792762, 129939954);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10165, to_date('28-07-2018', 'dd-mm-yyyy'), 4, 467555878, 661309884);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10166, to_date('14-11-2020', 'dd-mm-yyyy'), 4, 648472634, 279898030);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10167, to_date('08-11-2019', 'dd-mm-yyyy'), 7, 181840584, 672385701);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10168, to_date('27-09-2021', 'dd-mm-yyyy'), 1, 649086355, 758032935);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10169, to_date('20-10-2021', 'dd-mm-yyyy'), 4, 123329657, 554530420);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10170, to_date('11-10-2022', 'dd-mm-yyyy'), 5, 218295795, 660898968);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10171, to_date('22-01-2018', 'dd-mm-yyyy'), 4, 930733425, 530943900);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10172, to_date('13-08-2022', 'dd-mm-yyyy'), 5, 938819453, 247415819);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10173, to_date('19-05-2024', 'dd-mm-yyyy'), 4, 782002700, 865122099);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10174, to_date('25-03-2019', 'dd-mm-yyyy'), 7, 295746078, 781797266);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10175, to_date('10-05-2018', 'dd-mm-yyyy'), 7, 1, 871427453);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10176, to_date('10-03-2021', 'dd-mm-yyyy'), 2, 803780520, 272550574);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10177, to_date('05-01-2019', 'dd-mm-yyyy'), 4, 666319395, 427762437);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10178, to_date('01-04-2019', 'dd-mm-yyyy'), 2, 108897540, 201724578);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10179, to_date('11-02-2024', 'dd-mm-yyyy'), 7, 943740069, 877541391);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10180, to_date('08-11-2020', 'dd-mm-yyyy'), 4, 545206449, 356792142);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10181, to_date('26-03-2023', 'dd-mm-yyyy'), 4, 482275465, 992164595);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10182, to_date('25-04-2019', 'dd-mm-yyyy'), 5, 749939457, 908768841);
commit;
prompt 400 records committed...
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10183, to_date('09-06-2022', 'dd-mm-yyyy'), 3, 974824879, 884761221);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10184, to_date('27-06-2019', 'dd-mm-yyyy'), 4, 631161240, 294705447);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10185, to_date('22-11-2022', 'dd-mm-yyyy'), 2, 553370732, 901683660);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10186, to_date('19-10-2023', 'dd-mm-yyyy'), 2, 452049063, 124911743);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10187, to_date('18-11-2023', 'dd-mm-yyyy'), 4, 707625834, 919317998);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10188, to_date('14-06-2023', 'dd-mm-yyyy'), 1, 943740069, 421762580);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10189, to_date('03-04-2018', 'dd-mm-yyyy'), 2, 389436980, 310053477);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10190, to_date('08-07-2020', 'dd-mm-yyyy'), 4, 545448531, 951142488);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10191, to_date('20-09-2018', 'dd-mm-yyyy'), 7, 691755625, 186990480);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10192, to_date('01-03-2023', 'dd-mm-yyyy'), 3, 218295795, 261877320);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10193, to_date('15-10-2018', 'dd-mm-yyyy'), 5, 325511943, 613225413);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10194, to_date('04-06-2020', 'dd-mm-yyyy'), 6, 681611216, 805966662);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10195, to_date('29-01-2023', 'dd-mm-yyyy'), 1, 257844327, 217681825);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10196, to_date('11-12-2019', 'dd-mm-yyyy'), 5, 365095569, 718269705);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10197, to_date('13-09-2018', 'dd-mm-yyyy'), 2, 313753604, 108686577);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10198, to_date('28-04-2020', 'dd-mm-yyyy'), 2, 452049063, 951147722);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10199, to_date('23-05-2022', 'dd-mm-yyyy'), 7, 969810041, 698726616);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10200, to_date('21-10-2020', 'dd-mm-yyyy'), 4, 766023468, 853460347);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10201, to_date('26-10-2023', 'dd-mm-yyyy'), 3, 507799270, 141627986);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10202, to_date('22-04-2023', 'dd-mm-yyyy'), 1, 780229275, 622242527);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10203, to_date('01-12-2023', 'dd-mm-yyyy'), 7, 795240217, 758032935);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10204, to_date('02-06-2020', 'dd-mm-yyyy'), 3, 682390517, 950018081);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10205, to_date('08-09-2020', 'dd-mm-yyyy'), 7, 868910800, 812378169);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10206, to_date('22-09-2020', 'dd-mm-yyyy'), 3, 7, 902342065);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10207, to_date('20-06-2019', 'dd-mm-yyyy'), 6, 260972543, 281724600);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10208, to_date('21-07-2021', 'dd-mm-yyyy'), 3, 780026125, 309276586);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10209, to_date('20-09-2022', 'dd-mm-yyyy'), 1, 311775493, 297428959);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10210, to_date('18-01-2019', 'dd-mm-yyyy'), 1, 365418624, 706525266);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10211, to_date('04-09-2018', 'dd-mm-yyyy'), 2, 253985889, 426628857);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10212, to_date('12-06-2023', 'dd-mm-yyyy'), 3, 181840584, 297428959);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10213, to_date('14-01-2020', 'dd-mm-yyyy'), 4, 637754619, 186990480);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10214, to_date('24-10-2021', 'dd-mm-yyyy'), 5, 501163002, 718269705);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10215, to_date('14-02-2018', 'dd-mm-yyyy'), 3, 919967767, 195571448);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10216, to_date('04-01-2023', 'dd-mm-yyyy'), 2, 654434419, 133365860);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10217, to_date('09-03-2019', 'dd-mm-yyyy'), 7, 859179543, 999334789);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10218, to_date('05-01-2018', 'dd-mm-yyyy'), 3, 491125002, 187629959);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10219, to_date('16-10-2021', 'dd-mm-yyyy'), 5, 429620988, 610922130);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10220, to_date('19-06-2022', 'dd-mm-yyyy'), 1, 895647398, 135138235);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10221, to_date('04-09-2018', 'dd-mm-yyyy'), 5, 729902851, 865122099);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10222, to_date('10-10-2021', 'dd-mm-yyyy'), 7, 393036291, 133365860);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10223, to_date('08-01-2023', 'dd-mm-yyyy'), 5, 128425932, 434604261);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10224, to_date('04-02-2024', 'dd-mm-yyyy'), 7, 808917655, 237149146);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10225, to_date('04-01-2023', 'dd-mm-yyyy'), 6, 249557147, 467290523);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10226, to_date('01-04-2022', 'dd-mm-yyyy'), 6, 825936905, 901756155);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10227, to_date('15-07-2018', 'dd-mm-yyyy'), 1, 706361513, 388100398);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10228, to_date('25-08-2018', 'dd-mm-yyyy'), 6, 372877495, 353012298);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10229, to_date('27-03-2018', 'dd-mm-yyyy'), 1, 397502047, 858595390);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10230, to_date('22-04-2023', 'dd-mm-yyyy'), 5, 973406121, 763379076);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10231, to_date('27-06-2022', 'dd-mm-yyyy'), 7, 861809618, 664734015);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10232, to_date('08-08-2018', 'dd-mm-yyyy'), 6, 968299891, 896388336);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10233, to_date('13-01-2018', 'dd-mm-yyyy'), 5, 999414117, 809275567);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10234, to_date('24-01-2019', 'dd-mm-yyyy'), 7, 817343643, 867861179);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10235, to_date('28-09-2022', 'dd-mm-yyyy'), 6, 797907755, 438687886);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10236, to_date('17-11-2020', 'dd-mm-yyyy'), 6, 778296365, 279898030);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10237, to_date('18-01-2020', 'dd-mm-yyyy'), 2, 452049063, 206835352);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10238, to_date('11-10-2020', 'dd-mm-yyyy'), 7, 260972543, 249732553);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10239, to_date('31-07-2020', 'dd-mm-yyyy'), 5, 942723809, 187629959);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10240, to_date('19-11-2020', 'dd-mm-yyyy'), 3, 736426750, 935844232);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10241, to_date('17-11-2019', 'dd-mm-yyyy'), 1, 896331645, 439584128);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10242, to_date('12-07-2019', 'dd-mm-yyyy'), 5, 327654260, 758032935);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10243, to_date('27-01-2019', 'dd-mm-yyyy'), 7, 722138215, 141627986);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10244, to_date('09-02-2020', 'dd-mm-yyyy'), 2, 697718660, 481889344);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10245, to_date('23-09-2018', 'dd-mm-yyyy'), 3, 688306157, 993308503);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10246, to_date('03-07-2019', 'dd-mm-yyyy'), 2, 455900063, 908768841);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10247, to_date('09-04-2024', 'dd-mm-yyyy'), 5, 236750514, 817051842);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10248, to_date('05-12-2020', 'dd-mm-yyyy'), 3, 817458147, 442952372);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10249, to_date('08-03-2018', 'dd-mm-yyyy'), 1, 365095569, 853460347);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10250, to_date('19-12-2019', 'dd-mm-yyyy'), 5, 681343156, 215332630);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10251, to_date('06-10-2020', 'dd-mm-yyyy'), 4, 729475230, 430642901);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10252, to_date('27-05-2021', 'dd-mm-yyyy'), 5, 627648086, 132840801);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10253, to_date('02-06-2021', 'dd-mm-yyyy'), 3, 721838773, 705935024);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10254, to_date('13-11-2022', 'dd-mm-yyyy'), 4, 626936785, 279898030);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10255, to_date('11-03-2024', 'dd-mm-yyyy'), 7, 789041031, 226660644);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10256, to_date('12-11-2022', 'dd-mm-yyyy'), 3, 197227393, 825535316);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10257, to_date('22-07-2021', 'dd-mm-yyyy'), 1, 560025062, 705935024);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10258, to_date('22-03-2021', 'dd-mm-yyyy'), 6, 945279866, 707348055);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10259, to_date('19-04-2018', 'dd-mm-yyyy'), 3, 554015100, 926143716);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10260, to_date('27-04-2018', 'dd-mm-yyyy'), 3, 197764210, 533663538);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10261, to_date('18-02-2022', 'dd-mm-yyyy'), 6, 950783774, 718109763);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10262, to_date('18-07-2019', 'dd-mm-yyyy'), 2, 371721560, 391698835);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10263, to_date('16-04-2020', 'dd-mm-yyyy'), 1, 429620988, 481889344);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10264, to_date('16-04-2019', 'dd-mm-yyyy'), 7, 545992521, 11);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10265, to_date('17-01-2019', 'dd-mm-yyyy'), 6, 592869436, 799059898);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10266, to_date('27-03-2022', 'dd-mm-yyyy'), 6, 800709965, 744634308);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10267, to_date('21-04-2024', 'dd-mm-yyyy'), 5, 7, 970648797);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10268, to_date('15-07-2018', 'dd-mm-yyyy'), 5, 960372598, 610922130);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10269, to_date('01-01-2021', 'dd-mm-yyyy'), 2, 701966333, 660898968);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10270, to_date('12-12-2021', 'dd-mm-yyyy'), 5, 754327619, 439584128);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10271, to_date('05-11-2021', 'dd-mm-yyyy'), 4, 800709965, 536542194);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10272, to_date('06-05-2023', 'dd-mm-yyyy'), 5, 912201109, 323231267);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10273, to_date('25-08-2018', 'dd-mm-yyyy'), 5, 420763488, 20);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10274, to_date('14-01-2020', 'dd-mm-yyyy'), 4, 452049063, 610922130);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10275, to_date('01-04-2022', 'dd-mm-yyyy'), 7, 623232154, 442952372);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10276, to_date('19-03-2018', 'dd-mm-yyyy'), 7, 887596245, 538765227);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10277, to_date('06-04-2024', 'dd-mm-yyyy'), 1, 936794880, 302453160);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10278, to_date('06-05-2021', 'dd-mm-yyyy'), 2, 639109815, 427762437);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10279, to_date('16-10-2021', 'dd-mm-yyyy'), 1, 362292428, 799059898);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10280, to_date('26-10-2023', 'dd-mm-yyyy'), 2, 510440272, 347492168);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10281, to_date('23-08-2021', 'dd-mm-yyyy'), 3, 703141922, 560553396);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10282, to_date('02-08-2022', 'dd-mm-yyyy'), 5, 553370732, 474749393);
commit;
prompt 500 records committed...
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10283, to_date('27-02-2024', 'dd-mm-yyyy'), 7, 807905294, 828480722);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10284, to_date('22-03-2021', 'dd-mm-yyyy'), 5, 741906391, 911440098);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10285, to_date('14-08-2018', 'dd-mm-yyyy'), 1, 647758895, 481889344);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10286, to_date('09-12-2019', 'dd-mm-yyyy'), 7, 245556898, 269249560);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10287, to_date('20-05-2022', 'dd-mm-yyyy'), 7, 503985065, 417955120);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10288, to_date('21-08-2023', 'dd-mm-yyyy'), 1, 291414436, 195571448);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10289, to_date('06-08-2022', 'dd-mm-yyyy'), 6, 134230339, 518512882);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10290, to_date('08-02-2023', 'dd-mm-yyyy'), 3, 491125002, 456387075);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10291, to_date('24-04-2019', 'dd-mm-yyyy'), 4, 724905945, 388100398);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10292, to_date('28-11-2019', 'dd-mm-yyyy'), 2, 491125002, 822958626);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10293, to_date('13-07-2022', 'dd-mm-yyyy'), 2, 526605638, 318062617);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10294, to_date('04-01-2018', 'dd-mm-yyyy'), 5, 429620988, 660898968);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10295, to_date('17-05-2022', 'dd-mm-yyyy'), 4, 131740753, 135138235);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10296, to_date('10-08-2020', 'dd-mm-yyyy'), 2, 558097639, 269880341);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10297, to_date('09-03-2022', 'dd-mm-yyyy'), 7, 938459826, 294357585);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10298, to_date('01-05-2019', 'dd-mm-yyyy'), 1, 216899652, 533663538);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10299, to_date('20-02-2019', 'dd-mm-yyyy'), 2, 581317488, 867644454);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10300, to_date('02-10-2020', 'dd-mm-yyyy'), 7, 974845127, 573169589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10301, to_date('06-02-2022', 'dd-mm-yyyy'), 6, 122807530, 893305971);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10302, to_date('14-05-2020', 'dd-mm-yyyy'), 3, 669392193, 390394008);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10303, to_date('01-06-2023', 'dd-mm-yyyy'), 4, 445212798, 315556965);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10304, to_date('04-04-2020', 'dd-mm-yyyy'), 2, 566221274, 397924247);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10305, to_date('15-10-2020', 'dd-mm-yyyy'), 3, 545992521, 345128351);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10306, to_date('03-12-2019', 'dd-mm-yyyy'), 1, 196581216, 569717639);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10307, to_date('24-09-2018', 'dd-mm-yyyy'), 4, 896331645, 809275567);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10308, to_date('17-09-2018', 'dd-mm-yyyy'), 2, 542435161, 949015324);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10309, to_date('14-05-2022', 'dd-mm-yyyy'), 3, 744166842, 633178649);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10310, to_date('28-06-2023', 'dd-mm-yyyy'), 5, 999414117, 919317998);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10311, to_date('30-08-2023', 'dd-mm-yyyy'), 6, 944607210, 999898886);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10312, to_date('02-01-2023', 'dd-mm-yyyy'), 5, 696875532, 854266943);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10313, to_date('27-06-2018', 'dd-mm-yyyy'), 6, 788384990, 352592593);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10314, to_date('22-10-2018', 'dd-mm-yyyy'), 7, 501163002, 334753703);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10315, to_date('01-07-2022', 'dd-mm-yyyy'), 2, 778703444, 302453160);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10316, to_date('13-11-2022', 'dd-mm-yyyy'), 6, 124217936, 217681825);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10317, to_date('25-08-2021', 'dd-mm-yyyy'), 7, 780428506, 878615316);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10318, to_date('14-12-2021', 'dd-mm-yyyy'), 5, 160970769, 849786859);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10319, to_date('29-02-2024', 'dd-mm-yyyy'), 5, 636694801, 949015324);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10320, to_date('25-02-2024', 'dd-mm-yyyy'), 3, 448016271, 275220702);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10321, to_date('20-06-2021', 'dd-mm-yyyy'), 1, 725769483, 101601397);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10322, to_date('31-10-2020', 'dd-mm-yyyy'), 6, 775383331, 467953577);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10323, to_date('08-07-2018', 'dd-mm-yyyy'), 3, 457979501, 17);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10324, to_date('14-05-2024', 'dd-mm-yyyy'), 7, 955098908, 797728760);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10325, to_date('21-05-2024', 'dd-mm-yyyy'), 2, 245556898, 334753703);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10326, to_date('06-04-2021', 'dd-mm-yyyy'), 1, 164240019, 417509944);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10327, to_date('19-06-2022', 'dd-mm-yyyy'), 3, 584001587, 450862672);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10328, to_date('21-04-2020', 'dd-mm-yyyy'), 1, 278575869, 571324275);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10329, to_date('17-10-2022', 'dd-mm-yyyy'), 4, 969810041, 421762580);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10330, to_date('14-07-2022', 'dd-mm-yyyy'), 4, 352842816, 530943900);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10331, to_date('06-06-2023', 'dd-mm-yyyy'), 2, 473309507, 488127037);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10332, to_date('26-01-2022', 'dd-mm-yyyy'), 1, 567842670, 734090667);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10333, to_date('21-11-2021', 'dd-mm-yyyy'), 6, 821182940, 647328070);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10334, to_date('07-08-2018', 'dd-mm-yyyy'), 1, 799220603, 857481927);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10335, to_date('10-01-2019', 'dd-mm-yyyy'), 7, 313753604, 420797123);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10336, to_date('16-03-2022', 'dd-mm-yyyy'), 4, 780026125, 273530645);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10337, to_date('22-08-2021', 'dd-mm-yyyy'), 5, 192504260, 450961899);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10338, to_date('15-07-2018', 'dd-mm-yyyy'), 7, 913624590, 917429476);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10339, to_date('16-04-2018', 'dd-mm-yyyy'), 4, 745045181, 658378872);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10340, to_date('23-07-2022', 'dd-mm-yyyy'), 7, 197764210, 359530012);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10341, to_date('28-05-2024', 'dd-mm-yyyy'), 2, 510440272, 742083164);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10342, to_date('27-01-2022', 'dd-mm-yyyy'), 4, 598119884, 358365099);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10343, to_date('14-08-2023', 'dd-mm-yyyy'), 1, 681611216, 456387075);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10344, to_date('26-08-2022', 'dd-mm-yyyy'), 3, 721838773, 11);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10345, to_date('20-04-2023', 'dd-mm-yyyy'), 7, 545448531, 390394008);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10346, to_date('22-10-2020', 'dd-mm-yyyy'), 7, 943647325, 15);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10347, to_date('21-02-2019', 'dd-mm-yyyy'), 2, 669597925, 217681825);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10348, to_date('19-11-2020', 'dd-mm-yyyy'), 6, 291414436, 416244260);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10349, to_date('23-08-2022', 'dd-mm-yyyy'), 4, 584001587, 622242527);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10350, to_date('23-08-2018', 'dd-mm-yyyy'), 2, 313753604, 872249982);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10351, to_date('06-04-2023', 'dd-mm-yyyy'), 2, 834541158, 828480722);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10352, to_date('26-02-2022', 'dd-mm-yyyy'), 3, 793265229, 158432589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10353, to_date('05-12-2019', 'dd-mm-yyyy'), 5, 325511943, 533663538);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10354, to_date('02-03-2020', 'dd-mm-yyyy'), 6, 437393325, 15);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10355, to_date('09-04-2019', 'dd-mm-yyyy'), 2, 701966333, 430642901);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10356, to_date('27-10-2019', 'dd-mm-yyyy'), 3, 473309507, 951142488);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10357, to_date('01-11-2019', 'dd-mm-yyyy'), 5, 515593162, 444849375);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10358, to_date('10-01-2019', 'dd-mm-yyyy'), 3, 540858162, 417955120);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10359, to_date('19-09-2020', 'dd-mm-yyyy'), 6, 428081030, 439584128);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10360, to_date('17-07-2022', 'dd-mm-yyyy'), 4, 868375445, 137920011);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10361, to_date('17-08-2022', 'dd-mm-yyyy'), 7, 583202281, 397989285);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10362, to_date('12-05-2018', 'dd-mm-yyyy'), 2, 780026125, 16);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10363, to_date('14-04-2021', 'dd-mm-yyyy'), 1, 788254160, 307647370);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10364, to_date('10-06-2023', 'dd-mm-yyyy'), 1, 337725570, 629885540);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10365, to_date('01-12-2018', 'dd-mm-yyyy'), 1, 452049063, 524045728);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10366, to_date('14-03-2019', 'dd-mm-yyyy'), 7, 281153050, 678043802);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10367, to_date('27-08-2021', 'dd-mm-yyyy'), 5, 121281852, 768576074);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10368, to_date('07-07-2020', 'dd-mm-yyyy'), 4, 859662161, 902025228);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10369, to_date('15-12-2022', 'dd-mm-yyyy'), 5, 140924331, 570809177);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10370, to_date('21-08-2021', 'dd-mm-yyyy'), 3, 278575869, 17);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10371, to_date('14-04-2024', 'dd-mm-yyyy'), 4, 265517964, 417955120);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10372, to_date('15-04-2024', 'dd-mm-yyyy'), 4, 609825545, 271195493);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10373, to_date('09-07-2022', 'dd-mm-yyyy'), 4, 431716178, 302453160);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10374, to_date('27-08-2019', 'dd-mm-yyyy'), 5, 277455942, 424143766);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10375, to_date('22-10-2021', 'dd-mm-yyyy'), 7, 6, 962330174);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10376, to_date('01-07-2020', 'dd-mm-yyyy'), 2, 780229275, 911440098);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10377, to_date('03-08-2018', 'dd-mm-yyyy'), 1, 636694801, 849786859);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10378, to_date('10-07-2021', 'dd-mm-yyyy'), 1, 538844626, 908768841);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10379, to_date('12-11-2023', 'dd-mm-yyyy'), 3, 563088236, 951566280);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10380, to_date('20-08-2022', 'dd-mm-yyyy'), 3, 7, 136534555);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10381, to_date('24-02-2020', 'dd-mm-yyyy'), 7, 278575869, 323271094);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10382, to_date('23-12-2018', 'dd-mm-yyyy'), 7, 704314082, 215332630);
commit;
prompt 600 records committed...
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10383, to_date('01-11-2019', 'dd-mm-yyyy'), 6, 787347918, 901683660);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10384, to_date('23-10-2021', 'dd-mm-yyyy'), 3, 681611216, 871427453);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10385, to_date('22-09-2019', 'dd-mm-yyyy'), 6, 637754619, 132218533);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10386, to_date('17-06-2020', 'dd-mm-yyyy'), 5, 775383331, 493444601);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10387, to_date('09-07-2018', 'dd-mm-yyyy'), 7, 639109815, 884761221);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10388, to_date('18-01-2020', 'dd-mm-yyyy'), 2, 566221274, 911440098);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (10389, to_date('01-04-2020', 'dd-mm-yyyy'), 3, 654434419, 352592593);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (456, to_date('02-05-2024', 'dd-mm-yyyy'), 2, 544125895, 323564871);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (321, to_date('01-05-2024', 'dd-mm-yyyy'), 2, 245556898, 323564871);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (897, to_date('20-04-2021', 'dd-mm-yyyy'), 4, 778296365, 661309884);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6772, to_date('30-03-2018', 'dd-mm-yyyy'), 6, 134272963, 902025228);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2429, to_date('04-06-2020', 'dd-mm-yyyy'), 3, 9, 911440098);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3932, to_date('22-03-2024', 'dd-mm-yyyy'), 3, 365095569, 884761221);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5585, to_date('14-05-2020', 'dd-mm-yyyy'), 2, 507799270, 979765409);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2388, to_date('14-10-2018', 'dd-mm-yyyy'), 8, 124217936, 793125478);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7584, to_date('03-11-2022', 'dd-mm-yyyy'), 9, 501163002, 917429476);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3757, to_date('22-11-2021', 'dd-mm-yyyy'), 6, 236750514, 951566280);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2526, to_date('17-09-2019', 'dd-mm-yyyy'), 7, 691582492, 980774607);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4163, to_date('10-02-2024', 'dd-mm-yyyy'), 6, 895518662, 310053477);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4881, to_date('19-10-2022', 'dd-mm-yyyy'), 2, 716892768, 353012298);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1386, to_date('24-03-2018', 'dd-mm-yyyy'), 8, 673035860, 125388019);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5858, to_date('26-04-2024', 'dd-mm-yyyy'), 7, 945180637, 228296234);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1944, to_date('07-06-2023', 'dd-mm-yyyy'), 3, 584051995, 817051842);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6021, to_date('19-02-2020', 'dd-mm-yyyy'), 5, 371721560, 881996190);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5381, to_date('19-11-2023', 'dd-mm-yyyy'), 6, 524965504, 812378169);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8712, to_date('01-05-2021', 'dd-mm-yyyy'), 4, 319362863, 805966662);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2099, to_date('31-10-2018', 'dd-mm-yyyy'), 4, 701966333, 424494863);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2557, to_date('01-11-2018', 'dd-mm-yyyy'), 1, 950467563, 817519630);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8539, to_date('05-03-2020', 'dd-mm-yyyy'), 9, 145384950, 323231267);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8751, to_date('08-03-2019', 'dd-mm-yyyy'), 8, 740249479, 896388336);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1045, to_date('21-09-2021', 'dd-mm-yyyy'), 3, 6, 999898886);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1738, to_date('15-08-2022', 'dd-mm-yyyy'), 2, 202719248, 405518744);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6059, to_date('07-02-2023', 'dd-mm-yyyy'), 9, 455838725, 294357585);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3776, to_date('14-10-2018', 'dd-mm-yyyy'), 4, 480311544, 990981562);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8344, to_date('03-04-2020', 'dd-mm-yyyy'), 3, 643989569, 691039126);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (158, to_date('02-06-2021', 'dd-mm-yyyy'), 3, 874705561, 809275567);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1843, to_date('24-09-2021', 'dd-mm-yyyy'), 4, 245556898, 496511036);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2982, to_date('25-11-2023', 'dd-mm-yyyy'), 9, 393036291, 990981562);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8503, to_date('21-07-2018', 'dd-mm-yyyy'), 1, 186952282, 275220702);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4638, to_date('17-11-2022', 'dd-mm-yyyy'), 9, 390851039, 15);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (745, to_date('06-08-2021', 'dd-mm-yyyy'), 1, 181840584, 868010190);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8715, to_date('27-02-2019', 'dd-mm-yyyy'), 6, 134230339, 701492410);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1124, to_date('30-03-2022', 'dd-mm-yyyy'), 4, 729475230, 450862672);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1774, to_date('25-03-2019', 'dd-mm-yyyy'), 6, 426285667, 505193395);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1343, to_date('06-02-2023', 'dd-mm-yyyy'), 3, 3, 307647370);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3346, to_date('05-10-2021', 'dd-mm-yyyy'), 4, 253985889, 472629040);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3724, to_date('24-02-2024', 'dd-mm-yyyy'), 5, 795240217, 571324275);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4929, to_date('30-06-2021', 'dd-mm-yyyy'), 4, 813641457, 310053477);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7516, to_date('14-09-2022', 'dd-mm-yyyy'), 4, 821182940, 587229426);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5996, to_date('19-04-2019', 'dd-mm-yyyy'), 2, 789041031, 467953577);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (944, to_date('03-05-2021', 'dd-mm-yyyy'), 7, 722138215, 993308503);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1616, to_date('18-06-2023', 'dd-mm-yyyy'), 6, 961019140, 478812574);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3573, to_date('16-12-2023', 'dd-mm-yyyy'), 7, 192504260, 524045728);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5394, to_date('08-04-2019', 'dd-mm-yyyy'), 9, 365418624, 678043802);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4130, to_date('30-04-2019', 'dd-mm-yyyy'), 7, 599264563, 481889344);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (299, to_date('11-05-2022', 'dd-mm-yyyy'), 9, 950783774, 901756155);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (194, to_date('05-06-2021', 'dd-mm-yyyy'), 6, 584001587, 998226308);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4595, to_date('27-07-2020', 'dd-mm-yyyy'), 2, 452049063, 580938331);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4734, to_date('04-05-2019', 'dd-mm-yyyy'), 8, 875284104, 793872119);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4008, to_date('14-08-2019', 'dd-mm-yyyy'), 8, 722138215, 588365109);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2490, to_date('20-04-2018', 'dd-mm-yyyy'), 4, 128425932, 358365099);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6073, to_date('07-05-2020', 'dd-mm-yyyy'), 3, 389665892, 427762437);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7765, to_date('18-02-2018', 'dd-mm-yyyy'), 9, 526605638, 298792712);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7439, to_date('08-11-2022', 'dd-mm-yyyy'), 7, 448016271, 388100398);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2967, to_date('11-04-2018', 'dd-mm-yyyy'), 6, 682390517, 809275567);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8271, to_date('31-07-2023', 'dd-mm-yyyy'), 9, 436250931, 294705447);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4400, to_date('07-08-2019', 'dd-mm-yyyy'), 6, 732884302, 613225413);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (698, to_date('12-06-2020', 'dd-mm-yyyy'), 1, 467941416, 893698379);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6492, to_date('15-09-2023', 'dd-mm-yyyy'), 1, 470027926, 323564871);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3226, to_date('17-03-2020', 'dd-mm-yyyy'), 9, 637754619, 105989920);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (696, to_date('27-09-2023', 'dd-mm-yyyy'), 8, 598119884, 871427453);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7555, to_date('26-03-2022', 'dd-mm-yyyy'), 7, 851779666, 857465480);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4425, to_date('03-02-2020', 'dd-mm-yyyy'), 1, 444657296, 237149146);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1480, to_date('30-01-2022', 'dd-mm-yyyy'), 7, 673479105, 882392837);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8810, to_date('03-02-2023', 'dd-mm-yyyy'), 8, 736690718, 658378872);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2594, to_date('12-10-2022', 'dd-mm-yyyy'), 2, 629940780, 493444601);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1341, to_date('03-01-2022', 'dd-mm-yyyy'), 1, 688306157, 705935024);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2397, to_date('15-09-2019', 'dd-mm-yyyy'), 1, 786282221, 405518744);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (365, to_date('28-02-2020', 'dd-mm-yyyy'), 8, 626936785, 479653978);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6639, to_date('13-09-2023', 'dd-mm-yyyy'), 4, 566975851, 819629728);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (237, to_date('21-08-2020', 'dd-mm-yyyy'), 7, 817458147, 358365099);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (102, to_date('31-08-2023', 'dd-mm-yyyy'), 6, 196581216, 309276586);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (314, to_date('12-05-2024', 'dd-mm-yyyy'), 1, 669676531, 616481208);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1256, to_date('30-01-2022', 'dd-mm-yyyy'), 5, 545992521, 664734015);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2500, to_date('10-10-2018', 'dd-mm-yyyy'), 2, 836348702, 979765409);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6986, to_date('25-05-2019', 'dd-mm-yyyy'), 7, 599264563, 365075699);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8003, to_date('19-09-2018', 'dd-mm-yyyy'), 6, 945279866, 693305212);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1142, to_date('27-09-2020', 'dd-mm-yyyy'), 2, 943740069, 573605423);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8190, to_date('28-07-2021', 'dd-mm-yyyy'), 2, 561339567, 136534555);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4954, to_date('18-08-2023', 'dd-mm-yyyy'), 1, 221469518, 720668684);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7847, to_date('30-07-2023', 'dd-mm-yyyy'), 7, 549769099, 705935024);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1669, to_date('01-04-2023', 'dd-mm-yyyy'), 8, 930733425, 554530420);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8720, to_date('19-05-2019', 'dd-mm-yyyy'), 4, 513484972, 181754932);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6763, to_date('11-05-2024', 'dd-mm-yyyy'), 7, 616910574, 373594668);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2380, to_date('17-11-2022', 'dd-mm-yyyy'), 2, 559150491, 186815840);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8079, to_date('30-08-2021', 'dd-mm-yyyy'), 1, 605694546, 724025315);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7663, to_date('23-08-2020', 'dd-mm-yyyy'), 8, 301747054, 822958626);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6447, to_date('17-07-2021', 'dd-mm-yyyy'), 3, 974867756, 257664812);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6338, to_date('23-05-2019', 'dd-mm-yyyy'), 4, 725769483, 203177232);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2101, to_date('10-10-2021', 'dd-mm-yyyy'), 1, 917606772, 226755554);
commit;
prompt 700 records committed...
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (590, to_date('08-07-2020', 'dd-mm-yyyy'), 1, 4, 524045728);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (619, to_date('15-08-2021', 'dd-mm-yyyy'), 9, 284565143, 340224289);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4965, to_date('14-10-2018', 'dd-mm-yyyy'), 6, 243930676, 951147722);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6634, to_date('25-12-2023', 'dd-mm-yyyy'), 8, 788254160, 249732553);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7225, to_date('10-05-2023', 'dd-mm-yyyy'), 3, 780428506, 533663538);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6506, to_date('13-05-2020', 'dd-mm-yyyy'), 5, 257844327, 271195493);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6595, to_date('11-11-2019', 'dd-mm-yyyy'), 2, 974867756, 613225413);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1892, to_date('20-08-2020', 'dd-mm-yyyy'), 7, 766023468, 307647370);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2274, to_date('28-09-2020', 'dd-mm-yyyy'), 1, 944607210, 358365099);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4824, to_date('23-09-2022', 'dd-mm-yyyy'), 6, 673479105, 571324275);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1329, to_date('08-03-2019', 'dd-mm-yyyy'), 3, 299967787, 951147722);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (531, to_date('29-12-2020', 'dd-mm-yyyy'), 4, 782002700, 980774607);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2888, to_date('03-11-2020', 'dd-mm-yyyy'), 8, 436250931, 995446511);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4845, to_date('01-12-2021', 'dd-mm-yyyy'), 4, 10, 464008405);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4799, to_date('01-11-2020', 'dd-mm-yyyy'), 3, 10, 805966662);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4012, to_date('01-04-2020', 'dd-mm-yyyy'), 1, 895518662, 641478703);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3327, to_date('31-12-2020', 'dd-mm-yyyy'), 2, 666319395, 203177232);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3977, to_date('28-09-2021', 'dd-mm-yyyy'), 8, 912201109, 203546832);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3299, to_date('15-05-2024', 'dd-mm-yyyy'), 5, 186952282, 672385701);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (832, to_date('29-03-2023', 'dd-mm-yyyy'), 2, 974824879, 795523664);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1460, to_date('08-09-2022', 'dd-mm-yyyy'), 3, 936794880, 340224289);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8064, to_date('23-02-2021', 'dd-mm-yyyy'), 5, 186952282, 284127270);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1538, to_date('24-03-2023', 'dd-mm-yyyy'), 5, 896331645, 474749393);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (371, to_date('09-04-2023', 'dd-mm-yyyy'), 9, 671146058, 661309884);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7918, to_date('11-05-2022', 'dd-mm-yyyy'), 4, 584067256, 679680071);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2623, to_date('18-01-2022', 'dd-mm-yyyy'), 3, 681343156, 124911743);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (404, to_date('09-03-2024', 'dd-mm-yyyy'), 2, 552191541, 758032935);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2170, to_date('14-10-2022', 'dd-mm-yyyy'), 4, 741906391, 361856328);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8144, to_date('21-06-2018', 'dd-mm-yyyy'), 1, 513484972, 721012119);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1379, to_date('11-08-2018', 'dd-mm-yyyy'), 9, 943740069, 691039126);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2189, to_date('28-02-2022', 'dd-mm-yyyy'), 1, 697718660, 931841670);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6713, to_date('10-12-2020', 'dd-mm-yyyy'), 9, 553370732, 809570703);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6458, to_date('06-05-2020', 'dd-mm-yyyy'), 9, 281153050, 16);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3084, to_date('13-08-2019', 'dd-mm-yyyy'), 6, 240772731, 441147157);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2339, to_date('17-04-2019', 'dd-mm-yyyy'), 3, 255266167, 475128065);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7770, to_date('16-02-2020', 'dd-mm-yyyy'), 7, 648472634, 932063112);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1551, to_date('08-01-2018', 'dd-mm-yyyy'), 4, 740249479, 135935044);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1856, to_date('22-02-2020', 'dd-mm-yyyy'), 9, 278828881, 217681825);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8618, to_date('24-10-2020', 'dd-mm-yyyy'), 9, 441856095, 931841670);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4952, to_date('15-04-2019', 'dd-mm-yyyy'), 9, 945180637, 226660644);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1236, to_date('03-09-2019', 'dd-mm-yyyy'), 6, 416008888, 817051842);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6431, to_date('28-02-2019', 'dd-mm-yyyy'), 6, 906439118, 553780623);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4434, to_date('04-08-2020', 'dd-mm-yyyy'), 8, 782002700, 812378169);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2829, to_date('09-12-2023', 'dd-mm-yyyy'), 1, 895518662, 302453160);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4448, to_date('07-05-2018', 'dd-mm-yyyy'), 7, 947427896, 101601397);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7506, to_date('26-04-2023', 'dd-mm-yyyy'), 8, 589996156, 477394794);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2621, to_date('21-09-2019', 'dd-mm-yyyy'), 3, 986298985, 588365109);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8806, to_date('27-01-2022', 'dd-mm-yyyy'), 4, 372877495, 893305971);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8737, to_date('01-03-2020', 'dd-mm-yyyy'), 9, 255266167, 698726616);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5553, to_date('28-06-2018', 'dd-mm-yyyy'), 9, 8, 158432589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2021, to_date('10-01-2022', 'dd-mm-yyyy'), 3, 566975851, 857481927);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6005, to_date('18-12-2023', 'dd-mm-yyyy'), 1, 631849990, 405518744);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1707, to_date('05-02-2021', 'dd-mm-yyyy'), 4, 397502047, 269880341);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6621, to_date('26-05-2018', 'dd-mm-yyyy'), 3, 103136089, 781797266);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (814, to_date('11-05-2022', 'dd-mm-yyyy'), 6, 563088236, 11);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5607, to_date('20-08-2022', 'dd-mm-yyyy'), 5, 480670356, 564319391);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6916, to_date('08-08-2019', 'dd-mm-yyyy'), 3, 942723809, 323135648);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2674, to_date('01-01-2019', 'dd-mm-yyyy'), 6, 337725570, 854266943);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (260, to_date('27-01-2018', 'dd-mm-yyyy'), 5, 896331645, 979765409);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (490, to_date('23-01-2022', 'dd-mm-yyyy'), 7, 643989569, 279081753);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7737, to_date('20-04-2019', 'dd-mm-yyyy'), 8, 659242904, 544885594);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8645, to_date('28-07-2022', 'dd-mm-yyyy'), 5, 313269756, 683493754);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (5951, to_date('13-05-2024', 'dd-mm-yyyy'), 6, 561339567, 573169589);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (270, to_date('19-09-2018', 'dd-mm-yyyy'), 9, 942723809, 580938331);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (2178, to_date('16-06-2022', 'dd-mm-yyyy'), 7, 103136089, 264866553);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8090, to_date('01-02-2021', 'dd-mm-yyyy'), 3, 291414436, 247415819);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (280, to_date('15-05-2024', 'dd-mm-yyyy'), 8, 989150100, 14);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (748, to_date('16-07-2022', 'dd-mm-yyyy'), 2, 936794880, 992164595);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (7706, to_date('21-11-2022', 'dd-mm-yyyy'), 3, 617468816, 935844232);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (8690, to_date('15-08-2022', 'dd-mm-yyyy'), 6, 125608783, 824395243);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (4480, to_date('11-12-2023', 'dd-mm-yyyy'), 4, 706361513, 452498810);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1091, to_date('21-01-2019', 'dd-mm-yyyy'), 1, 940073998, 980774607);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6484, to_date('20-07-2021', 'dd-mm-yyyy'), 5, 616910574, 335673276);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1622, to_date('28-12-2019', 'dd-mm-yyyy'), 1, 868910800, 307647370);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3688, to_date('21-05-2023', 'dd-mm-yyyy'), 3, 766023468, 312667361);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (6327, to_date('22-08-2019', 'dd-mm-yyyy'), 7, 4, 616890176);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (1680, to_date('01-12-2018', 'dd-mm-yyyy'), 3, 896331645, 901756155);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (3793, to_date('06-09-2020', 'dd-mm-yyyy'), 4, 657420745, 179466821);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (40, to_date('01-01-2023', 'dd-mm-yyyy'), 2, 2, 11);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (41, to_date('02-01-2023', 'dd-mm-yyyy'), 3, 3, 12);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (42, to_date('03-01-2023', 'dd-mm-yyyy'), 1, 4, 13);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (43, to_date('04-01-2023', 'dd-mm-yyyy'), 5, 5, 14);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (44, to_date('05-01-2023', 'dd-mm-yyyy'), 2, 6, 15);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (45, to_date('06-01-2023', 'dd-mm-yyyy'), 4, 7, 16);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (46, to_date('07-01-2023', 'dd-mm-yyyy'), 3, 8, 17);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (47, to_date('08-01-2023', 'dd-mm-yyyy'), 2, 9, 18);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (48, to_date('09-01-2023', 'dd-mm-yyyy'), 1, 10, 19);
insert into PURCHASE (purchaseid, purchasedate, quantity, customerid, workerid)
values (49, to_date('10-01-2023', 'dd-mm-yyyy'), 5, 1, 20);
commit;
prompt 788 records loaded
prompt Loading BOOKSALES...
insert into BOOKSALES (bookid, purchaseid)
values (23, 123);
insert into BOOKSALES (bookid, purchaseid)
values (23, 321);
insert into BOOKSALES (bookid, purchaseid)
values (23, 7787);
insert into BOOKSALES (bookid, purchaseid)
values (24, 123);
insert into BOOKSALES (bookid, purchaseid)
values (25, 321);
insert into BOOKSALES (bookid, purchaseid)
values (25, 1538);
insert into BOOKSALES (bookid, purchaseid)
values (25, 2339);
insert into BOOKSALES (bookid, purchaseid)
values (25, 5600);
insert into BOOKSALES (bookid, purchaseid)
values (25, 5756);
insert into BOOKSALES (bookid, purchaseid)
values (26, 321);
insert into BOOKSALES (bookid, purchaseid)
values (27, 321);
insert into BOOKSALES (bookid, purchaseid)
values (27, 2967);
insert into BOOKSALES (bookid, purchaseid)
values (27, 4178);
insert into BOOKSALES (bookid, purchaseid)
values (28, 321);
insert into BOOKSALES (bookid, purchaseid)
values (29, 43);
insert into BOOKSALES (bookid, purchaseid)
values (29, 321);
insert into BOOKSALES (bookid, purchaseid)
values (29, 3573);
insert into BOOKSALES (bookid, purchaseid)
values (29, 3930);
insert into BOOKSALES (bookid, purchaseid)
values (29, 8050);
insert into BOOKSALES (bookid, purchaseid)
values (30, 321);
insert into BOOKSALES (bookid, purchaseid)
values (30, 456);
insert into BOOKSALES (bookid, purchaseid)
values (30, 7547);
insert into BOOKSALES (bookid, purchaseid)
values (111111, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111115, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111115, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111115, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111115, 4130);
insert into BOOKSALES (bookid, purchaseid)
values (111115, 4631);
insert into BOOKSALES (bookid, purchaseid)
values (111115, 5473);
insert into BOOKSALES (bookid, purchaseid)
values (111119, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111119, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111123, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111123, 2429);
insert into BOOKSALES (bookid, purchaseid)
values (111123, 7737);
insert into BOOKSALES (bookid, purchaseid)
values (111127, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111127, 4366);
insert into BOOKSALES (bookid, purchaseid)
values (111131, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111131, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111131, 814);
insert into BOOKSALES (bookid, purchaseid)
values (111131, 3776);
insert into BOOKSALES (bookid, purchaseid)
values (111135, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111135, 8130);
insert into BOOKSALES (bookid, purchaseid)
values (111139, 8320);
insert into BOOKSALES (bookid, purchaseid)
values (111143, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111147, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111147, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111147, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111147, 6105);
insert into BOOKSALES (bookid, purchaseid)
values (111151, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111151, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111151, 4265);
insert into BOOKSALES (bookid, purchaseid)
values (111155, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111155, 3724);
insert into BOOKSALES (bookid, purchaseid)
values (111155, 7162);
insert into BOOKSALES (bookid, purchaseid)
values (111159, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111159, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111159, 4343);
insert into BOOKSALES (bookid, purchaseid)
values (111163, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111163, 7439);
insert into BOOKSALES (bookid, purchaseid)
values (111171, 1669);
insert into BOOKSALES (bookid, purchaseid)
values (111175, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111175, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111175, 1236);
insert into BOOKSALES (bookid, purchaseid)
values (111183, 5578);
insert into BOOKSALES (bookid, purchaseid)
values (111187, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111187, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111187, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111191, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111191, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111195, 2388);
insert into BOOKSALES (bookid, purchaseid)
values (111195, 7787);
insert into BOOKSALES (bookid, purchaseid)
values (111203, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111211, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111215, 42);
insert into BOOKSALES (bookid, purchaseid)
values (111215, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111215, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111215, 7663);
insert into BOOKSALES (bookid, purchaseid)
values (111219, 6484);
insert into BOOKSALES (bookid, purchaseid)
values (111223, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111227, 266);
insert into BOOKSALES (bookid, purchaseid)
values (111231, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111231, 8922);
insert into BOOKSALES (bookid, purchaseid)
values (111235, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111235, 1940);
insert into BOOKSALES (bookid, purchaseid)
values (111235, 5553);
insert into BOOKSALES (bookid, purchaseid)
values (111235, 5582);
insert into BOOKSALES (bookid, purchaseid)
values (111239, 1940);
insert into BOOKSALES (bookid, purchaseid)
values (111239, 4595);
insert into BOOKSALES (bookid, purchaseid)
values (111239, 5582);
insert into BOOKSALES (bookid, purchaseid)
values (111243, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111243, 1236);
insert into BOOKSALES (bookid, purchaseid)
values (111243, 3124);
insert into BOOKSALES (bookid, purchaseid)
values (111243, 4551);
insert into BOOKSALES (bookid, purchaseid)
values (111247, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111247, 6896);
insert into BOOKSALES (bookid, purchaseid)
values (111247, 7546);
insert into BOOKSALES (bookid, purchaseid)
values (111255, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111255, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111259, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111263, 123);
commit;
prompt 100 records committed...
insert into BOOKSALES (bookid, purchaseid)
values (111263, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111267, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111267, 3393);
insert into BOOKSALES (bookid, purchaseid)
values (111271, 6710);
insert into BOOKSALES (bookid, purchaseid)
values (111275, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111275, 1856);
insert into BOOKSALES (bookid, purchaseid)
values (111279, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111279, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111279, 4138);
insert into BOOKSALES (bookid, purchaseid)
values (111279, 4536);
insert into BOOKSALES (bookid, purchaseid)
values (111283, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111283, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111283, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111283, 4339);
insert into BOOKSALES (bookid, purchaseid)
values (111283, 4856);
insert into BOOKSALES (bookid, purchaseid)
values (111291, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111295, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111299, 6570);
insert into BOOKSALES (bookid, purchaseid)
values (111299, 6887);
insert into BOOKSALES (bookid, purchaseid)
values (111303, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111303, 2490);
insert into BOOKSALES (bookid, purchaseid)
values (111303, 8789);
insert into BOOKSALES (bookid, purchaseid)
values (111307, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111307, 7687);
insert into BOOKSALES (bookid, purchaseid)
values (111311, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111311, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111311, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111311, 5143);
insert into BOOKSALES (bookid, purchaseid)
values (111315, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111315, 4434);
insert into BOOKSALES (bookid, purchaseid)
values (111319, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111319, 1774);
insert into BOOKSALES (bookid, purchaseid)
values (111319, 6484);
insert into BOOKSALES (bookid, purchaseid)
values (111319, 8262);
insert into BOOKSALES (bookid, purchaseid)
values (111323, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111323, 2213);
insert into BOOKSALES (bookid, purchaseid)
values (111327, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111335, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111339, 6964);
insert into BOOKSALES (bookid, purchaseid)
values (111343, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111343, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111343, 6896);
insert into BOOKSALES (bookid, purchaseid)
values (111351, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111351, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111355, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111359, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111363, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111363, 3327);
insert into BOOKSALES (bookid, purchaseid)
values (111367, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111367, 8271);
insert into BOOKSALES (bookid, purchaseid)
values (111371, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111371, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111375, 49);
insert into BOOKSALES (bookid, purchaseid)
values (111375, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111375, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111375, 8618);
insert into BOOKSALES (bookid, purchaseid)
values (111379, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111379, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111379, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111383, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111383, 590);
insert into BOOKSALES (bookid, purchaseid)
values (111383, 5572);
insert into BOOKSALES (bookid, purchaseid)
values (111383, 6492);
insert into BOOKSALES (bookid, purchaseid)
values (111387, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111387, 1507);
insert into BOOKSALES (bookid, purchaseid)
values (111387, 2888);
insert into BOOKSALES (bookid, purchaseid)
values (111391, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111395, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111395, 8006);
insert into BOOKSALES (bookid, purchaseid)
values (111399, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111399, 8006);
insert into BOOKSALES (bookid, purchaseid)
values (111403, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111403, 6159);
insert into BOOKSALES (bookid, purchaseid)
values (111407, 2170);
insert into BOOKSALES (bookid, purchaseid)
values (111407, 3350);
insert into BOOKSALES (bookid, purchaseid)
values (111415, 2189);
insert into BOOKSALES (bookid, purchaseid)
values (111415, 6772);
insert into BOOKSALES (bookid, purchaseid)
values (111419, 484);
insert into BOOKSALES (bookid, purchaseid)
values (111427, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111427, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111435, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111435, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111435, 7651);
insert into BOOKSALES (bookid, purchaseid)
values (111439, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111443, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111443, 4339);
insert into BOOKSALES (bookid, purchaseid)
values (111443, 5007);
insert into BOOKSALES (bookid, purchaseid)
values (111447, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111447, 1843);
insert into BOOKSALES (bookid, purchaseid)
values (111447, 3897);
insert into BOOKSALES (bookid, purchaseid)
values (111447, 8496);
insert into BOOKSALES (bookid, purchaseid)
values (111451, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111451, 3580);
insert into BOOKSALES (bookid, purchaseid)
values (111451, 4952);
insert into BOOKSALES (bookid, purchaseid)
values (111451, 7140);
insert into BOOKSALES (bookid, purchaseid)
values (111455, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111463, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111463, 2500);
insert into BOOKSALES (bookid, purchaseid)
values (111467, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111467, 3393);
commit;
prompt 200 records committed...
insert into BOOKSALES (bookid, purchaseid)
values (111467, 8006);
insert into BOOKSALES (bookid, purchaseid)
values (111471, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111471, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111471, 3848);
insert into BOOKSALES (bookid, purchaseid)
values (111475, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111475, 1371);
insert into BOOKSALES (bookid, purchaseid)
values (111475, 2339);
insert into BOOKSALES (bookid, purchaseid)
values (111475, 4434);
insert into BOOKSALES (bookid, purchaseid)
values (111479, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111483, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111483, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111487, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111487, 6159);
insert into BOOKSALES (bookid, purchaseid)
values (111491, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111491, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111491, 2505);
insert into BOOKSALES (bookid, purchaseid)
values (111495, 2170);
insert into BOOKSALES (bookid, purchaseid)
values (111499, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111499, 3274);
insert into BOOKSALES (bookid, purchaseid)
values (111499, 5801);
insert into BOOKSALES (bookid, purchaseid)
values (111503, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111503, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111507, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111511, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111511, 2557);
insert into BOOKSALES (bookid, purchaseid)
values (111511, 3232);
insert into BOOKSALES (bookid, purchaseid)
values (111515, 45);
insert into BOOKSALES (bookid, purchaseid)
values (111515, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111519, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111519, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111523, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111523, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111527, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111527, 3580);
insert into BOOKSALES (bookid, purchaseid)
values (111527, 8539);
insert into BOOKSALES (bookid, purchaseid)
values (111539, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111539, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111539, 903);
insert into BOOKSALES (bookid, purchaseid)
values (111543, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111543, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111547, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111547, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111551, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111551, 2101);
insert into BOOKSALES (bookid, purchaseid)
values (111551, 6083);
insert into BOOKSALES (bookid, purchaseid)
values (111559, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111559, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111559, 4845);
insert into BOOKSALES (bookid, purchaseid)
values (111563, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111567, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111567, 3599);
insert into BOOKSALES (bookid, purchaseid)
values (111571, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111571, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111571, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111571, 2506);
insert into BOOKSALES (bookid, purchaseid)
values (111571, 3573);
insert into BOOKSALES (bookid, purchaseid)
values (111575, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111575, 490);
insert into BOOKSALES (bookid, purchaseid)
values (111575, 7417);
insert into BOOKSALES (bookid, purchaseid)
values (111579, 47);
insert into BOOKSALES (bookid, purchaseid)
values (111579, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111579, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111579, 1507);
insert into BOOKSALES (bookid, purchaseid)
values (111583, 1515);
insert into BOOKSALES (bookid, purchaseid)
values (111583, 6132);
insert into BOOKSALES (bookid, purchaseid)
values (111587, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111591, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111591, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111591, 2264);
insert into BOOKSALES (bookid, purchaseid)
values (111591, 4662);
insert into BOOKSALES (bookid, purchaseid)
values (111599, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111599, 186);
insert into BOOKSALES (bookid, purchaseid)
values (111599, 6238);
insert into BOOKSALES (bookid, purchaseid)
values (111599, 7106);
insert into BOOKSALES (bookid, purchaseid)
values (111599, 8439);
insert into BOOKSALES (bookid, purchaseid)
values (111603, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111603, 748);
insert into BOOKSALES (bookid, purchaseid)
values (111603, 6750);
insert into BOOKSALES (bookid, purchaseid)
values (111607, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111607, 4809);
insert into BOOKSALES (bookid, purchaseid)
values (111611, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111615, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111619, 4434);
insert into BOOKSALES (bookid, purchaseid)
values (111619, 5756);
insert into BOOKSALES (bookid, purchaseid)
values (111623, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111627, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111627, 8165);
insert into BOOKSALES (bookid, purchaseid)
values (111639, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111639, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111643, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111647, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111647, 5430);
insert into BOOKSALES (bookid, purchaseid)
values (111651, 4713);
insert into BOOKSALES (bookid, purchaseid)
values (111651, 6899);
insert into BOOKSALES (bookid, purchaseid)
values (111655, 5007);
insert into BOOKSALES (bookid, purchaseid)
values (111659, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111659, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111659, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111659, 1091);
insert into BOOKSALES (bookid, purchaseid)
values (111659, 2674);
commit;
prompt 300 records committed...
insert into BOOKSALES (bookid, purchaseid)
values (111659, 6618);
insert into BOOKSALES (bookid, purchaseid)
values (111659, 8993);
insert into BOOKSALES (bookid, purchaseid)
values (111671, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111671, 4695);
insert into BOOKSALES (bookid, purchaseid)
values (111675, 1236);
insert into BOOKSALES (bookid, purchaseid)
values (111675, 7225);
insert into BOOKSALES (bookid, purchaseid)
values (111679, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111679, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111679, 2397);
insert into BOOKSALES (bookid, purchaseid)
values (111679, 7787);
insert into BOOKSALES (bookid, purchaseid)
values (111679, 8844);
insert into BOOKSALES (bookid, purchaseid)
values (111683, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111683, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111683, 1856);
insert into BOOKSALES (bookid, purchaseid)
values (111683, 5536);
insert into BOOKSALES (bookid, purchaseid)
values (111687, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111687, 6073);
insert into BOOKSALES (bookid, purchaseid)
values (111699, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111707, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111707, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111711, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111711, 484);
insert into BOOKSALES (bookid, purchaseid)
values (111711, 531);
insert into BOOKSALES (bookid, purchaseid)
values (111715, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111715, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111715, 1669);
insert into BOOKSALES (bookid, purchaseid)
values (111715, 1738);
insert into BOOKSALES (bookid, purchaseid)
values (111719, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111719, 1500);
insert into BOOKSALES (bookid, purchaseid)
values (111719, 2437);
insert into BOOKSALES (bookid, purchaseid)
values (111723, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111723, 4926);
insert into BOOKSALES (bookid, purchaseid)
values (111727, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111727, 4856);
insert into BOOKSALES (bookid, purchaseid)
values (111739, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111747, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111747, 774);
insert into BOOKSALES (bookid, purchaseid)
values (111747, 1142);
insert into BOOKSALES (bookid, purchaseid)
values (111751, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111751, 3580);
insert into BOOKSALES (bookid, purchaseid)
values (111751, 4619);
insert into BOOKSALES (bookid, purchaseid)
values (111755, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111755, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111755, 1460);
insert into BOOKSALES (bookid, purchaseid)
values (111755, 6509);
insert into BOOKSALES (bookid, purchaseid)
values (111767, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111767, 2506);
insert into BOOKSALES (bookid, purchaseid)
values (111771, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111771, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111775, 630);
insert into BOOKSALES (bookid, purchaseid)
values (111779, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111779, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111787, 3191);
insert into BOOKSALES (bookid, purchaseid)
values (111787, 3327);
insert into BOOKSALES (bookid, purchaseid)
values (111787, 5685);
insert into BOOKSALES (bookid, purchaseid)
values (111795, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111795, 2769);
insert into BOOKSALES (bookid, purchaseid)
values (111799, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111799, 7231);
insert into BOOKSALES (bookid, purchaseid)
values (111803, 2711);
insert into BOOKSALES (bookid, purchaseid)
values (111807, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111807, 5381);
insert into BOOKSALES (bookid, purchaseid)
values (111811, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111811, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111811, 5381);
insert into BOOKSALES (bookid, purchaseid)
values (111815, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111815, 6506);
insert into BOOKSALES (bookid, purchaseid)
values (111831, 8090);
insert into BOOKSALES (bookid, purchaseid)
values (111835, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111847, 5007);
insert into BOOKSALES (bookid, purchaseid)
values (111855, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111855, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111855, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111855, 6159);
insert into BOOKSALES (bookid, purchaseid)
values (111859, 3688);
insert into BOOKSALES (bookid, purchaseid)
values (111863, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111863, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111871, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111871, 7651);
insert into BOOKSALES (bookid, purchaseid)
values (111875, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111875, 6591);
insert into BOOKSALES (bookid, purchaseid)
values (111879, 1063);
insert into BOOKSALES (bookid, purchaseid)
values (111887, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111891, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111899, 1063);
insert into BOOKSALES (bookid, purchaseid)
values (111907, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111907, 7516);
insert into BOOKSALES (bookid, purchaseid)
values (111915, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111923, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111923, 698);
insert into BOOKSALES (bookid, purchaseid)
values (111923, 6239);
insert into BOOKSALES (bookid, purchaseid)
values (111923, 8645);
insert into BOOKSALES (bookid, purchaseid)
values (111927, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111927, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111927, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111931, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111931, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111931, 2888);
insert into BOOKSALES (bookid, purchaseid)
values (111931, 6484);
insert into BOOKSALES (bookid, purchaseid)
values (111931, 8734);
commit;
prompt 400 records committed...
insert into BOOKSALES (bookid, purchaseid)
values (111935, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111935, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111935, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111939, 1467);
insert into BOOKSALES (bookid, purchaseid)
values (111943, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111943, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111951, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111951, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111955, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111955, 1551);
insert into BOOKSALES (bookid, purchaseid)
values (111959, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111959, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111959, 5113);
insert into BOOKSALES (bookid, purchaseid)
values (111959, 7770);
insert into BOOKSALES (bookid, purchaseid)
values (111963, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111963, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111967, 40);
insert into BOOKSALES (bookid, purchaseid)
values (111967, 3848);
insert into BOOKSALES (bookid, purchaseid)
values (111971, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111971, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111971, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111975, 4163);
insert into BOOKSALES (bookid, purchaseid)
values (111979, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111979, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111979, 2557);
insert into BOOKSALES (bookid, purchaseid)
values (111979, 4821);
insert into BOOKSALES (bookid, purchaseid)
values (111983, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111983, 1256);
insert into BOOKSALES (bookid, purchaseid)
values (111983, 7439);
insert into BOOKSALES (bookid, purchaseid)
values (111987, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111991, 321);
insert into BOOKSALES (bookid, purchaseid)
values (111991, 456);
insert into BOOKSALES (bookid, purchaseid)
values (111995, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111995, 8190);
insert into BOOKSALES (bookid, purchaseid)
values (111999, 123);
insert into BOOKSALES (bookid, purchaseid)
values (111999, 6896);
insert into BOOKSALES (bookid, purchaseid)
values (112003, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112007, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112007, 5578);
insert into BOOKSALES (bookid, purchaseid)
values (112011, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112011, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112011, 3084);
insert into BOOKSALES (bookid, purchaseid)
values (112015, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112015, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112019, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112019, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112023, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112027, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112031, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112031, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112031, 4713);
insert into BOOKSALES (bookid, purchaseid)
values (112035, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112035, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112035, 6447);
insert into BOOKSALES (bookid, purchaseid)
values (112039, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112039, 490);
insert into BOOKSALES (bookid, purchaseid)
values (112039, 3580);
insert into BOOKSALES (bookid, purchaseid)
values (112039, 4339);
insert into BOOKSALES (bookid, purchaseid)
values (112043, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112043, 5430);
insert into BOOKSALES (bookid, purchaseid)
values (112043, 6432);
insert into BOOKSALES (bookid, purchaseid)
values (112047, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112047, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112047, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112051, 1343);
insert into BOOKSALES (bookid, purchaseid)
values (112051, 5094);
insert into BOOKSALES (bookid, purchaseid)
values (112051, 6750);
insert into BOOKSALES (bookid, purchaseid)
values (112055, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112059, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112067, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112067, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112067, 6634);
insert into BOOKSALES (bookid, purchaseid)
values (112067, 8433);
insert into BOOKSALES (bookid, purchaseid)
values (112075, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112075, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112075, 5784);
insert into BOOKSALES (bookid, purchaseid)
values (112075, 8190);
insert into BOOKSALES (bookid, purchaseid)
values (112075, 8786);
insert into BOOKSALES (bookid, purchaseid)
values (112083, 6964);
insert into BOOKSALES (bookid, purchaseid)
values (112091, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112095, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112095, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112099, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112103, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112103, 237);
insert into BOOKSALES (bookid, purchaseid)
values (112107, 3990);
insert into BOOKSALES (bookid, purchaseid)
values (112111, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112111, 3191);
insert into BOOKSALES (bookid, purchaseid)
values (112115, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112119, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112119, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112123, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112123, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112123, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112127, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112131, 2626);
insert into BOOKSALES (bookid, purchaseid)
values (112131, 3977);
insert into BOOKSALES (bookid, purchaseid)
values (112131, 5351);
insert into BOOKSALES (bookid, purchaseid)
values (112135, 2522);
insert into BOOKSALES (bookid, purchaseid)
values (112139, 123);
commit;
prompt 500 records committed...
insert into BOOKSALES (bookid, purchaseid)
values (112147, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112147, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112151, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112155, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112155, 8262);
insert into BOOKSALES (bookid, purchaseid)
values (112159, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112159, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112159, 2506);
insert into BOOKSALES (bookid, purchaseid)
values (112159, 8737);
insert into BOOKSALES (bookid, purchaseid)
values (112163, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112163, 3688);
insert into BOOKSALES (bookid, purchaseid)
values (112163, 3776);
insert into BOOKSALES (bookid, purchaseid)
values (112163, 7584);
insert into BOOKSALES (bookid, purchaseid)
values (112167, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112167, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112167, 6432);
insert into BOOKSALES (bookid, purchaseid)
values (112167, 7225);
insert into BOOKSALES (bookid, purchaseid)
values (112171, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112171, 7687);
insert into BOOKSALES (bookid, purchaseid)
values (112175, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112175, 5351);
insert into BOOKSALES (bookid, purchaseid)
values (112179, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112179, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112179, 5473);
insert into BOOKSALES (bookid, purchaseid)
values (112179, 8690);
insert into BOOKSALES (bookid, purchaseid)
values (112179, 8712);
insert into BOOKSALES (bookid, purchaseid)
values (112183, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112183, 1892);
insert into BOOKSALES (bookid, purchaseid)
values (112183, 2274);
insert into BOOKSALES (bookid, purchaseid)
values (112187, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112187, 5430);
insert into BOOKSALES (bookid, purchaseid)
values (112191, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112195, 3349);
insert into BOOKSALES (bookid, purchaseid)
values (112203, 1091);
insert into BOOKSALES (bookid, purchaseid)
values (112203, 1371);
insert into BOOKSALES (bookid, purchaseid)
values (112207, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112207, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112207, 2437);
insert into BOOKSALES (bookid, purchaseid)
values (112207, 6083);
insert into BOOKSALES (bookid, purchaseid)
values (112215, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112219, 2711);
insert into BOOKSALES (bookid, purchaseid)
values (112223, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112223, 4695);
insert into BOOKSALES (bookid, purchaseid)
values (112231, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112231, 2507);
insert into BOOKSALES (bookid, purchaseid)
values (112235, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112235, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112235, 8715);
insert into BOOKSALES (bookid, purchaseid)
values (112239, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112239, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112243, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112247, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112247, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112247, 679);
insert into BOOKSALES (bookid, purchaseid)
values (112251, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112251, 8669);
insert into BOOKSALES (bookid, purchaseid)
values (112255, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112255, 8329);
insert into BOOKSALES (bookid, purchaseid)
values (112259, 299);
insert into BOOKSALES (bookid, purchaseid)
values (112259, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112263, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112267, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112271, 7591);
insert into BOOKSALES (bookid, purchaseid)
values (112275, 4551);
insert into BOOKSALES (bookid, purchaseid)
values (112275, 5007);
insert into BOOKSALES (bookid, purchaseid)
values (112275, 6327);
insert into BOOKSALES (bookid, purchaseid)
values (112279, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112279, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112279, 371);
insert into BOOKSALES (bookid, purchaseid)
values (112279, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112279, 4400);
insert into BOOKSALES (bookid, purchaseid)
values (112279, 6570);
insert into BOOKSALES (bookid, purchaseid)
values (112287, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112287, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112287, 2021);
insert into BOOKSALES (bookid, purchaseid)
values (112287, 2178);
insert into BOOKSALES (bookid, purchaseid)
values (112295, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112295, 1124);
insert into BOOKSALES (bookid, purchaseid)
values (112295, 4621);
insert into BOOKSALES (bookid, purchaseid)
values (112299, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112299, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112303, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112303, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112303, 1583);
insert into BOOKSALES (bookid, purchaseid)
values (112307, 1124);
insert into BOOKSALES (bookid, purchaseid)
values (112307, 6591);
insert into BOOKSALES (bookid, purchaseid)
values (112311, 5858);
insert into BOOKSALES (bookid, purchaseid)
values (112315, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112315, 7189);
insert into BOOKSALES (bookid, purchaseid)
values (112319, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112319, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112323, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112327, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112327, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112331, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112335, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112335, 1371);
insert into BOOKSALES (bookid, purchaseid)
values (112335, 8165);
insert into BOOKSALES (bookid, purchaseid)
values (112339, 4130);
insert into BOOKSALES (bookid, purchaseid)
values (112339, 4265);
commit;
prompt 600 records committed...
insert into BOOKSALES (bookid, purchaseid)
values (112339, 5381);
insert into BOOKSALES (bookid, purchaseid)
values (112343, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112343, 3350);
insert into BOOKSALES (bookid, purchaseid)
values (112347, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112347, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112351, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112351, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112355, 45);
insert into BOOKSALES (bookid, purchaseid)
values (112355, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112355, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112355, 4734);
insert into BOOKSALES (bookid, purchaseid)
values (112363, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112363, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112363, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112363, 878);
insert into BOOKSALES (bookid, purchaseid)
values (112367, 6887);
insert into BOOKSALES (bookid, purchaseid)
values (112367, 7687);
insert into BOOKSALES (bookid, purchaseid)
values (112375, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112375, 7516);
insert into BOOKSALES (bookid, purchaseid)
values (112379, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112383, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112387, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112387, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112387, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112387, 6686);
insert into BOOKSALES (bookid, purchaseid)
values (112391, 7439);
insert into BOOKSALES (bookid, purchaseid)
values (112395, 162);
insert into BOOKSALES (bookid, purchaseid)
values (112395, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112395, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112395, 5996);
insert into BOOKSALES (bookid, purchaseid)
values (112399, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112399, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112407, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112407, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112411, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112411, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112411, 7585);
insert into BOOKSALES (bookid, purchaseid)
values (112415, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112415, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112415, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112415, 1343);
insert into BOOKSALES (bookid, purchaseid)
values (112423, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112423, 550);
insert into BOOKSALES (bookid, purchaseid)
values (112423, 1784);
insert into BOOKSALES (bookid, purchaseid)
values (112427, 5274);
insert into BOOKSALES (bookid, purchaseid)
values (112427, 6239);
insert into BOOKSALES (bookid, purchaseid)
values (112431, 8064);
insert into BOOKSALES (bookid, purchaseid)
values (112435, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112439, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112439, 2623);
insert into BOOKSALES (bookid, purchaseid)
values (112443, 1930);
insert into BOOKSALES (bookid, purchaseid)
values (112443, 2557);
insert into BOOKSALES (bookid, purchaseid)
values (112447, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112447, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112447, 3124);
insert into BOOKSALES (bookid, purchaseid)
values (112451, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112455, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112455, 6458);
insert into BOOKSALES (bookid, purchaseid)
values (112459, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112459, 2829);
insert into BOOKSALES (bookid, purchaseid)
values (112463, 49);
insert into BOOKSALES (bookid, purchaseid)
values (112463, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112463, 6704);
insert into BOOKSALES (bookid, purchaseid)
values (112463, 8789);
insert into BOOKSALES (bookid, purchaseid)
values (112471, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112475, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112475, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112483, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112491, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112495, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112495, 3274);
insert into BOOKSALES (bookid, purchaseid)
values (112499, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112499, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112499, 8496);
insert into BOOKSALES (bookid, purchaseid)
values (112499, 8786);
insert into BOOKSALES (bookid, purchaseid)
values (112503, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112503, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112511, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112511, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112511, 3932);
insert into BOOKSALES (bookid, purchaseid)
values (112511, 4178);
insert into BOOKSALES (bookid, purchaseid)
values (112515, 630);
insert into BOOKSALES (bookid, purchaseid)
values (112519, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112519, 2178);
insert into BOOKSALES (bookid, purchaseid)
values (112519, 7292);
insert into BOOKSALES (bookid, purchaseid)
values (112523, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112523, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112527, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112531, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112539, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112539, 3599);
insert into BOOKSALES (bookid, purchaseid)
values (112551, 5274);
insert into BOOKSALES (bookid, purchaseid)
values (112555, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112555, 7651);
insert into BOOKSALES (bookid, purchaseid)
values (112559, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112559, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112559, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112563, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112563, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112563, 3124);
commit;
prompt 700 records committed...
insert into BOOKSALES (bookid, purchaseid)
values (112567, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112567, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112567, 878);
insert into BOOKSALES (bookid, purchaseid)
values (112567, 3599);
insert into BOOKSALES (bookid, purchaseid)
values (112567, 6458);
insert into BOOKSALES (bookid, purchaseid)
values (112575, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112579, 49);
insert into BOOKSALES (bookid, purchaseid)
values (112579, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112579, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112579, 4130);
insert into BOOKSALES (bookid, purchaseid)
values (112583, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112583, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112587, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112587, 4058);
insert into BOOKSALES (bookid, purchaseid)
values (112591, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112591, 2178);
insert into BOOKSALES (bookid, purchaseid)
values (112591, 8320);
insert into BOOKSALES (bookid, purchaseid)
values (112591, 8804);
insert into BOOKSALES (bookid, purchaseid)
values (112595, 903);
insert into BOOKSALES (bookid, purchaseid)
values (112599, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112599, 5499);
insert into BOOKSALES (bookid, purchaseid)
values (112603, 1707);
insert into BOOKSALES (bookid, purchaseid)
values (112607, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112611, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112611, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112611, 5634);
insert into BOOKSALES (bookid, purchaseid)
values (112611, 8320);
insert into BOOKSALES (bookid, purchaseid)
values (112615, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112627, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112627, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112627, 8993);
insert into BOOKSALES (bookid, purchaseid)
values (112631, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112631, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112639, 42);
insert into BOOKSALES (bookid, purchaseid)
values (112639, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112639, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112639, 456);
insert into BOOKSALES (bookid, purchaseid)
values (112639, 4265);
insert into BOOKSALES (bookid, purchaseid)
values (112639, 8993);
insert into BOOKSALES (bookid, purchaseid)
values (112643, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112647, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112651, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112651, 1551);
insert into BOOKSALES (bookid, purchaseid)
values (112651, 5394);
insert into BOOKSALES (bookid, purchaseid)
values (112651, 6986);
insert into BOOKSALES (bookid, purchaseid)
values (112655, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112655, 5113);
insert into BOOKSALES (bookid, purchaseid)
values (112659, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112659, 897);
insert into BOOKSALES (bookid, purchaseid)
values (112659, 6916);
insert into BOOKSALES (bookid, purchaseid)
values (112663, 123);
insert into BOOKSALES (bookid, purchaseid)
values (112663, 321);
insert into BOOKSALES (bookid, purchaseid)
values (112667, 123);
insert into BOOKSALES (bookid, purchaseid)
values (121212, 371);
insert into BOOKSALES (bookid, purchaseid)
values (131313, 1930);
insert into BOOKSALES (bookid, purchaseid)
values (131313, 2674);
insert into BOOKSALES (bookid, purchaseid)
values (161616, 321);
insert into BOOKSALES (bookid, purchaseid)
values (161616, 456);
insert into BOOKSALES (bookid, purchaseid)
values (161616, 6997);
commit;
prompt 759 records loaded
prompt Loading MEMBERSHIP...
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (630114321, to_date('06-08-2023', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'), '6-month', 627648086);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (937062242, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'), 'year', 401282566);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (404357849, to_date('08-08-2023', 'dd-mm-yyyy'), to_date('14-10-2024', 'dd-mm-yyyy'), 'month', 294340413);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (751214428, to_date('07-08-2023', 'dd-mm-yyyy'), to_date('17-09-2024', 'dd-mm-yyyy'), 'year', 165389268);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (771164750, to_date('26-06-2023', 'dd-mm-yyyy'), to_date('15-09-2024', 'dd-mm-yyyy'), 'month', 399186364);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (566442060, to_date('05-09-2023', 'dd-mm-yyyy'), to_date('31-10-2024', 'dd-mm-yyyy'), 'month', 300062466);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (470225382, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('10-09-2024', 'dd-mm-yyyy'), '6-month', 449457599);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (388945250, to_date('29-06-2023', 'dd-mm-yyyy'), to_date('04-06-2024', 'dd-mm-yyyy'), 'month', 581317488);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (263723733, to_date('14-09-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 'month', 225307756);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (543693334, to_date('09-09-2023', 'dd-mm-yyyy'), to_date('25-09-2024', 'dd-mm-yyyy'), '6-month', 417183880);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (449746053, to_date('07-01-2023', 'dd-mm-yyyy'), to_date('22-07-2024', 'dd-mm-yyyy'), 'month', 123329657);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (458666362, to_date('23-03-2023', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), 'year', 508936899);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (462518233, to_date('21-11-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), 'year', 192504260);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (913453054, to_date('18-12-2023', 'dd-mm-yyyy'), to_date('26-09-2024', 'dd-mm-yyyy'), 'month', 912201109);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (995706603, to_date('29-10-2023', 'dd-mm-yyyy'), to_date('08-01-2024', 'dd-mm-yyyy'), '6-month', 689650907);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (139354447, to_date('24-10-2023', 'dd-mm-yyyy'), to_date('19-07-2024', 'dd-mm-yyyy'), '6-month', 721838773);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (424396553, to_date('05-05-2023', 'dd-mm-yyyy'), to_date('05-06-2024', 'dd-mm-yyyy'), 'year', 659242904);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (958535900, to_date('10-02-2023', 'dd-mm-yyyy'), to_date('06-12-2024', 'dd-mm-yyyy'), '6-month', 561339567);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (587658910, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('03-09-2024', 'dd-mm-yyyy'), '6-month', 918411684);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (876326398, to_date('27-12-2023', 'dd-mm-yyyy'), to_date('28-07-2024', 'dd-mm-yyyy'), 'month', 472169395);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (509219956, to_date('16-07-2023', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), 'month', 420639562);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (294014141, to_date('23-03-2023', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'), 'year', 236750514);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (256726556, to_date('05-07-2023', 'dd-mm-yyyy'), to_date('14-07-2024', 'dd-mm-yyyy'), 'month', 545448531);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (503156270, to_date('18-07-2023', 'dd-mm-yyyy'), to_date('24-10-2024', 'dd-mm-yyyy'), '6-month', 725731892);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (886032678, to_date('16-04-2023', 'dd-mm-yyyy'), to_date('07-10-2024', 'dd-mm-yyyy'), 'month', 583491287);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (225037305, to_date('26-02-2023', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), '6-month', 724905945);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (532394437, to_date('16-08-2023', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), 'month', 542605612);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (385258287, to_date('27-05-2023', 'dd-mm-yyyy'), to_date('15-01-2024', 'dd-mm-yyyy'), 'year', 669597925);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (671695510, to_date('15-05-2023', 'dd-mm-yyyy'), to_date('18-09-2024', 'dd-mm-yyyy'), '6-month', 671146058);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (785912490, to_date('12-08-2023', 'dd-mm-yyyy'), to_date('13-07-2024', 'dd-mm-yyyy'), 'year', 906571901);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (739450310, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'), 'month', 725731892);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (461121790, to_date('27-02-2023', 'dd-mm-yyyy'), to_date('19-07-2024', 'dd-mm-yyyy'), 'month', 631849990);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (639951323, to_date('19-05-2023', 'dd-mm-yyyy'), to_date('21-08-2024', 'dd-mm-yyyy'), 'month', 861809618);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (194592867, to_date('03-07-2023', 'dd-mm-yyyy'), to_date('24-08-2024', 'dd-mm-yyyy'), 'year', 806862152);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (290543000, to_date('06-11-2023', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'), '6-month', 194232301);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (901811217, to_date('09-03-2023', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'), 'year', 455838725);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (241607148, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('18-06-2024', 'dd-mm-yyyy'), 'year', 691582492);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (982377877, to_date('26-02-2023', 'dd-mm-yyyy'), to_date('18-08-2024', 'dd-mm-yyyy'), 'year', 766023468);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (192696175, to_date('19-10-2023', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), 'month', 804212216);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (333408971, to_date('18-07-2023', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), 'month', 817343643);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (865039157, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('20-06-2024', 'dd-mm-yyyy'), 'month', 429620988);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (540377334, to_date('25-05-2023', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'), 'month', 725086744);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (639526099, to_date('06-08-2023', 'dd-mm-yyyy'), to_date('08-07-2024', 'dd-mm-yyyy'), 'year', 399186364);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (901993152, to_date('24-04-2023', 'dd-mm-yyyy'), to_date('30-06-2024', 'dd-mm-yyyy'), 'year', 362292428);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (956373672, to_date('04-01-2023', 'dd-mm-yyyy'), to_date('28-01-2024', 'dd-mm-yyyy'), '6-month', 918411684);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (496970127, to_date('14-08-2023', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), 'year', 143136513);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (780541595, to_date('14-02-2023', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), '6-month', 401282566);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (374901123, to_date('25-01-2023', 'dd-mm-yyyy'), to_date('22-09-2024', 'dd-mm-yyyy'), '6-month', 937782877);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (519672109, to_date('28-07-2023', 'dd-mm-yyyy'), to_date('27-12-2024', 'dd-mm-yyyy'), 'year', 121281852);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (663047467, to_date('08-04-2023', 'dd-mm-yyyy'), to_date('07-08-2024', 'dd-mm-yyyy'), 'month', 108115017);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (403204957, to_date('17-10-2023', 'dd-mm-yyyy'), to_date('30-11-2024', 'dd-mm-yyyy'), '6-month', 122753845);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (800291250, to_date('11-08-2023', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 'month', 287753188);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (155714666, to_date('07-04-2023', 'dd-mm-yyyy'), to_date('30-07-2024', 'dd-mm-yyyy'), 'month', 950783774);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (659636858, to_date('09-06-2023', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'), 'month', 942723809);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (333341433, to_date('19-09-2023', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 'year', 503985065);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (502476696, to_date('19-03-2023', 'dd-mm-yyyy'), to_date('30-08-2024', 'dd-mm-yyyy'), 'year', 285837012);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (654757589, to_date('15-06-2023', 'dd-mm-yyyy'), to_date('25-09-2024', 'dd-mm-yyyy'), '6-month', 561339567);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (364258387, to_date('18-06-2023', 'dd-mm-yyyy'), to_date('15-09-2024', 'dd-mm-yyyy'), 'year', 794558299);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (917110421, to_date('28-01-2023', 'dd-mm-yyyy'), to_date('18-01-2024', 'dd-mm-yyyy'), 'year', 725086744);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (167583525, to_date('04-12-2023', 'dd-mm-yyyy'), to_date('08-12-2024', 'dd-mm-yyyy'), 'month', 610054864);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (890141272, to_date('01-02-2023', 'dd-mm-yyyy'), to_date('22-07-2024', 'dd-mm-yyyy'), 'month', 241803888);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (649787729, to_date('16-09-2023', 'dd-mm-yyyy'), to_date('19-10-2024', 'dd-mm-yyyy'), 'month', 134230339);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (430207791, to_date('09-05-2023', 'dd-mm-yyyy'), to_date('06-12-2024', 'dd-mm-yyyy'), 'month', 583202281);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (825481983, to_date('08-10-2023', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'), 'month', 165389268);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (136146182, to_date('10-11-2023', 'dd-mm-yyyy'), to_date('03-08-2024', 'dd-mm-yyyy'), 'month', 875284104);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (765391415, to_date('29-12-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 'year', 956801078);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (917052891, to_date('24-03-2023', 'dd-mm-yyyy'), to_date('28-12-2024', 'dd-mm-yyyy'), '6-month', 108115017);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (845415974, to_date('02-11-2023', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'), '6-month', 800709965);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (283271125, to_date('19-06-2023', 'dd-mm-yyyy'), to_date('03-07-2024', 'dd-mm-yyyy'), '6-month', 131740753);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (215014519, to_date('29-03-2023', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'), 'year', 237823390);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (578430287, to_date('19-04-2023', 'dd-mm-yyyy'), to_date('21-09-2024', 'dd-mm-yyyy'), 'year', 947427896);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (315702123, to_date('04-08-2023', 'dd-mm-yyyy'), to_date('16-10-2024', 'dd-mm-yyyy'), 'month', 455838725);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (485369547, to_date('03-03-2023', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), 'month', 140924331);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (376164198, to_date('23-05-2023', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'), 'month', 605694546);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (305860707, to_date('11-12-2023', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), 'month', 192504260);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (881731093, to_date('14-12-2023', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), '6-month', 522778039);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (533024575, to_date('10-03-2023', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'), 'month', 301020418);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (612730241, to_date('29-08-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), '6-month', 599844884);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (287189620, to_date('26-12-2023', 'dd-mm-yyyy'), to_date('02-05-2024', 'dd-mm-yyyy'), '6-month', 749939457);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (796764491, to_date('29-11-2023', 'dd-mm-yyyy'), to_date('05-01-2024', 'dd-mm-yyyy'), 'month', 390851039);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (106264267, to_date('17-08-2023', 'dd-mm-yyyy'), to_date('10-09-2024', 'dd-mm-yyyy'), 'month', 689650907);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (154908286, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('02-10-2024', 'dd-mm-yyyy'), 'year', 725769483);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (407118167, to_date('05-12-2023', 'dd-mm-yyyy'), to_date('24-12-2024', 'dd-mm-yyyy'), 'Yearly', 255266167);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (738057671, to_date('04-10-2023', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'), 'year', 249557147);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (279104166, to_date('05-12-2023', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), '6-month', 940073998);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (141051884, to_date('10-08-2023', 'dd-mm-yyyy'), to_date('06-09-2024', 'dd-mm-yyyy'), '6-month', 345395796);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (984317604, to_date('31-12-2023', 'dd-mm-yyyy'), to_date('12-02-2024', 'dd-mm-yyyy'), 'month', 437393325);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (201730336, to_date('22-03-2023', 'dd-mm-yyyy'), to_date('18-09-2024', 'dd-mm-yyyy'), 'year', 545448531);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (729154158, to_date('04-02-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), '6-month', 617468816);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (764386375, to_date('27-11-2023', 'dd-mm-yyyy'), to_date('18-01-2024', 'dd-mm-yyyy'), '6-month', 688306157);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (735277194, to_date('01-04-2023', 'dd-mm-yyyy'), to_date('31-03-2024', 'dd-mm-yyyy'), '6-month', 210106163);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (748552423, to_date('10-01-2023', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), '6-month', 421988038);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (863472278, to_date('27-02-2023', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 'year', 917606772);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (754411712, to_date('19-12-2023', 'dd-mm-yyyy'), to_date('10-10-2024', 'dd-mm-yyyy'), 'year', 258121065);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (406516784, to_date('13-05-2023', 'dd-mm-yyyy'), to_date('11-06-2024', 'dd-mm-yyyy'), 'year', 673479105);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (673120348, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'), 'month', 316124648);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (768342865, to_date('12-08-2023', 'dd-mm-yyyy'), to_date('13-05-2024', 'dd-mm-yyyy'), 'year', 123456789);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (338243466, to_date('07-01-2023', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 'year', 352081244);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (301581799, to_date('24-01-2023', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), 'month', 162396918);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (237615960, to_date('16-10-2023', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), 'month', 930733425);
commit;
prompt 100 records committed...
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (649703090, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 'year', 234377155);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (857112039, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('03-10-2024', 'dd-mm-yyyy'), 'year', 697081561);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (655524600, to_date('27-02-2023', 'dd-mm-yyyy'), to_date('05-10-2024', 'dd-mm-yyyy'), 'month', 673479105);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (997566111, to_date('01-05-2023', 'dd-mm-yyyy'), to_date('31-12-2024', 'dd-mm-yyyy'), '6-month', 697412816);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (281612280, to_date('06-10-2023', 'dd-mm-yyyy'), to_date('14-12-2024', 'dd-mm-yyyy'), 'year', 278575869);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (878759041, to_date('04-02-2023', 'dd-mm-yyyy'), to_date('05-01-2024', 'dd-mm-yyyy'), 'month', 788254160);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (785779144, to_date('21-08-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), '6-month', 278052511);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (892258639, to_date('21-11-2023', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 'year', 542435161);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (810337662, to_date('12-01-2023', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'), 'year', 956801078);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (501926578, to_date('18-07-2023', 'dd-mm-yyyy'), to_date('03-11-2024', 'dd-mm-yyyy'), '6-month', 510440272);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (523810221, to_date('05-06-2023', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), 'month', 719289034);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (193789388, to_date('25-03-2023', 'dd-mm-yyyy'), to_date('12-03-2024', 'dd-mm-yyyy'), 'year', 342543356);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (143707829, to_date('12-11-2023', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'), 'month', 514086159);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (394409560, to_date('02-12-2023', 'dd-mm-yyyy'), to_date('05-12-2024', 'dd-mm-yyyy'), 'Yearly', 782002700);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (395903599, to_date('21-08-2023', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 'month', 508936899);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (297911357, to_date('20-01-2023', 'dd-mm-yyyy'), to_date('23-10-2024', 'dd-mm-yyyy'), '6-month', 706361513);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (220622917, to_date('04-02-2023', 'dd-mm-yyyy'), to_date('07-10-2024', 'dd-mm-yyyy'), 'year', 800709965);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (466711714, to_date('15-10-2023', 'dd-mm-yyyy'), to_date('05-07-2024', 'dd-mm-yyyy'), 'year', 943740069);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (678659195, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('11-08-2024', 'dd-mm-yyyy'), '6-month', 513484972);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (764364938, to_date('08-01-2023', 'dd-mm-yyyy'), to_date('03-08-2024', 'dd-mm-yyyy'), 'month', 697081561);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (147798518, to_date('19-12-2023', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'), 'year', 954578245);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (184489073, to_date('07-02-2023', 'dd-mm-yyyy'), to_date('09-10-2024', 'dd-mm-yyyy'), 'month', 636694801);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (350552319, to_date('23-10-2023', 'dd-mm-yyyy'), to_date('04-02-2024', 'dd-mm-yyyy'), 'month', 346065648);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (872428147, to_date('31-07-2023', 'dd-mm-yyyy'), to_date('07-10-2024', 'dd-mm-yyyy'), '6-month', 263933120);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (522167175, to_date('24-12-2023', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'), 'year', 510440272);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (933845079, to_date('29-05-2023', 'dd-mm-yyyy'), to_date('17-12-2024', 'dd-mm-yyyy'), 'year', 674942711);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (374216694, to_date('19-02-2023', 'dd-mm-yyyy'), to_date('25-07-2024', 'dd-mm-yyyy'), '6-month', 938901812);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (503092362, to_date('30-05-2023', 'dd-mm-yyyy'), to_date('28-05-2024', 'dd-mm-yyyy'), 'year', 986298985);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (586109088, to_date('29-08-2023', 'dd-mm-yyyy'), to_date('07-12-2024', 'dd-mm-yyyy'), 'year', 299967787);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (815680702, to_date('11-05-2023', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), 'month', 220530132);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (682132259, to_date('25-11-2023', 'dd-mm-yyyy'), to_date('03-08-2024', 'dd-mm-yyyy'), 'month', 799220603);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (928096211, to_date('21-07-2023', 'dd-mm-yyyy'), to_date('21-08-2024', 'dd-mm-yyyy'), 'year', 584051995);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (587307829, to_date('13-02-2023', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), 'year', 868910800);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (864307943, to_date('21-04-2023', 'dd-mm-yyyy'), to_date('12-11-2024', 'dd-mm-yyyy'), 'year', 165940640);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (310716132, to_date('06-03-2023', 'dd-mm-yyyy'), to_date('11-05-2024', 'dd-mm-yyyy'), 'month', 817458147);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (570963520, to_date('18-06-2023', 'dd-mm-yyyy'), to_date('28-09-2024', 'dd-mm-yyyy'), 'month', 181840584);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (213665769, to_date('15-09-2023', 'dd-mm-yyyy'), to_date('13-10-2024', 'dd-mm-yyyy'), '6-month', 804212216);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (781019561, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('27-10-2024', 'dd-mm-yyyy'), 'year', 669597925);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (955675088, to_date('10-12-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 'month', 542907098);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (303437604, to_date('16-08-2023', 'dd-mm-yyyy'), to_date('04-10-2024', 'dd-mm-yyyy'), 'year', 657420745);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (275481101, to_date('26-03-2023', 'dd-mm-yyyy'), to_date('07-10-2024', 'dd-mm-yyyy'), 'month', 780324751);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (820680693, to_date('14-05-2023', 'dd-mm-yyyy'), to_date('17-06-2024', 'dd-mm-yyyy'), 'month', 843168457);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (219753262, to_date('03-12-2023', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'), 'month', 669392193);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (667042885, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('19-08-2024', 'dd-mm-yyyy'), 'year', 696875532);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (664097676, to_date('18-06-2023', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), '6-month', 813641457);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (860165094, to_date('21-06-2023', 'dd-mm-yyyy'), to_date('13-08-2024', 'dd-mm-yyyy'), '6-month', 278052511);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (956003727, to_date('24-10-2023', 'dd-mm-yyyy'), to_date('08-10-2024', 'dd-mm-yyyy'), 'year', 313269756);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (668562728, to_date('18-05-2023', 'dd-mm-yyyy'), to_date('18-02-2024', 'dd-mm-yyyy'), 'year', 480311544);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (900588663, to_date('30-11-2023', 'dd-mm-yyyy'), to_date('19-10-2024', 'dd-mm-yyyy'), 'month', 428081030);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (283028753, to_date('03-03-2023', 'dd-mm-yyyy'), to_date('01-12-2024', 'dd-mm-yyyy'), '6-month', 319362863);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (137883139, to_date('02-01-2023', 'dd-mm-yyyy'), to_date('16-08-2024', 'dd-mm-yyyy'), 'year', 943740069);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (813031361, to_date('28-01-2023', 'dd-mm-yyyy'), to_date('24-12-2024', 'dd-mm-yyyy'), 'year', 943647325);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (309092794, to_date('20-02-2023', 'dd-mm-yyyy'), to_date('22-06-2024', 'dd-mm-yyyy'), '6-month', 942723809);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (142288669, to_date('26-07-2023', 'dd-mm-yyyy'), to_date('18-10-2024', 'dd-mm-yyyy'), '6-month', 325511943);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (687395364, to_date('19-02-2023', 'dd-mm-yyyy'), to_date('02-05-2024', 'dd-mm-yyyy'), 'month', 725086744);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (145344492, to_date('22-03-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), 'month', 943647325);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (947379378, to_date('11-01-2023', 'dd-mm-yyyy'), to_date('26-10-2024', 'dd-mm-yyyy'), '6-month', 124217936);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (314388695, to_date('14-09-2023', 'dd-mm-yyyy'), to_date('22-01-2024', 'dd-mm-yyyy'), 'year', 837815367);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (177040195, to_date('12-02-2023', 'dd-mm-yyyy'), to_date('25-05-2024', 'dd-mm-yyyy'), '6-month', 938819453);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (583347858, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'), '6-month', 666319395);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (390172432, to_date('06-11-2023', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), '6-month', 943740069);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (873759305, to_date('06-03-2023', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), '6-month', 688306157);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (863680322, to_date('21-06-2023', 'dd-mm-yyyy'), to_date('01-09-2024', 'dd-mm-yyyy'), '6-month', 162396918);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (108589167, to_date('19-11-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 'month', 669392193);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (478046153, to_date('12-12-2023', 'dd-mm-yyyy'), to_date('10-12-2024', 'dd-mm-yyyy'), 'month', 483436747);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (474378759, to_date('03-03-2023', 'dd-mm-yyyy'), to_date('13-05-2024', 'dd-mm-yyyy'), 'year', 799220603);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (375616862, to_date('07-02-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), 'year', 697081561);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (910507217, to_date('18-09-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), '6-month', 129018780);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (185833148, to_date('29-06-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 'year', 886879923);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (330412353, to_date('10-10-2023', 'dd-mm-yyyy'), to_date('06-12-2024', 'dd-mm-yyyy'), 'year', 691582492);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (765851169, to_date('03-11-2023', 'dd-mm-yyyy'), to_date('02-08-2024', 'dd-mm-yyyy'), 'year', 598119884);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (974688821, to_date('06-06-2023', 'dd-mm-yyyy'), to_date('23-06-2024', 'dd-mm-yyyy'), '6-month', 906439118);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (445997971, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'), '6-month', 162396918);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (224823512, to_date('12-11-2023', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), '6-month', 122807530);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (158621953, to_date('24-05-2023', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'), 'year', 671146058);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (490424543, to_date('24-05-2023', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), 'month', 778703444);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (196178399, to_date('09-06-2023', 'dd-mm-yyyy'), to_date('03-11-2024', 'dd-mm-yyyy'), 'month', 780026125);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (567184496, to_date('15-11-2023', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), '6-month', 736690718);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (871151012, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('18-09-2024', 'dd-mm-yyyy'), '6-month', 720514714);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (211703677, to_date('18-04-2023', 'dd-mm-yyyy'), to_date('29-09-2024', 'dd-mm-yyyy'), '6-month', 807905294);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (543662252, to_date('09-12-2023', 'dd-mm-yyyy'), to_date('03-09-2024', 'dd-mm-yyyy'), 'year', 401282566);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (337137289, to_date('26-02-2023', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 'year', 426285667);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (896447673, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), 'year', 196581216);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (320035660, to_date('06-02-2023', 'dd-mm-yyyy'), to_date('07-07-2024', 'dd-mm-yyyy'), '6-month', 300062466);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (278617302, to_date('08-09-2023', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'), '6-month', 688306157);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (988728943, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('30-12-2024', 'dd-mm-yyyy'), 'month', 436250931);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (880463884, to_date('05-12-2023', 'dd-mm-yyyy'), to_date('08-09-2024', 'dd-mm-yyyy'), 'month', 631849990);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (152774195, to_date('21-05-2023', 'dd-mm-yyyy'), to_date('26-11-2024', 'dd-mm-yyyy'), '6-month', 122807530);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (738324792, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 'year', 471730270);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (942614241, to_date('01-01-2023', 'dd-mm-yyyy'), to_date('29-10-2024', 'dd-mm-yyyy'), '6-month', 389914550);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (850894843, to_date('15-07-2023', 'dd-mm-yyyy'), to_date('24-10-2024', 'dd-mm-yyyy'), 'month', 868910800);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (243696524, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('03-12-2024', 'dd-mm-yyyy'), 'month', 837815367);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (522572742, to_date('25-01-2023', 'dd-mm-yyyy'), to_date('24-08-2024', 'dd-mm-yyyy'), 'year', 253985889);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (666089055, to_date('12-05-2023', 'dd-mm-yyyy'), to_date('26-01-2024', 'dd-mm-yyyy'), 'month', 719289034);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (204734671, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'), 'year', 439553439);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (790810221, to_date('14-07-2023', 'dd-mm-yyyy'), to_date('23-10-2024', 'dd-mm-yyyy'), 'month', 399186364);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (158758366, to_date('06-06-2023', 'dd-mm-yyyy'), to_date('10-06-2024', 'dd-mm-yyyy'), '6-month', 374349078);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (692171140, to_date('05-05-2023', 'dd-mm-yyyy'), to_date('05-07-2024', 'dd-mm-yyyy'), 'year', 818787363);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (677484069, to_date('09-08-2023', 'dd-mm-yyyy'), to_date('27-07-2024', 'dd-mm-yyyy'), 'month', 906571901);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (628917290, to_date('14-11-2023', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 'month', 673479105);
commit;
prompt 200 records committed...
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (759403711, to_date('25-03-2023', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), 'month', 669392193);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (699037603, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('30-05-2024', 'dd-mm-yyyy'), 'month', 788384990);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (278675383, to_date('02-01-2023', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), '6-month', 325625541);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (448355397, to_date('07-08-2023', 'dd-mm-yyyy'), to_date('12-09-2024', 'dd-mm-yyyy'), '6-month', 906439118);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (369997854, to_date('24-04-2023', 'dd-mm-yyyy'), to_date('04-06-2024', 'dd-mm-yyyy'), '6-month', 334500851);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (909723808, to_date('10-02-2023', 'dd-mm-yyyy'), to_date('06-06-2024', 'dd-mm-yyyy'), 'year', 420639562);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (480189266, to_date('03-07-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), 'year', 589587031);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (799260052, to_date('08-04-2023', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), 'month', 795240217);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (615051750, to_date('02-02-2023', 'dd-mm-yyyy'), to_date('14-06-2024', 'dd-mm-yyyy'), '6-month', 766023468);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (877763210, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), 'year', 301020418);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (258189742, to_date('12-09-2023', 'dd-mm-yyyy'), to_date('01-12-2024', 'dd-mm-yyyy'), '6-month', 729109513);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (265116797, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('21-09-2024', 'dd-mm-yyyy'), '6-month', 345395796);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (918040077, to_date('11-06-2023', 'dd-mm-yyyy'), to_date('19-11-2024', 'dd-mm-yyyy'), 'month', 940073998);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (797470222, to_date('28-04-2023', 'dd-mm-yyyy'), to_date('27-10-2024', 'dd-mm-yyyy'), 'month', 389436980);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (794243529, to_date('02-01-2023', 'dd-mm-yyyy'), to_date('18-04-2024', 'dd-mm-yyyy'), 'month', 281153050);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (755852197, to_date('16-04-2023', 'dd-mm-yyyy'), to_date('08-11-2024', 'dd-mm-yyyy'), 'month', 706217250);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (321744107, to_date('08-04-2023', 'dd-mm-yyyy'), to_date('20-07-2024', 'dd-mm-yyyy'), 'month', 671146058);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (153068105, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 'year', 522778039);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (842672651, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('06-07-2024', 'dd-mm-yyyy'), '6-month', 258121065);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (169129756, to_date('09-07-2023', 'dd-mm-yyyy'), to_date('08-10-2024', 'dd-mm-yyyy'), 'year', 325625541);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (877286337, to_date('19-11-2023', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), 'month', 389914550);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (581222508, to_date('29-12-2023', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'), '6-month', 666319395);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (380090546, to_date('25-08-2023', 'dd-mm-yyyy'), to_date('16-02-2024', 'dd-mm-yyyy'), 'month', 956801078);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (282818583, to_date('11-10-2023', 'dd-mm-yyyy'), to_date('26-09-2024', 'dd-mm-yyyy'), 'year', 788384990);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (12121212, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), ' year', 123456789);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (13131313, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'), 'Yearly', 544125895);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (23232323, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 'Yearly', 245556898);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (101, to_date('01-01-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 'Basic', 1);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (102, to_date('01-02-2023', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 'Premium', 2);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (103, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'), 'Gold', 3);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (104, to_date('01-04-2023', 'dd-mm-yyyy'), to_date('01-04-2024', 'dd-mm-yyyy'), 'Yearly', 4);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (105, to_date('01-05-2023', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 'Platinum', 5);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (106, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'), 'Diamond', 6);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (107, to_date('01-07-2023', 'dd-mm-yyyy'), to_date('01-07-2024', 'dd-mm-yyyy'), 'Basic', 7);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (108, to_date('01-08-2023', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), 'Premium', 8);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (109, to_date('01-09-2023', 'dd-mm-yyyy'), to_date('01-09-2024', 'dd-mm-yyyy'), 'Gold', 9);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (110, to_date('01-10-2023', 'dd-mm-yyyy'), to_date('01-10-2024', 'dd-mm-yyyy'), 'Silver', 10);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (815821783, to_date('10-11-2023', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), 'year', 821182940);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (434103543, to_date('18-07-2023', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), 'Yearly', 544125895);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (844355089, to_date('18-11-2023', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), 'month', 278052511);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (793184807, to_date('07-02-2023', 'dd-mm-yyyy'), to_date('26-10-2024', 'dd-mm-yyyy'), 'month', 696875532);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (843431335, to_date('02-02-2023', 'dd-mm-yyyy'), to_date('13-12-2024', 'dd-mm-yyyy'), 'month', 236750514);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (746660840, to_date('23-09-2023', 'dd-mm-yyyy'), to_date('27-11-2024', 'dd-mm-yyyy'), 'year', 389914550);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (304044106, to_date('12-11-2023', 'dd-mm-yyyy'), to_date('29-08-2024', 'dd-mm-yyyy'), 'month', 501163002);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (734935794, to_date('07-01-2023', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'), 'month', 780324751);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (373323379, to_date('09-09-2023', 'dd-mm-yyyy'), to_date('27-06-2024', 'dd-mm-yyyy'), '6-month', 688306157);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (512766504, to_date('22-04-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), '6-month', 754327619);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (768624503, to_date('11-05-2023', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 'month', 278575869);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (165816794, to_date('12-11-2023', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 'month', 778296365);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (443899257, to_date('26-02-2023', 'dd-mm-yyyy'), to_date('25-12-2024', 'dd-mm-yyyy'), 'year', 390851039);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (248440900, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), 'year', 790547437);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (762715618, to_date('15-02-2023', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 'month', 930733425);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (524403639, to_date('06-11-2023', 'dd-mm-yyyy'), to_date('06-01-2024', 'dd-mm-yyyy'), 'year', 216899652);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (705543339, to_date('15-01-2023', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), '6-month', 825936905);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (685526914, to_date('19-09-2023', 'dd-mm-yyyy'), to_date('15-01-2024', 'dd-mm-yyyy'), 'month', 268305846);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (375099840, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 'month', 472169395);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (478683417, to_date('09-08-2023', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'), 'year', 291414436);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (376666129, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('25-11-2024', 'dd-mm-yyyy'), '6-month', 780324751);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (314606627, to_date('20-08-2023', 'dd-mm-yyyy'), to_date('16-06-2024', 'dd-mm-yyyy'), 'month', 447792762);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (847947493, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('07-11-2024', 'dd-mm-yyyy'), '6-month', 836348702);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (520382614, to_date('07-12-2023', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'), '6-month', 524965504);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (959909406, to_date('17-01-2023', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'), '6-month', 766023468);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (341926816, to_date('04-01-2023', 'dd-mm-yyyy'), to_date('28-08-2024', 'dd-mm-yyyy'), 'month', 113323897);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (110222211, to_date('06-05-2023', 'dd-mm-yyyy'), to_date('30-01-2024', 'dd-mm-yyyy'), 'year', 999414117);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (726111571, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('08-10-2024', 'dd-mm-yyyy'), 'year', 192504260);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (787716768, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('14-08-2024', 'dd-mm-yyyy'), 'month', 285837012);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (738149374, to_date('21-03-2023', 'dd-mm-yyyy'), to_date('03-12-2024', 'dd-mm-yyyy'), '6-month', 514086159);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (394866019, to_date('01-08-2023', 'dd-mm-yyyy'), to_date('19-08-2024', 'dd-mm-yyyy'), 'year', 421262884);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (117458245, to_date('16-08-2023', 'dd-mm-yyyy'), to_date('29-12-2024', 'dd-mm-yyyy'), 'month', 729109513);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (983764453, to_date('02-02-2023', 'dd-mm-yyyy'), to_date('31-03-2024', 'dd-mm-yyyy'), 'year', 399186364);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (960892804, to_date('15-02-2023', 'dd-mm-yyyy'), to_date('27-07-2024', 'dd-mm-yyyy'), '6-month', 374349078);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (264191618, to_date('24-12-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 'year', 202719248);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (500596502, to_date('19-12-2023', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), 'month', 132169290);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (630292710, to_date('09-01-2023', 'dd-mm-yyyy'), to_date('11-05-2024', 'dd-mm-yyyy'), 'month', 198213026);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (802138577, to_date('07-07-2023', 'dd-mm-yyyy'), to_date('20-12-2024', 'dd-mm-yyyy'), 'year', 222833529);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (168959856, to_date('19-11-2023', 'dd-mm-yyyy'), to_date('27-06-2024', 'dd-mm-yyyy'), '6-month', 253985889);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (653419379, to_date('06-05-2023', 'dd-mm-yyyy'), to_date('15-11-2024', 'dd-mm-yyyy'), 'month', 741906391);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (787007963, to_date('06-10-2023', 'dd-mm-yyyy'), to_date('01-09-2024', 'dd-mm-yyyy'), '6-month', 131740753);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (402861870, to_date('06-02-2023', 'dd-mm-yyyy'), to_date('30-07-2024', 'dd-mm-yyyy'), 'month', 703141922);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (575861765, to_date('26-02-2023', 'dd-mm-yyyy'), to_date('04-02-2024', 'dd-mm-yyyy'), 'year', 331947476);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (385615969, to_date('13-02-2023', 'dd-mm-yyyy'), to_date('17-09-2024', 'dd-mm-yyyy'), 'month', 540858162);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (873584503, to_date('18-09-2023', 'dd-mm-yyyy'), to_date('06-11-2024', 'dd-mm-yyyy'), 'year', 666319395);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (397893611, to_date('02-10-2023', 'dd-mm-yyyy'), to_date('24-12-2024', 'dd-mm-yyyy'), '6-month', 365095569);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (642033689, to_date('05-07-2023', 'dd-mm-yyyy'), to_date('09-10-2024', 'dd-mm-yyyy'), '6-month', 220530132);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (530049178, to_date('02-03-2023', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'), 'year', 306366983);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (176792198, to_date('22-11-2023', 'dd-mm-yyyy'), to_date('27-06-2024', 'dd-mm-yyyy'), 'month', 589587031);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (193795540, to_date('14-10-2023', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 'month', 808917655);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (395627942, to_date('28-08-2023', 'dd-mm-yyyy'), to_date('20-11-2024', 'dd-mm-yyyy'), '6-month', 342543356);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (475055482, to_date('05-12-2023', 'dd-mm-yyyy'), to_date('11-03-2024', 'dd-mm-yyyy'), 'year', 989150100);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (312078600, to_date('05-11-2023', 'dd-mm-yyyy'), to_date('29-10-2024', 'dd-mm-yyyy'), 'month', 583491287);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (831011324, to_date('05-06-2023', 'dd-mm-yyyy'), to_date('26-06-2024', 'dd-mm-yyyy'), 'month', 448016271);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (739802838, to_date('16-07-2023', 'dd-mm-yyyy'), to_date('03-06-2024', 'dd-mm-yyyy'), 'month', 803780520);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (812237126, to_date('09-03-2023', 'dd-mm-yyyy'), to_date('13-07-2024', 'dd-mm-yyyy'), '6-month', 599264563);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (524889838, to_date('16-08-2023', 'dd-mm-yyyy'), to_date('22-11-2024', 'dd-mm-yyyy'), 'month', 221469518);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (784232122, to_date('01-11-2023', 'dd-mm-yyyy'), to_date('01-04-2024', 'dd-mm-yyyy'), '6-month', 417183880);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (340990767, to_date('02-03-2023', 'dd-mm-yyyy'), to_date('17-12-2024', 'dd-mm-yyyy'), 'month', 374349078);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (151401030, to_date('08-01-2023', 'dd-mm-yyyy'), to_date('04-12-2024', 'dd-mm-yyyy'), 'month', 788384990);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (995459104, to_date('13-01-2023', 'dd-mm-yyyy'), to_date('20-11-2024', 'dd-mm-yyyy'), '6-month', 804212216);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (665983784, to_date('23-03-2023', 'dd-mm-yyyy'), to_date('14-10-2024', 'dd-mm-yyyy'), 'month', 483436747);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (552847548, to_date('06-12-2023', 'dd-mm-yyyy'), to_date('24-10-2024', 'dd-mm-yyyy'), 'month', 671146058);
commit;
prompt 300 records committed...
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (738284127, to_date('09-09-2023', 'dd-mm-yyyy'), to_date('07-12-2024', 'dd-mm-yyyy'), '6-month', 697081561);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (527912583, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('10-12-2024', 'dd-mm-yyyy'), 'year', 249341091);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (730876876, to_date('17-01-2023', 'dd-mm-yyyy'), to_date('15-06-2024', 'dd-mm-yyyy'), 'month', 470027926);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (366905800, to_date('10-05-2023', 'dd-mm-yyyy'), to_date('19-07-2024', 'dd-mm-yyyy'), 'month', 449457599);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (745841722, to_date('21-05-2023', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'), 'year', 197764210);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (739047298, to_date('01-08-2023', 'dd-mm-yyyy'), to_date('06-08-2024', 'dd-mm-yyyy'), 'year', 281153050);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (805791373, to_date('31-03-2023', 'dd-mm-yyyy'), to_date('04-02-2024', 'dd-mm-yyyy'), 'year', 205673704);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (442767406, to_date('24-08-2023', 'dd-mm-yyyy'), to_date('22-05-2024', 'dd-mm-yyyy'), 'year', 265517964);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (982725203, to_date('04-03-2023', 'dd-mm-yyyy'), to_date('01-09-2024', 'dd-mm-yyyy'), '6-month', 220530132);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (189525768, to_date('19-12-2023', 'dd-mm-yyyy'), to_date('12-08-2024', 'dd-mm-yyyy'), 'year', 164240019);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (491150101, to_date('02-01-2023', 'dd-mm-yyyy'), to_date('27-08-2024', 'dd-mm-yyyy'), 'month', 681343156);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (633509192, to_date('20-07-2023', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), '6-month', 218295795);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (363230140, to_date('03-07-2023', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 'year', 736690718);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (975339248, to_date('19-12-2023', 'dd-mm-yyyy'), to_date('19-12-2024', 'dd-mm-yyyy'), 'year', 480311544);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (752384868, to_date('27-07-2023', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), '6-month', 912201109);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (782844118, to_date('05-05-2023', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), '6-month', 938901812);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (447353253, to_date('19-02-2023', 'dd-mm-yyyy'), to_date('21-05-2024', 'dd-mm-yyyy'), 'month', 365418624);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (228642358, to_date('28-01-2023', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 'year', 444657296);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (288657879, to_date('07-01-2023', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), 'month', 129018780);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (814527674, to_date('17-12-2023', 'dd-mm-yyyy'), to_date('31-12-2024', 'dd-mm-yyyy'), 'year', 831414158);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (162262914, to_date('03-05-2023', 'dd-mm-yyyy'), to_date('11-12-2024', 'dd-mm-yyyy'), '6-month', 729902851);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (736164728, to_date('21-05-2023', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'), '6-month', 257844327);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (408876185, to_date('02-02-2023', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), '6-month', 278052511);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (480407268, to_date('19-08-2023', 'dd-mm-yyyy'), to_date('09-12-2024', 'dd-mm-yyyy'), 'month', 243930676);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (949868657, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), 'month', 299448259);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (567675010, to_date('19-05-2023', 'dd-mm-yyyy'), to_date('17-10-2024', 'dd-mm-yyyy'), '6-month', 420763488);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (540588090, to_date('25-05-2023', 'dd-mm-yyyy'), to_date('03-09-2024', 'dd-mm-yyyy'), 'month', 868375445);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (834274489, to_date('19-06-2023', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'), '6-month', 918411684);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (764960387, to_date('02-02-2023', 'dd-mm-yyyy'), to_date('24-07-2024', 'dd-mm-yyyy'), 'month', 868910800);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (667948228, to_date('21-05-2023', 'dd-mm-yyyy'), to_date('08-10-2024', 'dd-mm-yyyy'), '6-month', 324274105);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (924301070, to_date('11-09-2023', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), 'year', 631161240);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (678211310, to_date('24-11-2023', 'dd-mm-yyyy'), to_date('26-06-2024', 'dd-mm-yyyy'), 'month', 342543356);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (187475988, to_date('16-02-2023', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'), 'year', 202719248);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (542395308, to_date('17-01-2023', 'dd-mm-yyyy'), to_date('21-08-2024', 'dd-mm-yyyy'), 'month', 697081561);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (393905248, to_date('05-01-2023', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), 'year', 775383331);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (547729312, to_date('14-12-2023', 'dd-mm-yyyy'), to_date('09-10-2024', 'dd-mm-yyyy'), 'month', 549769099);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (233174561, to_date('25-10-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), '6-month', 724905945);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (956154967, to_date('12-07-2023', 'dd-mm-yyyy'), to_date('27-10-2024', 'dd-mm-yyyy'), '6-month', 213783892);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (739293596, to_date('04-10-2023', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), 'month', 202719248);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (772829204, to_date('03-09-2023', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 'year', 524965504);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (312279931, to_date('22-11-2023', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), 'month', 342543356);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (444643156, to_date('17-05-2023', 'dd-mm-yyyy'), to_date('19-01-2024', 'dd-mm-yyyy'), '6-month', 730310194);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (966909780, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'), 'month', 725086744);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (552673158, to_date('30-03-2023', 'dd-mm-yyyy'), to_date('13-08-2024', 'dd-mm-yyyy'), 'Yearly', 544125895);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (414757304, to_date('22-10-2023', 'dd-mm-yyyy'), to_date('16-12-2024', 'dd-mm-yyyy'), 'month', 938459826);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (145771018, to_date('22-02-2023', 'dd-mm-yyyy'), to_date('10-11-2024', 'dd-mm-yyyy'), 'year', 491125002);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (828195372, to_date('30-11-2023', 'dd-mm-yyyy'), to_date('21-05-2024', 'dd-mm-yyyy'), 'year', 720514714);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (855751546, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('18-09-2024', 'dd-mm-yyyy'), 'month', 553370732);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (857884359, to_date('28-11-2023', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), '6-month', 799220603);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (104797792, to_date('28-04-2023', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), 'year', 827905570);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (545455708, to_date('21-12-2023', 'dd-mm-yyyy'), to_date('14-12-2024', 'dd-mm-yyyy'), 'month', 346393390);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (644112825, to_date('25-07-2023', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), '6-month', 919967767);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (636909024, to_date('30-10-2023', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), 'month', 671146058);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (292748777, to_date('11-02-2023', 'dd-mm-yyyy'), to_date('08-10-2024', 'dd-mm-yyyy'), 'year', 483436747);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (334120058, to_date('07-03-2023', 'dd-mm-yyyy'), to_date('20-01-2024', 'dd-mm-yyyy'), 'year', 589587031);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (878366918, to_date('20-11-2023', 'dd-mm-yyyy'), to_date('11-09-2024', 'dd-mm-yyyy'), 'year', 186952282);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (947491921, to_date('03-05-2023', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'), '6-month', 627648086);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (622962389, to_date('30-01-2023', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'), '6-month', 325625541);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (869504296, to_date('27-06-2023', 'dd-mm-yyyy'), to_date('29-09-2024', 'dd-mm-yyyy'), 'month', 837815367);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (256144329, to_date('29-07-2023', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), 'month', 666319395);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (597012981, to_date('16-02-2023', 'dd-mm-yyyy'), to_date('12-12-2024', 'dd-mm-yyyy'), 'year', 868910800);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (794612840, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), 'year', 164240019);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (405486891, to_date('16-05-2023', 'dd-mm-yyyy'), to_date('09-10-2024', 'dd-mm-yyyy'), 'month', 627648086);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (266112414, to_date('17-06-2023', 'dd-mm-yyyy'), to_date('29-11-2024', 'dd-mm-yyyy'), '6-month', 473309507);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (531760288, to_date('08-04-2023', 'dd-mm-yyyy'), to_date('15-09-2024', 'dd-mm-yyyy'), 'month', 160970769);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (258613619, to_date('25-09-2023', 'dd-mm-yyyy'), to_date('04-08-2024', 'dd-mm-yyyy'), 'year', 954578245);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (205241778, to_date('03-12-2023', 'dd-mm-yyyy'), to_date('20-01-2024', 'dd-mm-yyyy'), 'Yearly', 782002700);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (391708518, to_date('26-12-2023', 'dd-mm-yyyy'), to_date('29-06-2024', 'dd-mm-yyyy'), 'month', 155852248);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (397377221, to_date('18-04-2023', 'dd-mm-yyyy'), to_date('12-10-2024', 'dd-mm-yyyy'), 'year', 955098908);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (281099192, to_date('03-10-2023', 'dd-mm-yyyy'), to_date('21-11-2024', 'dd-mm-yyyy'), '6-month', 143136513);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (548771395, to_date('02-11-2023', 'dd-mm-yyyy'), to_date('20-06-2024', 'dd-mm-yyyy'), '6-month', 216899652);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (625819950, to_date('06-07-2023', 'dd-mm-yyyy'), to_date('12-07-2024', 'dd-mm-yyyy'), '6-month', 859662161);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (322640032, to_date('23-03-2023', 'dd-mm-yyyy'), to_date('24-07-2024', 'dd-mm-yyyy'), '6-month', 566975851);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (660036966, to_date('10-12-2023', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'), '6-month', 313753604);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (592765218, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('15-10-2024', 'dd-mm-yyyy'), 'year', 794558299);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (446865146, to_date('13-09-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), 'year', 719289034);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (601494948, to_date('25-11-2023', 'dd-mm-yyyy'), to_date('23-11-2024', 'dd-mm-yyyy'), 'month', 271772311);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (987592254, to_date('10-02-2023', 'dd-mm-yyyy'), to_date('01-04-2024', 'dd-mm-yyyy'), 'month', 546898866);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (718956782, to_date('01-07-2023', 'dd-mm-yyyy'), to_date('01-10-2024', 'dd-mm-yyyy'), 'month', 448016271);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (843003052, to_date('29-09-2023', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'), '6-month', 439553439);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (853386477, to_date('24-06-2023', 'dd-mm-yyyy'), to_date('07-11-2024', 'dd-mm-yyyy'), 'month', 780026125);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (246956410, to_date('01-10-2023', 'dd-mm-yyyy'), to_date('28-08-2024', 'dd-mm-yyyy'), 'month', 311775493);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (204919269, to_date('26-05-2023', 'dd-mm-yyyy'), to_date('13-08-2024', 'dd-mm-yyyy'), 'month', 503985065);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (286087867, to_date('21-07-2023', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'), 'month', 566176030);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (788822610, to_date('23-12-2023', 'dd-mm-yyyy'), to_date('27-12-2024', 'dd-mm-yyyy'), 'year', 301747054);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (659499140, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), '6-month', 589587031);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (764313863, to_date('18-03-2023', 'dd-mm-yyyy'), to_date('17-09-2024', 'dd-mm-yyyy'), 'month', 257844327);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (438418435, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('26-01-2024', 'dd-mm-yyyy'), 'month', 766023468);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (287209646, to_date('05-03-2023', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'), 'month', 707625834);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (822934711, to_date('22-05-2023', 'dd-mm-yyyy'), to_date('17-06-2024', 'dd-mm-yyyy'), 'year', 194232301);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (849850174, to_date('07-08-2023', 'dd-mm-yyyy'), to_date('19-10-2024', 'dd-mm-yyyy'), 'month', 483245816);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (516504888, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('06-07-2024', 'dd-mm-yyyy'), 'month', 930733425);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (992716823, to_date('17-04-2023', 'dd-mm-yyyy'), to_date('29-09-2024', 'dd-mm-yyyy'), 'year', 132169290);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (146355295, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), '6-month', 861809618);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (598308950, to_date('09-06-2023', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), 'year', 724905945);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (122391644, to_date('09-02-2023', 'dd-mm-yyyy'), to_date('02-12-2024', 'dd-mm-yyyy'), 'month', 636694801);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (100389784, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('30-08-2024', 'dd-mm-yyyy'), 'month', 161560240);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (760151235, to_date('09-03-2023', 'dd-mm-yyyy'), to_date('06-01-2024', 'dd-mm-yyyy'), 'month', 129018780);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (246433419, to_date('19-11-2023', 'dd-mm-yyyy'), to_date('21-07-2024', 'dd-mm-yyyy'), '6-month', 311775493);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (962243333, to_date('06-12-2023', 'dd-mm-yyyy'), to_date('22-06-2024', 'dd-mm-yyyy'), 'month', 974845127);
commit;
prompt 400 records committed...
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (252612349, to_date('08-06-2023', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'), '6-month', 342543356);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (896137809, to_date('20-04-2023', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), '6-month', 817343643);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (340525167, to_date('22-03-2023', 'dd-mm-yyyy'), to_date('07-02-2024', 'dd-mm-yyyy'), '6-month', 362292428);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (916095434, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'), 'month', 391929257);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (158767937, to_date('18-03-2023', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'), 'month', 253985889);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (980115662, to_date('12-07-2023', 'dd-mm-yyyy'), to_date('03-08-2024', 'dd-mm-yyyy'), 'year', 352081244);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (128085460, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), 'month', 749939457);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (651451698, to_date('25-02-2023', 'dd-mm-yyyy'), to_date('28-11-2024', 'dd-mm-yyyy'), 'month', 906439118);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (359486189, to_date('23-09-2023', 'dd-mm-yyyy'), to_date('19-09-2024', 'dd-mm-yyyy'), 'year', 501163002);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (792246759, to_date('21-05-2023', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), '6-month', 542435161);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (733463824, to_date('27-06-2023', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'), '6-month', 393036291);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (939208523, to_date('19-10-2023', 'dd-mm-yyyy'), to_date('12-02-2024', 'dd-mm-yyyy'), 'month', 674942711);
insert into MEMBERSHIP (membershipid, startdate, enddate, membershiptype, customerid)
values (331620685, to_date('28-08-2023', 'dd-mm-yyyy'), to_date('08-11-2024', 'dd-mm-yyyy'), 'month', 740249479);
commit;
prompt 413 records loaded
prompt Enabling foreign key constraints for BOOKCOPPY...
alter table BOOKCOPPY enable constraint SYS_C008426;
prompt Enabling foreign key constraints for PURCHASE...
alter table PURCHASE enable constraint SYS_C008444;
alter table PURCHASE enable constraint SYS_C008445;
prompt Enabling foreign key constraints for BOOKSALES...
alter table BOOKSALES enable constraint SYS_C008449;
alter table BOOKSALES enable constraint SYS_C008450;
prompt Enabling foreign key constraints for MEMBERSHIP...
alter table MEMBERSHIP enable constraint SYS_C008457;
prompt Enabling triggers for BOOK...
alter table BOOK enable all triggers;
prompt Enabling triggers for BOOKCOPPY...
alter table BOOKCOPPY enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;
prompt Enabling triggers for CUSTOMER...
alter table CUSTOMER enable all triggers;
prompt Enabling triggers for PURCHASE...
alter table PURCHASE enable all triggers;
prompt Enabling triggers for BOOKSALES...
alter table BOOKSALES enable all triggers;
prompt Enabling triggers for MEMBERSHIP...
alter table MEMBERSHIP enable all triggers;

set feedback on
set define on
prompt Done
