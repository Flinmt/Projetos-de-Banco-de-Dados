/* Mr. José wants to modernize his workshop and, for now, he wants to register the cars that 
enter to receive services and their respective owners. Mr. José mentioned that each client has 
only one car and each car has only one mark. Mr. José also wants to know the colors of the cars
to have an idea of which to buy and which not to buy, and he informs that a car can have more 
than one color. Mr. José needs to register the phone numbers of his clients, but he doesn't want 
this to be mandatory. */

/* Entities: "Owner", "Car", "Mark", "Color", "Phone".
Associative Entity: "Car_Color".

Attributes: Owner: ("OwnerID (PK)", "Name", "Gender", "Car_ID (FK)"); 
Car: ("CarID (PK)", "Mark_ID (FK)", "Plate", "RegisterDate");
Mark: ("MarkID (PK)", "Name");
Color: ("ColorID (PK)", "Name");
Phone: ("PhoneID (PK), "Owner_ID (FK)", "Number", "Tpye");
Car_Color: ("Car_ID (PK)(FK)", "Color_ID (PK)(FK)").

Relationships: "Owner posses Car (1:1)", "Owner posses Phone (1:n)", 
"Car posses Mark (1:n)", "Car posses Color (n:n)". */

/* Database Creation */

CREATE DATABASE WORKSHOP;
USE WORKSHOP;

/* CREATING TABLES: */

CREATE TABLE OWNER (
    OWNERID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(30) NOT NULL,
    GENDER CHAR(1) NOT NULL,
    CAR_ID INT UNIQUE NOT NULL
);

CREATE TABLE CAR (
    CARID INT PRIMARY KEY AUTO_INCREMENT,
    REGISTERDATE DATE NOT NULL,
    PLATE VARCHAR(30) NOT NULL,
    MARK_ID INT NOT NULL
);

CREATE TABLE MARK (
    MARKID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(30) NOT NULL
);

CREATE TABLE COLOR (
    COLORID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(30) NOT NULL
);

CREATE TABLE PHONE (
    PHONEID INT PRIMARY KEY AUTO_INCREMENT,
    TYPE CHAR(3) NOT NULL,
    NUMBER INT(11) NOT NULL,
    Owner_ID INT NOT NULL
);

/* ASSOSSIATIVE TABLE: */

CREATE TABLE CAR_COLOR (
    CAR_ID INT NOT NULL,
    COLOR_ID INT NOT NULL
);

/* CREATING CONSTRAINTS */

ALTER TABLE OWNER 
ADD CONSTRAINT FK_CAR_OWNER
FOREIGN KEY (CAR_ID) REFERENCES CAR (CARID);

ALTER TABLE CAR
ADD CONSTRAINT FK_MARK_CAR
FOREIGN KEY (MARK_ID) REFERENCES MARK (MARKID);

ALTER TABLE PHONE
ADD CONSTRAINT FK_OWNER_PHONE
FOREIGN KEY (OWNER_ID) REFERENCES OWNER (OWNERID);

ALTER TABLE CAR_COLOR
ADD CONSTRAINT PK_CAR_COLOR
PRIMARY KEY (CAR_ID, COLOR_ID);

ALTER TABLE CAR_COLOR
ADD CONSTRAINT FK_CAR_COLORF
FOREIGN KEY (CAR_ID) REFERENCES CAR (CARID);

ALTER TABLE CAR_COLOR
ADD CONSTRAINT FK_COLOR_CAR
FOREIGN KEY (COLOR_ID) REFERENCES COLOR (COLORID);