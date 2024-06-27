insert into Book (BookName, Categorys, Author, Title, Price, PageNumbers) 
values ('The Alchemist', 'Fiction', 'Paulo Coelho', 'Hearts Entwined', 19.99, 100);
INSERT INTO book (BookName, Categorys, Author, Title, Price, PageNumbers) 
VALUES ('To Kill a Mockingbird', 'Classic', 'Paulo Coelho', ' Journey of Life', 29.99, 200);
INSERT INTO book (BookName, Categorys, Author, Title, Price, PageNumbers) 
VALUES ('1984', 'Dystopian', 'Harper Lee', 'Crime and Conscience', 39.99, 300);
INSERT INTO book (BookName, Categorys, Author, Title, Price, PageNumbers) 
 VALUES ('Pride and Prejudice', 'Romance', 'Harper Lee', 'Hero Quest', 49.99, 400);
INSERT INTO book (BookName, Categorys, Author, Title, Price, PageNumbers) 
VALUES ('Great Gatsby', 'Novel', 'George Orwell', 'Hero Quest', 59.99, 500);
INSERT INTO book (BookName, Categorys, Author, Title, Price, PageNumbers) 
VALUES ('Moby Dick', 'Adventure', 'George Orwell', 'The Future Shadow', 69.99, 600);
INSERT INTO book (BookName, Categorys, Author, Title, Price, PageNumbers) 
VALUES ('War and Peace', 'Historical', 'George Orwell', 'Hearts Entwined', 79.99, 700);
INSERT INTO book (BookName, Categorys, Author, Title, Price, PageNumbers) 
VALUES ('Crime and Punishment', 'Mystery', 'George Orwell', 'Hearts Entwined', 89.99, 800);
INSERT INTO book (BookName, Categorys, Author, Title, Price, PageNumbers) 
VALUES ('The Odyssey', 'Epic', 'Paulo Coelho', 'The Future Shadow', 99.99, 900);
INSERT INTO book (BookName, Categorys, Author, Title, Price, PageNumbers) 
VALUES ('Ulysses', 'Mystery', 'Harper Lee', 'Title10', 109.99, 1000);



insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 1, 'John', 'Doe',  1234567890, 'john.doe@example.com');
insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 2, 'Jane', 'Smith', -1949288395, 'jane.smith@example.com');
insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 3, 'Alice', 'Johnson', -838178284, 'alice.johnson@example.com');
insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 4, 'Bob', 'Brown',  272922827, 'bob.brown@example.com');
insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 5, 'Charlie', 'Williams',  1383933938, 'charlie.williams@example.com');
insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 6, 'David', 'Jones', -1800922247, 'david.jones@example.com');
insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 7, 'Eva', 'Garcia', -699811136, 'eva.garcia@example.com');
insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 8, 'Frank', 'Miller',  311299975, 'frank.miller@example.com');
insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 9, 'Grace', 'Davis',  422411086, 'grace.davis@example.com');
insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail)
values( 10, 'Hannah', 'Rodriguez',  1234567809, 'hannah.rodriguez@example.com');



insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(11, 'Alice', 'Smith', 1234567890, 'Manager', TO_DATE('2020-01-15', 'YYYY-MM-DD'));
insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(12, 'Bob', 'Johnson', -1949288395, 'Engineer', TO_DATE('2019-03-22', 'YYYY-MM-DD'));
insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(13, 'Charlie', 'Williams', -838178284, 'Technician', TO_DATE('2021-07-30', 'YYYY-MM-DD'));
insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(14, 'David', 'Jones', 272922827, 'Clerk', TO_DATE('2018-11-12', 'YYYY-MM-DD'));
insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(15, 'Eva', 'Brown', 1383933938, 'Analyst', TO_DATE('2017-05-06', 'YYYY-MM-DD'));
insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(16, 'Frank', 'Davis', -1800922247, 'Supervisor', TO_DATE('2022-09-18', 'YYYY-MM-DD'));
insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(17, 'Grace', 'Miller', -699811136, 'Operator', TO_DATE('2016-02-25', 'YYYY-MM-DD'));
insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(18, 'Hannah', 'Wilson', 311299975, 'Coordinator', TO_DATE('2023-04-11', 'YYYY-MM-DD'));
insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(19, 'Ivy', 'Moore', 422411086, 'Administrator', TO_DATE('2015-08-19', 'YYYY-MM-DD'));
insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate)
values(20, 'Jack', 'Taylor', 1234567809, 'Consultant', TO_DATE('2014-12-29', 'YYYY-MM-DD'));



insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (101, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Basic', 1);
insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (102, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'Premium', 2);
insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (103, TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Gold', 3);
insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (104, TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Silver', 4);
insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (105, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Platinum', 5);
insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (106, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'Diamond', 6);
insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (107, TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'Basic', 7);
insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (108, TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD'), 'Premium', 8);
insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (109, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Gold', 9);
insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID)
values (110, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), 'Silver', 10);

commit;

select * from Membership;
