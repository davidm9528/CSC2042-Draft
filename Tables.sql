--Comments within table are queries to bring up on the 2nd meeting.
--Potential additions or removals relating back to the 2nd ERD diagram created.

--Person
CREATE TABLE IF NOT EXISTS 'Person' (
'PersonID' int NOT NULL AUTO_INCREMENT UNIQUE,
'FName' char,
'SName' char,
'DoB' date, 
'ContactNo' varchar(11),
'NextOfKinNo' varchar(11),
'Diabilities' BOOLEAN,
PRIMARY KEY ('PersonID'),
FOREIGN KEY ('TenantID') References 'Tenant' ('TenantID'),
FOREIGN KEY ('EmployeeID') References 'Employee' ('EmployeeID'),
FOREIGN KEY ('BankAccountID') References 'BankAccount' ('BankAccountID')
);



--Employee--
CREATE TABLE IF NOT EXISTS 'Employee' (
'EmployeeID' int NOT NULL AUTO_INCREMENT UNIQUE,
FOREIGN KEY ('PersonID') References 'Person' ('PersonID'),
FOREIGN KEY ('PaymentsOutgoingREF') References 'PaymentsOutgoing' ('PaymentsOutgoingREF'),
FOREIGN KEY ('TechniciansID') References 'Technicians' ('TechniciansID'),
FOREIGN KEY ('ManagerID') References 'Manager' ('ManagerID'),
FOREIGN KEY ('EmployeeContractID') References 'EmployeeContract' ('EmployeeContractID'),
PRIMARY KEY ('EmployeeID')
);



--Tenant--
CREATE TABLE IF NOT EXISTS 'Tenant' (
'TenantID' int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY ('TenantID'),
FOREIGN KEY ('PersonID') References 'Person' ('PersonID'),
FOREIGN KEY ('VisitorID') References 'Visitor' ('VisitorID'),
FOREIGN KEY ('LeaseID') References 'Lease' ('LeaseID'),
FOREIGN KEY ('PaymentsIncomingREF') References 'PaymentsIncoming'('PaymentsIncomingREF')
);



--Bank Account--
CREATE TABLE IF NOT EXISTS 'Bank Account' (
'BankAccountID' int NOT NULL AUTO_INCREMENT UNIQUE,
FOREIGN KEY ('PersonID') References 'Person' ('PersonID'),
FOREIGN KEY ('PaymentsOutgoingREF') References 'PaymentsOutgoing' ('PaymentsOutgoingREF'),
FOREIGN KEY ('PaymentsIncomingREF') References 'PaymentsIncoming' ('PaymentsIncomingREF'),
'AccountNumber' smallint NOT NULL, 
'SortCode' smallint NOT NULL
);



--Visitor
CREATE TABLE IF NOT EXISTS 'Visitor' (
--FOREIGN KEY ('TenantID') References 'Tenant' ('TenantID'),
FOREIGN KEY ('LeaseID') References 'Lease' ('LeaseID'),
'VFName' char,
'VSName' char,
'Duration' TIME NOT NULL
);



--Building--
CREATE TABLE IF NOT EXISTS 'Building' (
'BuildingID' int NOT NULL AUTO_INCREMENT UNIQUE,
'BuildingName' varchar(3),
'Address' char,
'PostCode' varchar(7) UNIQUE,
PRIMARY KEY ('BuildingID'),
FOREIGN KEY ('ApartmentID') References 'Apartment' ('ApartmentID')
);



--Apartment--
CREATE TABLE IF NOT EXISTS 'Apartment' (
'ApartmentID' int NOT NULL AUTO_INCREMENT UNIQUE,
'Block' varchar(32),
'Type' varchar(32),
'HMO' BOOLEAN, --Yes or no
PRIMARY KEY ('Appartment_Block'),
FOREIGN KEY ('LeaseID') References 'Lease' ('LeaseID'),
FOREIGN KEY ('ContractedJobsID') References 'ContractedJobs' ('ContractedJobsID'), 
FOREIGN KEY ('BuildingID') References 'Building' ('BuildingID'),
FOREIGN KEY ('OfficeID') References 'Office' ('OfficeID')
--FOREIGN KEY ('ManagerID') References 'Manager' ('ManagerID')
);



--Lease--
CREATE TABLE IF NOT EXISTS 'Lease' (
'LeaseID' int NOT NULL AUTO_INCREMENT UNIQUE,
'Status'  BOOLEAN, --Yes or no (Paid or not paid)
'Cost' int NOT NULL,
FOREIGN KEY ('TenantID') References 'Tenant'('TenantID'),
FOREIGN KEY ('ApartmentID') References 'Apartment' ('ApartmentID'),
FOREIGN KEY ('OfficeID') References 'Office' ('OfficeID'),
FOREIGN KEY ('ManagerID') References 'Manager' ('ManagerID'),
PRIMARY KEY ('LeaseID')
);



