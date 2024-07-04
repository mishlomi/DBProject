-- (1) customer id value can't be longer then 9 numbers
ALTER TABLE Customer
  ADD CONSTRAINT Check_CustomerID_Length 
  CHECK (LENGTH(TO_CHAR(CustomerID)) <= 9);
--wrong value
INSERT INTO Customer (CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
VALUES (1111111111, 'avi', 'lev',0505445454 ,'example@email.com');


-- (2) caterory book can't be null
ALTER TABLE Book
MODIFY Categorys VARCHAR2(30) NOT NULL;
--wrong value
insert into book ("BOOKNAME", "CATEGORYS", "AUTHOR", "TITLE", "PRICE", "PAGENUMBERS")
values ('kotel', null, 'noam-fine', 'Religions', 109.99, 204);


-- (3) worker position have a defaulte value "employee"
ALTER TABLE worker
MODIFY Position VARCHAR2(15) DEFAULT 'Employee';
--wrong value
insert into worker ("WORKERID", "WORKERFNAME", "WORKERLNAME", "WORKERPHONE", "POSITION", "HIREDATE")
values (315556965, ' avi', ' shalom', 0524493687, null, to_date(' 01/01/2018', 'DD/MM/YYYY'));


