CREATE TABLE Products(
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100) NOT NULL,
    Product_Categories VARCHAR2(50) NOT NULL,
    Product_Price NUMBER(10) CHECK (Product_Price >= 0),
    Product_Quantities NUMBER DEFAULT 0
);

CREATE TABLE Customers (
    Customer_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(100) NOT NULL,
    Last_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Phone_No VARCHAR2(15)
);

CREATE TABLE Orders(
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER NOT NULL,
    Order_Date DATE DEFAULT SYSDATE,
    Total_Amount NUMBER(10) CHECK (Total_Amount >= 0),
    CONSTRAINT fk_customer FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID) ON DELETE CASCADE
);

CREATE TABLE Order_Details(
    Billing_ID NUMBER PRIMARY KEY,
    ORDER_ID NUMBER NOT NULL,
    Product_ID NUMBER NOT NULL,
    Order_Quantity NUMBER CHECK (Order_Quantity >= 0),
    CONSTRAINT fk_order FOREIGN KEY (Order_ID) REFERENCES Orders (Order_ID) ON DELETE CASCADE,
    CONSTRAINT fk_product FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID) ON DELETE CASCADE
);

INSERT INTO Products VALUES(1,'ThinkPad','Laptop',70000,10);
INSERT INTO Products VALUES(2,'Aplle Airpods','HeadPhones',50000,12);

INSERT INTO Customers VALUES(101,'Abdul','Subahan','abdul101@gmail.com','9988996767');
INSERT INTO Customers VALUES(102,'Paavan','Suresh','pavaan102@gmail.com','9988992323');

INSERT INTO Orders VALUES(10,101,'12-oct-2025',2000);
INSERT INTO Orders VALUES(20,102,'10-oct-2025',4000);


INSERT INTO Order_Details VALUES(501,10,1,50);
INSERT INTO Order_Details VALUES(502,20,2,30);

--1
SELECT * FROM Products WHERE Product_Quantities < 20;

--2
SELECT o.Customer_ID,c.First_name, o.Total_Amount 
From Orders o 
INNER JOIN Customers c ON o.Customer_ID=c.Customer_ID;
