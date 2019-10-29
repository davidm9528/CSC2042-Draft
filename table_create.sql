CREATE TABLE IF NOT EXISTS Person (
PersonID int NOT NULL AUTO_INCREMENT UNIQUE,
FName varchar(20),
SName varchar(20),
DoB date, 
ContactNo varchar(11),
NextOfKinNo varchar(11),
Disabilities BOOLEAN
);

CREATE TABLE IF NOT EXISTS Employee (
EmployeeID int NOT NULL AUTO_INCREMENT UNIQUE,
PersonID int NOT NULL,
FOREIGN KEY (PersonID) References Person (PersonID),
PRIMARY KEY (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Tenant (
TenantID int NOT NULL AUTO_INCREMENT UNIQUE,
PersonID int NOT NULL,
PRIMARY KEY (TenantID),
FOREIGN KEY (PersonID) References Person (PersonID)
);

CREATE TABLE IF NOT EXISTS Bank_Account (
BankAccountID int NOT NULL,
PersonID int NOT NULL,
AccountNumber int NOT NULL, 
SortCode int NOT NULL,
PRIMARY KEY (BankAccountID),
FOREIGN KEY (PersonID) References Person (PersonID)

);

CREATE TABLE IF NOT EXISTS Manager (
ManagerID int NOT NULL AUTO_INCREMENT UNIQUE,
EmployeeID int NOT NULL,
PRIMARY KEY (ManagerID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Building (
BuildingID int NOT NULL AUTO_INCREMENT UNIQUE,
BuildingNameorNum varchar(25),
Street varchar(255),
PostCode varchar(7),
PRIMARY KEY (BuildingID)
);

CREATE TABLE IF NOT EXISTS Apartment (
ApartmentID int NOT NULL AUTO_INCREMENT UNIQUE,
BuildingID int NOT NULL,
ManagerID int NOT NULL,
Block varchar(32),
Type varchar(32),
HMO BOOLEAN,
PRIMARY KEY (ApartmentID, BuildingID),
FOREIGN KEY (BuildingID) References Building (BuildingID),
FOREIGN KEY (ManagerID) References Manager (ManagerID)
);

CREATE TABLE IF NOT EXISTS Lease (
LeaseID int NOT NULL AUTO_INCREMENT UNIQUE,
TenantID int NOT NULL,
ApartmentID int NOT NULL,
ManagerID int NOT NULL,
Status BOOLEAN NOT NULL,
Cost int NOT NULL,
PRIMARY KEY (LeaseID),
FOREIGN KEY (TenantID) References Tenant(TenantID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID),
FOREIGN KEY (ManagerID) References Manager (ManagerID)
);

CREATE TABLE IF NOT EXISTS Office (
OfficeID int NOT NULL AUTO_INCREMENT UNIQUE,
ApartmentID int NOT NULL,
ManagerID int NOT NULL,
PRIMARY KEY (OfficeID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID),
FOREIGN KEY (ManagerID) References Manager (ManagerID)
);

CREATE TABLE IF NOT EXISTS Technician (
TechnicianID int NOT NULL AUTO_INCREMENT UNIQUE,
EmployeeID int NOT NULL,
Skills set('carpentry','plumbing','electrical') NOT NULL,
PRIMARY KEY (TechnicianID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID)
);

CREATE TABLE IF NOT EXISTS ContractedJobs (
ContractedJobsID int NOT NULL AUTO_INCREMENT UNIQUE,
ManagerID int NOT NULL,
TechnicianID int NOT NULL,
ApartmentID int NOT NULL,
PRIMARY KEY (ContractedJobsID),
FOREIGN KEY (ManagerID) References Manager (ManagerID),
FOREIGN KEY (TechnicianID) References Technician (TechnicianID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID)
);