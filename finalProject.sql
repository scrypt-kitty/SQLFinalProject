CREATE TABLE CustomerOrders_a
         (donutOrderID int,
         customerID int,
         firstName varchar(20),
         lastName varchar(20),
         address varchar(50),
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
         PRIMARY KEY(donutOrderID, customerID));
		 
CREATE TABLE Orders_b
         (donutOrderID int AUTO_INCREMENT,
         PRIMARY KEY (donutOrderID),
         dateOfSale DATE,
         orderQty int,
         donutID int,
         donutName varchar(20),
         donutDescription varchar(100),
         unitPrice decimal);

CREATE TABLE Customers_b
         (customerID int AUTO_INCREMENT,
         PRIMARY KEY (customerID),
         firstName varchar(20),
         lastName varchar(20),
         address varchar(50),
         city varchar(20),
         state varchar(2),
         zip int,
         homePhone varchar(15),
         mobile varchar(15),
         otherPhone varchar(15));

ALTER TABLE Orders_b
 ADD COLUMN customerID int,
 ADD FOREIGN KEY (customerID) REFERENCES Customers_b(customerID);

CREATE TABLE Orders_c
         (donutOrderID int AUTO_INCREMENT,
         PRIMARY KEY (donutOrderID),
         dateOfSale DATE,
         orderQty int);

CREATE TABLE Customers_c
         (customerID int AUTO_INCREMENT,
         PRIMARY KEY (customerID),
         firstName varchar(20),
         lastName varchar(20),
         address varchar(50),
         city varchar(20),
         state varchar(2),
         zip int,
         homePhone varchar(15),
         mobile varchar(15),
         otherPhone varchar(15));

CREATE TABLE Donuts_c
         (donutID int AUTO_INCREMENT,
         PRIMARY KEY (donutID),
         donutName varchar(20),
         donutDescription varchar(100),
         unitPrice decimal);

ALTER TABLE Orders_c
 ADD COLUMN customerID int,
 ADD FOREIGN KEY (customerID) REFERENCES Customers_c(customerID);

ALTER TABLE Orders_c
 ADD COLUMN donutID int,
 ADD FOREIGN KEY (donutID) REFERENCES Donuts_c(donutID);	 
 
CREATE VIEW CUSTOMERS_VIEW AS
SELECT CONCAT(firstName, ' ', lastName) AS 'Name', 
  customerID, address, city, state, zip, homePhone, mobile, otherPhone
FROM Customers_c;

CREATE INDEX DONUTS_INDEX 
ON Donuts_c(donutName);

INSERT INTO Customers_c
VALUES(1,
       'Bob',
       'Vance',
       '123 Street Rd',
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
       date(20151207),
       12,
       1,
       1);