﻿CREATE TABLE person
(
 personId VARCHAR(9) NOT NULL,
 firstName VARCHAR(50) NOT NULL,
 lastName VARCHAR(50) NOT NULL,
 phone VARCHAR(12) NOT NULL,
 email VARCHAR(255) NOT NULL,
 PRIMARY KEY (personId)
);

CREATE TABLE client
(
 active NUMERIC(1) NOT NULL,
 maxBooks NUMERIC(2) NOT NULL,
 clientId VARCHAR(9) NOT NULL,
 PRIMARY KEY (clientId),
 FOREIGN KEY (clientId) REFERENCES person(personId)
);

CREATE TABLE librarian
(
 startDate DATE NOT NULL,
 userName VARCHAR(50) NOT NULL,
 userPassword VARCHAR(50) NOT NULL,
 librarianId VARCHAR(9) NOT NULL,
 PRIMARY KEY (librarianId),
 FOREIGN KEY (librarianId) REFERENCES person(personId)
);

CREATE TABLE bookCategory
(
 categoryName VARCHAR(50) NOT NULL,
 categoryId NUMERIC(3) NOT NULL,
 PRIMARY KEY (categoryId)
);

CREATE TABLE bookPublisher
(
 publisherName VARCHAR(50) NOT NULL,
 publisherId NUMERIC(4) NOT NULL,
 PRIMARY KEY (publisherId)
);

CREATE TABLE playCategory
(
 categoryId NUMERIC(3) NOT NULL,
 categoryName VARCHAR(50) NOT NULL,
 PRIMARY KEY (categoryId)
);

CREATE TABLE playPublisher
(
 publisherId NUMERIC(4) NOT NULL,
 publisherName VARCHAR(50) NOT NULL,
 PRIMARY KEY (publisherId)
);

CREATE TABLE book
(
 bookId NUMBER NOT NULL,
 title VARCHAR(50) NOT NULL,
 pages NUMERIC(4) NOT NULL,
 bookLanguage VARCHAR(50) NOT NULL,
 categoryId NUMERIC(3) NOT NULL,
 publisherId NUMERIC(4) NOT NULL,
 PRIMARY KEY (bookId),
 FOREIGN KEY (categoryId) REFERENCES
bookCategory(categoryId),
 FOREIGN KEY (publisherId) REFERENCES
bookPublisher(publisherId)
);

CREATE TABLE play
(
 playId NUMBER NOT NULL,
 playName VARCHAR(50) NOT NULL,
 categoryId NUMERIC(3) NOT NULL,
 publisherId NUMERIC(4) NOT NULL,
 PRIMARY KEY (playId),
 FOREIGN KEY (categoryId) REFERENCES
playCategory(categoryId),
 FOREIGN KEY (publisherId) REFERENCES
playPublisher(publisherId)
);

CREATE TABLE bookCopy
(
 copyId NUMBER NOT NULL,
 yearPublished NUMERIC(4) NOT NULL,
 available NUMERIC(1) NOT NULL,
 edition NUMERIC(3) NOT NULL,
 bookId NUMBER NOT NULL,
 PRIMARY KEY (copyId),
 FOREIGN KEY (bookId) REFERENCES book(bookId)
);

CREATE TABLE playCopy
(
 copyId NUMBER NOT NULL,
 available NUMERIC(1) NOT NULL,
 playId NUMBER NOT NULL,
 PRIMARY KEY (copyId),
 FOREIGN KEY (playId) REFERENCES play(playId)
);

CREATE TABLE playLending
(
 lendingId INT NOT NULL,
 lendingDate DATE NOT NULL,
 returnDate DATE,
 dueDate DATE NOT NULL,
 copyId NUMERIC(8) NOT NULL,
 clientId VARCHAR(9) NOT NULL,
 librarianId VARCHAR(9) NOT NULL,
 PRIMARY KEY (lendingId),
 FOREIGN KEY (copyId) REFERENCES playCopy(copyId),
 FOREIGN KEY (clientId) REFERENCES client(clientId),
 FOREIGN KEY (librarianId) REFERENCES
librarian(librarianId)
);

CREATE TABLE book_author
(
 author VARCHAR(100) NOT NULL,
 bookId NUMERIC(6) NOT NULL,
 PRIMARY KEY (author, bookId),
 FOREIGN KEY (bookId) REFERENCES book(bookId)
);

CREATE TABLE bookLending
(
 lendingDate DATE NOT NULL,
 returnDate DATE,     --תאריך ההחזרה בפועל
 lendingId INT NOT NULL,
 dueDate DATE NOT NULL,   --תאריך להחזרה
 clientId VARCHAR(9) NOT NULL,
 librarianId VARCHAR(9) NOT NULL,
 copyId NUMERIC(8) NOT NULL,
 PRIMARY KEY (lendingId),
 FOREIGN KEY (clientId) REFERENCES client(clientId),
 FOREIGN KEY (librarianId) REFERENCES
librarian(librarianId),
 FOREIGN KEY (copyId) REFERENCES bookCopy(copyId)
);

------------------------------------------------------------------------------------------
CREATE TABLE bookOrders 
(
    orderID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    bookID NUMBER NOT NULL,
    availableCopies NUMBER,
    orderQuantity NUMBER ,
    FOREIGN KEY (bookID) REFERENCES book(bookID)
);

CREATE TABLE PlayOrders 
(
    orderID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    playID NUMBER NOT NULL,
    availableCopies NUMBER,
    orderQuantity NUMBER ,
    FOREIGN KEY (playID) REFERENCES play(playID)
);

create table membership
(
  membershipID number not null,
  startDate date not null,
  EndDate date not null,
  membershipType varchar2(15) not null,
  clientid varchar(9) not null,
  primary key (membershipid, clientid),
  foreign key (clientid) references client(clientid)
);

create table PlayPurchase
(
    purchaseID INT NOT NULL,
    purchaseDate DATE NOT NULL,
    quantity NUMBER NOT NULL,
    copyId NUMBER NOT NULL,
    clientId VARCHAR(9) NOT NULL,
    librarianId VARCHAR(9) NOT NULL,
    PRIMARY KEY (purchaseID),
    FOREIGN KEY (copyId) REFERENCES playCopy(copyId),
    FOREIGN KEY (clientId) REFERENCES client(clientId),
    FOREIGN KEY (librarianId) REFERENCES librarian(librarianId)
);

create table bookPurchase
(
    purchaseID INT NOT NULL,
    purchaseDate DATE NOT NULL,
    quantity NUMBER NOT NULL,
    clientId VARCHAR(9) NOT NULL,
    librarianId VARCHAR(9) NOT NULL,
    bookId NUMBER NOT NULL,
    PRIMARY KEY (purchaseID),
    FOREIGN KEY (clientId) REFERENCES client(clientId),
    FOREIGN KEY (librarianId) REFERENCES librarian(librarianId)
    FOREIGN KEY (bookId) REFERENCES pbookCopy(bookId),
);