--Manager--
CREATE TABLE IF NOT EXISTS 'Manager' (
'ManagerID'int NOT NULL AUTO_INCREMENT UNIQUE,
--
PRIMARY KEY ('ManagerID'),
FOREIGN KEY ('PersonID') References 'Person'('PersonID'),
FOREIGN KEY ('ApartmentID') References 'Apartment' ('ApartmentID'),
FOREIGN KEY ('ContractedJobsID') References 'ContractedJobs' ('ContractedJobsID'),
FOREIGN KEY ('EmployeeID') References 'Employee' ('EmployeeID'),
FOREIGN KEY ('LeaseID') References 'Lease' ('LeaseID')
);




--Office--
CREATE TABLE IF NOT EXISTS 'Office' (
'OfficeID' int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY ('OfficeID'),
FOREIGN KEY ('ApartmentID') References 'Apartment' ('ApartmentID'),
FOREIGN KEY ('ManagerID') References 'Manager' ('ManagerID')
);



--Jobs/Contracts--
CREATE TABLE IF NOT EXISTS 'ContractedJobs' (
'ContractedJobsID'int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY ('ContractedJobsID'),
FOREIGN KEY ('ManagerID') References 'Manager' ('ManagerID'),
FOREIGN KEY ('TechniciansID') References 'Technicians' ('TechniciansID'),
FOREIGN KEY ('ApartmentID') References 'Apartment' ('ApartmentID')
);



--Technicians--
CREATE TABLE IF NOT EXISTS 'Technicians' (
'TechniciansID' int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY ('TechniciansID'),
FOREIGN KEY ('EmployeeID') References 'Employee' ('EmployeeID'),
FOREIGN KEY ('ContractedJobsID') References 'ContractedJobs' ('ContractedJobsID')
);



--EmployeeContract
CREATE TABLE IF NOT EXISTS 'EmployeeContract' (
'EmployeeContractID' int NOT NULL AUTO_INCREMENT UNIQUE,
'EmpRate' int NOT NULL,
'EmpHRsPWeek' TIME,
FOREIGN KEY ('EmployeeID') References 'Employee' ('EmployeeID'),
PRIMARY KEY ('EmployeeContractID')
);



--PaymentsOutgoing
CREATE TABLE IF NOT EXISTS 'PaymentsOutgoing' (
'PaymentsOutgoingREF' int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY ('PaymentsOutgoingREF'),
FOREIGN KEY ('BankAccountID') References 'BankAccount' ('BankAccountID'),
FOREIGN KEY ('EmployeeID') References 'Employee' ('EmployeeID')
--
);



--PaymentsIncoming
CREATE TABLE IF NOT EXISTS 'PaymentsIncoming' (
'PaymentsIncomingREF' int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY ('PaymentsIncomingREF'),
FOREIGN KEY ('BankAccountID') References 'BankAccount' ('BankAccountID'),
FOREIGN KEY ('TenantID') References 'Tenant' ('TenantID'),
--
--
);



----------------------------------------------------------------------
----------------------------QUOTES------------------------------------
----------------------------------------------------------------------



CREATE TABLE IF NOT EXISTS Person (
PersonID int NOT NULL AUTO_INCREMENT UNIQUE,
FName char,
SName char,
DoB date, 
ContactNo varchar(11),
NextOfKinNo varchar(11),
Diabilities BOOLEAN,
PRIMARY KEY (PersonID),
FOREIGN KEY (TenantID) References Tenant (TenantID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID),
FOREIGN KEY (BankAccountID) References BankAccount (BankAccountID)
);



--Employee--
CREATE TABLE IF NOT EXISTS Employee (
EmployeeID int NOT NULL AUTO_INCREMENT UNIQUE,
FOREIGN KEY (PersonID) References Person (PersonID),
FOREIGN KEY (PaymentsOutgoingREF) References PaymentsOutgoing (PaymentsOutgoingREF),
FOREIGN KEY (TechniciansID) References Technicians (TechniciansID),
FOREIGN KEY (ManagerID) References Manager (ManagerID),
FOREIGN KEY (EmployeeContractID) References EmployeeContract (EmployeeContractID),
PRIMARY KEY (EmployeeID)
);



--Tenant--
CREATE TABLE IF NOT EXISTS Tenant (
TenantID int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY (TenantID),
FOREIGN KEY (PersonID) References Person (PersonID),
FOREIGN KEY (VisitorID) References Visitor (VisitorID),
FOREIGN KEY (LeaseID) References Lease (LeaseID),
FOREIGN KEY (PaymentsIncomingREF) References PaymentsIncoming(PaymentsIncomingREF)
);



