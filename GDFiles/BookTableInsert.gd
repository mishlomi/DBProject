
[General]
Version=1

[Preferences]
Username=
Password=2261
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=BOOK
Count=390

[Record]
Name=BOOKID
Type=NUMBER
Size=
Data=Sequence(111111, 4)
Master=

[Record]
Name=BOOKNAME
Type=VARCHAR2
Size=30
Data=List('1984', 'To Kill a Mockingbird', 'The Great Gatsby', 'Pride and Prejudice', 'The Catcher in the Rye', 'The Hobbit', 'The Hunger Games', 'The Da Vinci Code', 'The Lord of the Rings', 'Gone with the Wind', 'The Girl on the Train', 'Brave New World', 'The Alchemist', 'The Shining', 'The Handmaid's Tale', 'A Game of Thrones', 'The Help', 'The Road', 'The Secret Garden', 'Wuthering Heights', 'The Outsiders', 'Charlotte's Web', 'The Book Thief', 'Dracula', 'Moby-Dick', 'Alice in Wonderland', 'Jane Eyre', 'Frankenstein', 'Little Women', 'War and Peace', 'Sapiens', 'Educated', 'Dune', 'The Sun Also Rises', 'The Kite Runner', 'One Hundred Years of Solitude', 'East of Eden', 'Anna Karenina', 'Catch-22', 'The Bell Jar', 'The Road Less Traveled', 'In Cold Blood', 'The Martian', 'The Secret History', 'The Goldfinch') 
Master=

[Record]
Name=CATEGORYS
Type=VARCHAR2
Size=30
Data=List(
='Fantasy', 'Science Fiction', 'Romance', 'Mystery', 'Thriller', 'Historical Fiction', 'Biography', 'Self-Help', 'Cookbook', 'Young Adult', 'Memoir', 'Poetry', 'Business', 'Travel', 'Children')
Master=

[Record]
Name=AUTHOR
Type=VARCHAR2
Size=15
Data=List(
='Stephen King', 'J.K. Rowling', 'George Orwell', 'Harper Lee', 'Mark Twain', 'Dan Brown', 'Emily Bronte', 'J.R.R. Tolkien', 'Agatha Christie', 'Charles Dickens', 'Jane Austen', 'F. Scott Fitzgerald', 'Margaret Atwood', 'William Blake', 'George Eliot')
Master=

[Record]
Name=TITLE
Type=VARCHAR2
Size=30
Data=List(
='Fantasy', 'Science Fiction', 'Romance', 'Mystery', 'Thriller', 'Historical Fiction', 'Biography', 'Self-Help', 'Cookbook', 'Young Adult', 'Memoir', 'Poetry', 'Business', 'Travel', 'Children')
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=
Data=[10(1..2)]
Master=

[Record]
Name=PAGENUMBERS
Type=NUMBER
Size=
Data=[10(0..2)]
Master=

