--Tenant
CREATE TABLE IF NOT EXISTS 'Tenant' (
'Tenant_ID' int NOT NULL AUTO_INCREMENT UNIQUE,
'Tenant_FName' char,
'Tenant_SName' char,
'Tenant_DoB' DATE,
'Tenant_ContactNo' varchar(11),
'Tenant_NextOfKinNo' varchar(11),
'Tenant_StuNumber' varchar(8) UNIQUE, 
'Tenant_Diabilities' BIT,  
PRIMARY KEY ('Tenant_ID')
FOREIGN KEY ('Account_ID') References 'Account'('Account_ID'),
FOREIGN KEY ('Paid_Status') References 'Account'('Paid_Status')
);


--Bank Account
CREATE TABLE IF NOT EXISTS 'Bank Account' (
'Account_ID' int NOT NULL AUTO_INCREMENT UNIQUE,
FOREIGN KEY ('Tenant_FName') References 'Tenant'('Tenant_FName'),
FOREIGN KEY ('Tenant_SName') References 'Tenant'('Tenant_SName'),
'Account_Number' smallint NOT NULL, 
'Sort_Code' smallint NOT NULL,
'Paid_Status' BIT
);


--Apartment
CREATE TABLE IF NOT EXISTS 'Apartment' (
'Apartment_ID' int NOT NULL AUTO_INCREMENT UNIQUE,
'Apartment_Block' varchar(32),
'Apartment_Type' varchar(32),
PRIMARY KEY ('Appartment_Block'),
FOREIGN KEY ('Tenant_ID') References 'Tenant' ('Tenant_ID'),
FOREIGN KEY ('Building_ID') References 'Building' ('Building_ID'),;
);

--Employee
--Admin
--Jobs/Contracts
--Technicians
--Manager