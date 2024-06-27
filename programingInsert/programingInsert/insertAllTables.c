/*

//customerTable

#include <stdio.h>

int main() {
    int customerIDs[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    const char* customerFnames[10] = {
        "John", "Jane", "Alice", "Bob", "Charlie",
        "David", "Eva", "Frank", "Grace", "Hannah"
    };
    const char* customerLnames[10] = {
        "Doe", "Smith", "Johnson", "Brown", "Williams",
        "Jones", "Garcia", "Miller", "Davis", "Rodriguez"
    };
    int customerPhones[10] = {
        1234567890, 2345678901, 3456789012, 4567890123, 5678901234,
        6789012345, 7890123456, 8901234567, 9012345678, 1234567809
    };
    const char* customerEmails[10] = {
        "john.doe@example.com", "jane.smith@example.com", "alice.johnson@example.com", "bob.brown@example.com", "charlie.williams@example.com",
        "david.jones@example.com", "eva.garcia@example.com", "frank.miller@example.com", "grace.davis@example.com", "hannah.rodriguez@example.com"
    };

    for (int i = 0; i < 10; i++) {
        printf("insert into Customer(CustomerID, CustomerFname, CustomerLname, CustomerPhone, CustomerEmail) \nvalues(% d, '%s', '%s', % d, '%s'); \n",
            customerIDs[i], customerFnames[i], customerLnames[i], customerPhones[i], customerEmails[i]);
    }
    return 0;
}


   #workerTable
#include <stdio.h>

int main() {
    int workerIDs[10] = { 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 };
    const char* workerFnames[10] = {
        "Alice", "Bob", "Charlie", "David", "Eva",
        "Frank", "Grace", "Hannah", "Ivy", "Jack"
    };
    const char* workerLnames[10] = {
        "Smith", "Johnson", "Williams", "Jones", "Brown",
        "Davis", "Miller", "Wilson", "Moore", "Taylor"
    };
    int workerPhones[10] = {
        1234567890, 2345678901, 3456789012, 4567890123, 5678901234,
        6789012345, 7890123456, 8901234567, 9012345678, 1234567809
    };
    const char* positions[10] = {
        "Manager", "Engineer", "Technician", "Clerk", "Analyst",
        "Supervisor", "Operator", "Coordinator", "Administrator", "Consultant"
    };
    const char* hireDates[10] = {
        "2020-01-15", "2019-03-22", "2021-07-30", "2018-11-12", "2017-05-06",
        "2022-09-18", "2016-02-25", "2023-04-11", "2015-08-19", "2014-12-29"
    };

    for (int i = 0; i < 10; i++) {
        printf("insert into worker(WorkerId, WorkerFname, WorkerLname, WorkerPhone, Position, HireDate) \nvalues(%d, '%s', '%s', %d, '%s', TO_DATE('%s', 'YYYY-MM-DD'));\n",
            workerIDs[i], workerFnames[i], workerLnames[i], workerPhones[i], positions[i], hireDates[i]);
    }

    return 0;
}

//membership table
#include <stdio.h>

int main() {
    int membershipIDs[10] = { 101, 102, 103, 104, 105, 106, 107, 108, 109, 110 };
    const char* startDates[10] = {
        "2023-01-01", "2023-02-01", "2023-03-01", "2023-04-01", "2023-05-01",
        "2023-06-01", "2023-07-01", "2023-08-01", "2023-09-01", "2023-10-01"
    };
    const char* endDates[10] = {
        "2024-01-01", "2024-02-01", "2024-03-01", "2024-04-01", "2024-05-01",
        "2024-06-01", "2024-07-01", "2024-08-01", "2024-09-01", "2024-10-01"
    };
    const char* membershipTypes[10] = {
        "Basic", "Premium", "Gold", "Silver", "Platinum",
        "Diamond", "Basic", "Premium", "Gold", "Silver"
    };
    int customerIDs[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

    for (int i = 0; i < 10; i++) {
        printf("insert into Membership (MembershipID, StartDate, EndDate, MembershipType, CustomerID) \nvalues (%d, TO_DATE('%s', 'YYYY-MM-DD'), TO_DATE('%s', 'YYYY-MM-DD'), '%s', %d);\n",
            membershipIDs[i], startDates[i], endDates[i], membershipTypes[i], customerIDs[i]);
    }

    return 0;
}

//bookTable
#include <stdio.h>

int main() {

    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(21, 'Book1', 'Fiction', 'Author1', 'Title1', 29.99, 300);\n");
    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(22, 'Book2', 'Fantasy', 'Author2', 'Title2', 19.99, 250);\n");
    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(23, 'Book3', 'Science Fiction', 'Author3', 'Title3', 24.95, 320);\n");
    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(24, 'Book4', 'Non-fiction', 'Author4', 'Title4', 34.50, 280);\n");
    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(25, 'Book5', 'Mystery', 'Author5', 'Title5', 22.50, 400);\n");
    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(26, 'Book6', 'Thriller', 'Author6', 'Title6', 27.99, 350);\n");
    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(27, 'Book7', 'Romance', 'Author7', 'Title7', 18.75, 200);\n");
    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(28, 'Book8', 'Biography', 'Author8', 'Title8', 32.00, 420);\n");
    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(29, 'Book9', 'History', 'Author9', 'Title9', 26.50, 380);\n");
    printf("INSERT INTO Book (BookID, BookName, Categorys, Author, Title, Price, PageNumbers) VALUES\n");
    printf("(30, 'Book10', 'Self-help', 'Author10', 'Title10', 21.95, 260);\n");

    return 0;
}

//BookCopyTable
#include <stdio.h>

int main() {
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (123456, 'new', 21);\n");
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (234567, 'used', 22);\n");
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (345678, 'used-new', 23);\n");
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (456789, 'new', 24);\n");
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (567890, 'used', 25);\n");
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (678901, 'used-new', 26);\n");
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (789012, 'new', 27);\n");
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (890123, 'used', 28);\n");
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (901234, 'used-new', 29);\n");
    printf("INSERT INTO BookCoppy (SerialNumber, Status, BookID) VALUES (123045, 'new', 30);\n");

    return 0;
}

 // BookSalesTable
#include <stdio.h>

int main() {

    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (21, 101);\n");
    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (22, 102);\n");
    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (23, 103);\n");
    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (24, 104);\n");
    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (25, 105);\n");
    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (26, 106);\n");
    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (27, 107);\n");
    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (28, 108);\n");
    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (29, 109);\n");
    printf("INSERT INTO BookSales (BookID, PurchaseID) VALUES (30, 110);\n");

    return 0;
}


// PurchaseTable
#include <stdio.h>
int main() {

    int purchaseID[10] = { 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 };
    int customerID[10] = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 1 }; // ensures CustomerID is different from PurchaseID
    int workerID[10] = { 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 };
    char* purchaseDate[10] = {
        "2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05",
        "2023-01-06", "2023-01-07", "2023-01-08", "2023-01-09", "2023-01-10"
    };
    int quantity[10] = { 2, 3, 1, 5, 2, 4, 3, 2, 1, 5 };

    for (int i = 0; i < 10; i++) {
        printf("INSERT INTO Purchase (PurchaseID, PurchaseDate, Quantity, CustomerID, WorkerId) \nVALUES (%d, TO_DATE('%s', 'YYYY-MM-DD'), %d, %d, %d);\n",
            purchaseID[i], purchaseDate[i], quantity[i], customerID[i], workerID[i]);
    }

    return 0;
}
*/
