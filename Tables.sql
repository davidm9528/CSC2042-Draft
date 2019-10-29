--Person
CREATE TABLE IF NOT EXISTS 'Person' (
'PersonID' int NOT NULL AUTO_INCREMENT UNIQUE,
'FName' varchar(20),
'SName' varchar(20),
'DoB' date, 
'ContactNo' varchar(11),
'NextOfKinNo' varchar(11),
'Diabilities' BOOLEAN,
);


--Employee--
CREATE TABLE IF NOT EXISTS 'Employee' (
'EmployeeID' int NOT NULL AUTO_INCREMENT UNIQUE,
'PersonID' int NOT NULL,
FOREIGN KEY ('PersonID') References 'Person' ('PersonID'),
PRIMARY KEY ('EmployeeID')
);



--Tenant--
CREATE TABLE IF NOT EXISTS 'Tenant' (
'TenantID' int NOT NULL AUTO_INCREMENT UNIQUE,
'PersonID' int NOT NULL,
PRIMARY KEY ('TenantID'),
FOREIGN KEY ('PersonID') References 'Person' ('PersonID'),
);



--Bank Account--
CREATE TABLE IF NOT EXISTS 'Bank Account' (
'BankAccountID' int NOT NULL,
'PersonID' int NOT NULL,
'AccountNumber' smallint NOT NULL, 
'SortCode' smallint NOT NULL
PRIMARY KEY ('BankAccountID'),
FOREIGN KEY ('PersonID') References 'Person' ('PersonID'),

);

--Building--
CREATE TABLE IF NOT EXISTS 'Building' (
'BuildingID' int NOT NULL AUTO_INCREMENT UNIQUE,
'BuildingNum' varchar(3),
'Street' varchar(255),
'PostCode' varchar(7),
PRIMARY KEY ('BuildingID'),
);



--Apartment--
CREATE TABLE IF NOT EXISTS 'Apartment' (
'ApartmentID' int NOT NULL AUTO_INCREMENT UNIQUE,
'BuildingID' int NOT NULL,
'ManagerID' int NOT NULL,
'Block' varchar(32),
'Type' varchar(32),
'HMO' BOOLEAN, --Yes or no
PRIMARY KEY ('AppartmentID'),
PRIMARY KEY ('BuildingID'),
FOREIGN KEY ('BuildingID') References 'Building' ('BuildingID'),
FOREIGN KEY ('ManagerID') References 'Manager' ('ManagerID')
);



--Lease--
CREATE TABLE IF NOT EXISTS 'Lease' (
'LeaseID' int NOT NULL AUTO_INCREMENT UNIQUE,
'TenantID' int NOT NULL,
'ApartmentID' int NOT NULL,
'ManagerID' int NOT NULL,
'Status' BOOLEAN NOT NULL, -- Ongoing(true) or expired(false)
'Cost' int NOT NULL,
PRIMARY KEY ('LeaseID')
FOREIGN KEY ('TenantID') References 'Tenant'('TenantID'),
FOREIGN KEY ('ApartmentID') References 'Apartment' ('ApartmentID'),
FOREIGN KEY ('ManagerID') References 'Manager' ('ManagerID'),
);



--Manager--
CREATE TABLE IF NOT EXISTS 'Manager' (
'ManagerID'int NOT NULL AUTO_INCREMENT UNIQUE,
'EmployeeID'int NOT NULL,
PRIMARY KEY ('ManagerID'),
FOREIGN KEY ('EmployeeID') References 'Employee' ('EmployeeID'),
);




--Office--
CREATE TABLE IF NOT EXISTS 'Office' (
'OfficeID' int NOT NULL AUTO_INCREMENT UNIQUE,
'ApartmentID' int NOT NULL,
'ManagerID'int NOT NULL,
PRIMARY KEY ('OfficeID'),
FOREIGN KEY ('ApartmentID') References 'Apartment' ('ApartmentID'),
FOREIGN KEY ('ManagerID') References 'Manager' ('ManagerID')
);



--Jobs/Contracts--
CREATE TABLE IF NOT EXISTS 'ContractedJobs' (
'ContractedJobsID'int NOT NULL AUTO_INCREMENT UNIQUE,
'ManagerID'int NOT NULL,
'TechnicianID'int NOT NULL,
'ApartmentID' int NOT NULL,
PRIMARY KEY ('ContractedJobsID'),
FOREIGN KEY ('ManagerID') References 'Manager' ('ManagerID'),
FOREIGN KEY ('TechnicianID') References 'Technicians' ('TechnicianID'),
FOREIGN KEY ('ApartmentID') References 'Apartment' ('ApartmentID')
);



--Technicians--
CREATE TABLE IF NOT EXISTS 'Technicians' (
'TechnicianID' int NOT NULL AUTO_INCREMENT UNIQUE,
'EmployeeID'int NOT NULL,
PRIMARY KEY ('TechnicianID'),
FOREIGN KEY ('EmployeeID') References 'Employee' ('EmployeeID'),
);



--EmployeeContract
CREATE TABLE IF NOT EXISTS 'EmployeeContract' (
'EmployeeContractID' int NOT NULL AUTO_INCREMENT UNIQUE,
'EmployeeID'int NOT NULL,
'EmpRate' int NOT NULL,
'EmpHRsPWeek' TIME,
FOREIGN KEY ('EmployeeID') References 'Employee' ('EmployeeID'),
PRIMARY KEY ('EmployeeContractID')
);

--------Maybe remove payments incoming and outcoming to make it more simple-------------

--PaymentsOutgoing
-- CREATE TABLE IF NOT EXISTS 'PaymentsOutgoing' (
-- 'PaymentsOutgoingREF' int NOT NULL AUTO_INCREMENT UNIQUE,
-- PRIMARY KEY ('PaymentsOutgoingREF'),
-- FOREIGN KEY ('BankAccountID') References 'BankAccount' ('BankAccountID'),
-- FOREIGN KEY ('EmployeeID') References 'Employee' ('EmployeeID')

-- );



--PaymentsIncoming
-- CREATE TABLE IF NOT EXISTS 'PaymentsIncoming' (
-- 'PaymentsIncomingREF' int NOT NULL AUTO_INCREMENT UNIQUE,
-- PRIMARY KEY ('PaymentsIncomingREF'),
-- FOREIGN KEY ('BankAccountID') References 'BankAccount' ('BankAccountID'),
-- FOREIGN KEY ('TenantID') References 'Tenant' ('TenantID'),
--
--
--);