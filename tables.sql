--Tenant--
CREATE TABLE IF NOT EXISTS 'Tenant' (
'Tenant_ID' int NOT NULL AUTO_INCREMENT UNIQUE,
'Tenant_FName' char,
'Tenant_SName' char,
'Tenant_DoB' date,
'Tenant_Age' int AS (year(CURRENT_TIMESTAMP) - year('Tenant_DoB')), 
'Tenant_ContactNo' varchar(11),
'Tenant_NextOfKinNo' varchar(11),
'Tenant_StuNumber' int varchar(8) UNIQUE, 
'Tenant_Diabilities' BIT,  
PRIMARY KEY ('Tenant_ID')
FOREIGN KEY ('Account_ID') References 'Account'('Account_ID'),
FOREIGN KEY ('Paid_Status') References 'Account'('Paid_Status')
);



--Building--
CREATE TABLE IF NOT EXISTS 'Building' (
'Building_ID' int NOT NULL AUTO_INCREMENT UNIQUE,
'Building_Name' varchar(3),
'Building_Address' char,
'Building_PostCode' varchar(7) UNIQUE,
PRIMARY KEY ('Building_ID')
FOREIGN KEY ('Manager_ID') References 'Manager' ('Manager_ID')
FOREIGN KEY ('Apartment_ID') References 'Apartment' ('Apartment_ID');
);


--Bank Account--
CREATE TABLE IF NOT EXISTS 'Bank Account' (
'BankAccount_ID' int NOT NULL AUTO_INCREMENT UNIQUE,
FOREIGN KEY ('Tenant_FName') References 'Tenant'('Tenant_FName'),
FOREIGN KEY ('Tenant_SName') References 'Tenant'('Tenant_SName'),
'Account_Number' smallint NOT NULL, 
'Sort_Code' smallint NOT NULL,
);



--Apartment--
CREATE TABLE IF NOT EXISTS 'Apartment' (
'Apartment_ID' int NOT NULL AUTO_INCREMENT UNIQUE,
'Apartment_Block' varchar(32),
'Apartment_Type' varchar(32),
'Apartment_HMO' BIT, --Yes or no
PRIMARY KEY ('Appartment_Block'),
FOREIGN KEY ('Lease_ID') References 'Lease' ('Lease_ID'),
FOREIGN KEY ('Building_ID') References 'Building' ('Building_ID'),
);



--Lease--
CREATE TABLE IF NOT EXISTS 'Lease' (
'Lease_ID' int NOT NULL AUTO_INCREMENT UNIQUE,
'Lease_Status'  BIT, --Yes or no (Paid or not paid)
'Lease_Cost' int NOT NULL,
FOREIGN KEY ('Tenant_ID') References 'Tenant'('Tenant_ID'),
FOREIGN KEY ('Apartment_ID') References 'Apartment' ('Apartment_ID'),
FOREIGN KEY ('Admin_ID') References 'Admin' ('Admin_ID')
);



--Employee--
CREATE TABLE IF NOT EXISTS 'Employee' (
'Employee_ID' int NOT NULL AUTO_INCREMENT UNIQUE,
'Employee_FName' char,
'Employee_SName' char,
'Employee_DoB' date,
'Employee_Age' int AS (year(CURRENT_TIMESTAMP) - year('Employee_DoB')),
'Employee_Rate' int NOT NULL,
'Employee_HRsPWeek' TIME,
PRIMARY KEY ('Employee_ID'),
FOREIGN KEY ('Building_ID') References 'Building' ('Building_ID')
);



--Manager--
CREATE TABLE IF NOT EXISTS 'Manager'
'Manager_ID'int NOT NULL AUTO_INCREMENT UNIQUE,
'Manager_Fname' char,
'Manager_Sname' char,
PRIMARY KEY ('Manager_ID'),
FOREIGN KEY ('Building_ID') References 'Building' ('Building_ID');
);



--Admin--
CREATE TABLE IF NOT EXISTS 'Admin' (
'Admin_ID'int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY ('Admin_ID'),
);



--Jobs/Contracts--
CREATE TABLE IF NOT EXISTS 'Jobs And Contracts'
'JaC_ID'int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY ('JaC_ID'),
FOREIGN KEY 'Technicians' REFERENCES 'Technicians' ('Technicians_ID')
);



--Technicians--
CREATE TABLE IF NOT EXISTS 'Technicians'
'Technicians_ID'int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY ('Technicians_ID'),
FOREIGN KEY 'Employee_ID' References 'Employee' ('Employee_ID')
FOREIGN KEY 'JaC_ID' References 'Jobs And Contracts' ('JaC_ID')
);