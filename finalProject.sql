CREATE TABLE Orders_a
         (donutOrderID int,
         customerID int,
         firstName varchar(20),
         lastName varchar(20),
         address varchar(50),
         apt varchar(5),
         city varchar(20),
         state varchar(2),
         zip int,
         homePhone int,
         mobile int,
         otherPhone int,
         dateOfSale DATE,
         orderQty int,
         donutID int,
         donutName varchar(10),
         donutDescription varchar(20),
         unitPrice decimal,
         PRIMARY KEY(donutOrderID, donutID),
         specialNotes varchar(150));

CREATE TABLE Orders_b
     (donutOrderID int AUTO_INCREMENT,
      PRIMARY KEY (donutOrderID),
      dateOfSale DATE,
      customerID int,
      firstName varchar(20),
      lastName varchar(20),
      address varchar(20),
      apt varchar(5),
      city varchar(20),
      state varchar(2),
      zip int,
      homePhone varchar(15),
      mobile varchar(15),
      otherPhone varchar(15),
      specialNotes varchar(150));

CREATE TABLE Donuts_b
     (donutID int AUTO_INCREMENT,
     PRIMARY KEY (donutID),
     donutName varchar(20),
     donutDescription varchar(100),
     unitPrice decimal);

CREATE TABLE Itemized_orders_b
     (donutOrderID int,
     FOREIGN KEY (donutOrderID) 
     REFERENCES Orders_b(donutOrderID),
     donutID int,
     FOREIGN KEY (donutID)
     REFERENCES Donuts_b(donutID),
     quantity int);
     
CREATE TABLE Donuts_c
     (donutID int AUTO_INCREMENT,
     PRIMARY KEY (donutID),
     donutName varchar(20),
     donutDescription varchar(100),
     unitPrice decimal);

CREATE TABLE Customers_c
    (customerID int,
     PRIMARY KEY (customerID),
     firstName varchar(20),
     lastName varchar(20),
     address varchar(20),
     apt varchar(5),
     city varchar(20),
     state varchar(2),
     zip int,
     homePhone varchar(15),
     mobile varchar(15),
     otherPhone varchar(15));

CREATE TABLE Orders_c
     (donutOrderID int AUTO_INCREMENT,
      PRIMARY KEY (donutOrderID),
      customerID int,
      FOREIGN KEY (customerID)
      REFERENCES Customers_c(customerID),
      dateOfSale DATE,
      specialNotes varchar(150));

CREATE TABLE Itemized_orders_c
     (donutOrderID int,
     FOREIGN KEY (donutOrderID) 
     REFERENCES Orders_c(donutOrderID),
     donutID int,
     FOREIGN KEY (donutID)
     REFERENCES Donuts_c(donutID),
     PRIMARY KEY (donutOrderID, donutID),
     quantity int);
     
CREATE VIEW CUSTOMERS_VIEW AS
SELECT CONCAT(firstName, ' ', lastName) AS 'Name', 
  customerID, address, apt, city, state, zip, homePhone, mobile, otherPhone
FROM Customers_c;

CREATE INDEX DONUTS_INDEX 
ON Donuts_c(donutName);

INSERT INTO Customers_c
VALUES(1,
       'Bob',
       'Vance',
       '123 Street Rd',
       'd2',
       'Scranton',
       'PA',
       12345,
       '1234567890',
       '2345678901',
       '3456789012');

INSERT INTO Donuts_c
VALUES(1,
       'Great Divider',
       'Covered in chocolate and sprinkles, destined to divide family and friends over who gets to eat it',
       1.99);

INSERT Orders_c
VALUES(1,
       1,
       date(20151207),
       "none");

INSERT Itemized_orders_c
VALUES(1,
      1,
      10);