--Bank Account--
CREATE TABLE IF NOT EXISTS Bank Account (
BankAccountID int NOT NULL AUTO_INCREMENT UNIQUE,
FOREIGN KEY (PersonID) References Person (PersonID),
FOREIGN KEY (PaymentsOutgoingREF) References PaymentsOutgoing (PaymentsOutgoingREF),
FOREIGN KEY (PaymentsIncomingREF) References PaymentsIncoming (PaymentsIncomingREF),
AccountNumber smallint NOT NULL, 
SortCode smallint NOT NULL
);



--Visitor
CREATE TABLE IF NOT EXISTS Visitor (
--FOREIGN KEY (TenantID) References Tenant (TenantID),
FOREIGN KEY (LeaseID) References Lease (LeaseID),
VFName char,
VSName char,
Duration TIME NOT NULL
);



--Building--
CREATE TABLE IF NOT EXISTS Building (
BuildingID int NOT NULL AUTO_INCREMENT UNIQUE,
BuildingName varchar(3),
Address char,
PostCode varchar(7) UNIQUE,
PRIMARY KEY (BuildingID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID)
);



--Apartment--
CREATE TABLE IF NOT EXISTS Apartment (
ApartmentID int NOT NULL AUTO_INCREMENT UNIQUE,
Block varchar(32),
Type varchar(32),
HMO BOOLEAN, --Yes or no
PRIMARY KEY (Appartment_Block),
FOREIGN KEY (LeaseID) References Lease (LeaseID),
FOREIGN KEY (ContractedJobsID) References ContractedJobs (ContractedJobsID), 
FOREIGN KEY (BuildingID) References Building (BuildingID),
FOREIGN KEY (OfficeID) References Office (OfficeID)
--FOREIGN KEY (ManagerID) References Manager (ManagerID)
);



--Lease--
CREATE TABLE IF NOT EXISTS Lease (
LeaseID int NOT NULL AUTO_INCREMENT UNIQUE,
Status  BOOLEAN, --Yes or no (Paid or not paid)
Cost int NOT NULL,
FOREIGN KEY (TenantID) References Tenant(TenantID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID),
FOREIGN KEY (OfficeID) References Office (OfficeID),
FOREIGN KEY (ManagerID) References Manager (ManagerID),
PRIMARY KEY (LeaseID)
);



--Manager--
CREATE TABLE IF NOT EXISTS Manager (
ManagerIDint NOT NULL AUTO_INCREMENT UNIQUE,
--
PRIMARY KEY (ManagerID),
FOREIGN KEY (PersonID) References Person(PersonID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID),
FOREIGN KEY (ContractedJobsID) References ContractedJobs (ContractedJobsID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID),
FOREIGN KEY (LeaseID) References Lease (LeaseID)
);



--Office--
CREATE TABLE IF NOT EXISTS Office (
OfficeID int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY (OfficeID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID),
FOREIGN KEY (ManagerID) References Manager (ManagerID)
);



--Jobs/Contracts--
CREATE TABLE IF NOT EXISTS ContractedJobs (
ContractedJobsIDint NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY (ContractedJobsID),
FOREIGN KEY (ManagerID) References Manager (ManagerID),
FOREIGN KEY (TechniciansID) References Technicians (TechniciansID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID)
);



--Technicians--
CREATE TABLE IF NOT EXISTS Technicians (
TechniciansID int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY (TechniciansID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID),
FOREIGN KEY (ContractedJobsID) References ContractedJobs (ContractedJobsID)
);



--EmployeeContract
CREATE TABLE IF NOT EXISTS EmployeeContract (
EmployeeContractID int NOT NULL AUTO_INCREMENT UNIQUE,
EmpRate int NOT NULL,
EmpHRsPWeek TIME,
FOREIGN KEY (EmployeeID) References Employee (EmployeeID),
PRIMARY KEY (EmployeeContractID)
);



--PaymentsOutgoing
CREATE TABLE IF NOT EXISTS PaymentsOutgoing (
PaymentsOutgoingREF int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY (PaymentsOutgoingREF),
FOREIGN KEY (BankAccountID) References BankAccount (BankAccountID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID)
--
);



--PaymentsIncoming
CREATE TABLE IF NOT EXISTS PaymentsIncoming (
PaymentsIncomingREF int NOT NULL AUTO_INCREMENT UNIQUE,
PRIMARY KEY (PaymentsIncomingREF),
FOREIGN KEY (BankAccountID) References BankAccount (BankAccountID),
FOREIGN KEY (TenantID) References Tenant (TenantID),
--
--
);

