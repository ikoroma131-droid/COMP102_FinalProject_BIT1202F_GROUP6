CREATE DATABASE Market_Allocation_System;


CREATE TABLE Markets (
    Market_ID INT AUTO_INCREMENT PRIMARY KEY,
    Market_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);



CREATE TABLE Stalls (
    Stall_ID INT AUTO_INCREMENT PRIMARY KEY,
    Stall_Number VARCHAR(20) NOT NULL UNIQUE,
    Stall_Size VARCHAR(20) NOT NULL,
    Stall_Status VARCHAR(20) NOT NULL DEFAULT 'Available',
    Location_Description VARCHAR(150),
    Market_ID INT NOT NULL,

    CONSTRAINT FK_Stalls_Markets
        FOREIGN KEY (Market_ID)
        REFERENCES Markets(Market_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);



CREATE TABLE Traders (
    Trader_ID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Phone_Number VARCHAR(20) NOT NULL,
    Address VARCHAR(150),
    Business_Type VARCHAR(50) NOT NULL
);



CREATE TABLE Allocations (
    Allocation_ID INT AUTO_INCREMENT PRIMARY KEY,
    Trader_ID INT NOT NULL,
    Stall_ID INT NOT NULL,
    Allocation_Date DATE NOT NULL,
    Expiry_Date DATE NOT NULL,
    Allocation_Status VARCHAR(20) NOT NULL DEFAULT 'Active',

    CONSTRAINT FK_Allocations_Traders
        FOREIGN KEY (Trader_ID)
        REFERENCES Traders(Trader_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT FK_Allocations_Stalls
        FOREIGN KEY (Stall_ID)
        REFERENCES Stalls(Stall_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


CREATE TABLE Payments (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Allocation_ID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Method VARCHAR(50) NOT NULL,

    CONSTRAINT FK_Payments_Allocations
        FOREIGN KEY (Allocation_ID)
        REFERENCES Allocations(Allocation_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO Markets (Market_Name, Location)
VALUES
('Central Market', 'Freetown'),
('Lumley Market', 'Lumley'),
('Congo Market', 'Congo Cross'),
('Eastern Market', 'Kenema'),
('Northern Market', 'Makeni');


INSERT INTO Stalls
(Stall_Number, Stall_Size, Stall_Status, Location_Description, Market_ID)
VALUES
('A01','Small','Occupied','Main Entrance',1),
('A02','Medium','Occupied','Main Entrance',1),
('A03','Large','Available','Back Section',1),
('B01','Small','Occupied','North Wing',2),
('B02','Medium','Available','North Wing',2),
('C01','Large','Occupied','Center Area',3),
('C02','Medium','Occupied','Center Area',3),
('D01','Small','Occupied','East Wing',4),
('D02','Large','Available','East Wing',4),
('E01','Medium','Occupied','West Wing',5);


INSERT INTO Traders
(Full_Name, Gender, Phone_Number, Address, Business_Type)
VALUES
('Ibrahim Kamara','Male','076111111','Freetown','Clothing'),
('Mariama Sesay','Female','076222222','Lumley','Food'),
('John Kargbo','Male','076333333','Waterloo','Electronics'),
('Aminata Koroma','Female','076444444','Kenema','Cosmetics'),
('Alhaji Bangura','Male','076555555','Makeni','Groceries'),
('Hawa Conteh','Female','076666666','Bo','Vegetables'),
('Mohamed Turay','Male','076777777','Port Loko','Shoes'),
('Fatmata Jalloh','Female','076888888','Freetown','Tailoring'),
('Abdul Kanu','Male','076999999','Kenema','Phones'),
('Kadiatu Kamara','Female','076101010','Makeni','Food');


INSERT INTO Allocations
(Trader_ID, Stall_ID, Allocation_Date, Expiry_Date, Allocation_Status)
VALUES
(1,1,'2025-01-01','2025-12-31','Active'),
(2,2,'2025-01-15','2025-12-31','Active'),
(3,4,'2025-02-01','2025-12-31','Active'),
(4,6,'2025-02-10','2025-12-31','Active'),
(5,7,'2025-03-01','2025-12-31','Active'),
(6,8,'2025-03-15','2025-12-31','Active'),
(7,10,'2025-04-01','2025-12-31','Active'),
(8,1,'2024-01-01','2024-12-31','Expired'),
(9,6,'2024-02-01','2024-12-31','Expired'),
(10,7,'2024-03-01','2024-12-31','Expired');



INSERT INTO Payments
(Allocation_ID, Amount, Payment_Date, Payment_Method)
VALUES
(1,500.00,'2025-01-05','Cash'),
(1,300.00,'2025-06-05','Mobile Money'),

(2,600.00,'2025-01-20','Cash'),
(2,400.00,'2025-05-20','Bank Transfer'),

(3,700.00,'2025-02-05','Cash'),

(4,1000.00,'2025-02-15','Bank Transfer'),

(5,750.00,'2025-03-10','Cash'),

(6,450.00,'2025-03-20','Mobile Money'),

(7,850.00,'2025-04-05','Cash'),

(8,500.00,'2024-01-15','Cash'),

(9,900.00,'2024-02-10','Bank Transfer'),

(10,650.00,'2024-03-10','Cash'),

(3,300.00,'2025-06-01','Mobile Money'),

(5,250.00,'2025-06-10','Cash'),

(7,150.00,'2025-06-15','Mobile Money');



UPDATE Traders
SET Phone_Number = '078123456'
WHERE Trader_ID = 1;


UPDATE Stalls
SET Stall_Status = 'Occupied'
WHERE Stall_ID = 5;



UPDATE Allocations
SET Allocation_Status = 'Expired'
WHERE Allocation_ID = 8;

DELETE FROM Payments
WHERE Payment_ID = 15;