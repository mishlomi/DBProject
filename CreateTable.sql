CREATE TABLE Book
(
  BookID NUMBER NOT NULL,
  BookName VARCHAR2(30) NOT NULL,
  Categorys VARCHAR2(30),
  Author VARCHAR2(15),
  Title VARCHAR2(30) NOT NULL,
  Price NUMBER NOT NULL,
  PageNumbers NUMBER NOT NULL,
  PRIMARY KEY (BookID)
);

CREATE TABLE Customer
(
  CustomerID NUMBER NOT NULL,
  CustomerFname VARCHAR2(15) NOT NULL,
  CustomerLname VARCHAR2(15) NOT NULL,
  CustomerPhone NUMBER NOT NULL,
  CustomerEmail VARCHAR2(30),
  PRIMARY KEY (CustomerID)
);

CREATE TABLE worker
(
  WorkerId NUMBER NOT NULL,
  WorkerFname VARCHAR2(15) NOT NULL,
  WorkerLname VARCHAR2(15) NOT NULL,
  WorkerPhone NUMBER,
  Position VARCHAR2(15) NOT NULL,
  HireDate DATE NOT NULL,
  PRIMARY KEY (WorkerId)
);

CREATE TABLE purchase
(
  PurchaseID NUMBER NOT NULL,
  PurchaseDate DATE NOT NULL,
  Quantity NUMBER NOT NULL,
  CustomerID NUMBER NOT NULL,
  WorkerId NUMBER NOT NULL,
  PRIMARY KEY (PurchaseID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (WorkerId) REFERENCES worker(WorkerId)
);

CREATE TABLE Membership
(
  MembershipID NUMBER NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  MembershipType VARCHAR2(15) NOT NULL,
  CustomerID NUMBER NOT NULL,
  PRIMARY KEY (MembershipID, CustomerID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE BookCoppy
(
  SerialNumber NUMBER NOT NULL,
  Status VARCHAR2(15) NOT NULL,
  BookID NUMBER NOT NULL,
  PRIMARY KEY (SerialNumber, BookID),
  FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

CREATE TABLE BookSales
(
  BookID NUMBER NOT NULL,
  PurchaseID NUMBER NOT NULL,
  PRIMARY KEY (BookID, PurchaseID),
  FOREIGN KEY (BookID) REFERENCES Book(BookID),
  FOREIGN KEY (PurchaseID) REFERENCES purchase(PurchaseID)
);
