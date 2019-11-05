INSERT INTO Person(FName,SName,ContactNo,DoB,EmergencyContactName,EmergencyContactNumber, Disabilities)
VALUES('John','Smith',07763549871,'1999-01-15','James Smith',07855643251, FALSE);

INSERT INTO Employee(PersonID,Salary)
VALUES(1,1500);

INSERT INTO Bank_Account(PersonID,AccountNumber,SortCode)
VALUES(1,99252584,452345);

INSERT INTO Building(BuildingName,Street,PostCode)
VALUES('Elms','78 Malone Rd', 'BT9 5BW');

INSERT INTO Manager(EmployeeID)
VALUES(1);

INSERT INTO Apartment(ApartmentNo,NumBedrooms,NumBathrooms,TotalArea,BuildingID,ManagerID)
VALUES(1,1,1,300,1,1);

INSERT INTO Office(ApartmentID,ManagerID)
VALUES(1,1);

--Inserting a tenant--
INSERT INTO Person(FName,SName,ContactNumber,DoB,EmergencyContactName,EmergencyContactNumber)
VALUES('Michael','Apple',07765679871,'2000-02-20','Sarah Apple',07895683251);

INSERT INTO Tenant(PersonID)
VALUES(2);

INSERT INTO Bank_Account(PersonID,AccountNumber,SortCode)
VALUES(2,25684565,985585);

INSERT INTO Lease(ApartmentID,ManagerID,StartDate,Duration,Rent)
VALUES(1,1,'2019-01-01',9,130);

INSERT INTO LeaseTenants(LeaseID,TenantID)
VALUES(1,1);

--Inserting a Technician--
INSERT INTO Person(FName,SName,ContactNumber,DoB,EmergencyContactName,EmergencyContactNumber)
VALUES('Ronan','Martin',07763549871,'1999-01-15','Jason Martin',07855643251);

INSERT INTO Bank_Account(PersonID,AccountNumber,SortCode)
VALUES(3,94284565,985346);

INSERT INTO Employee(PersonID,Salary)
VALUES(3,1300);

INSERT INTO Technician(EmployeeID,Skills)
VALUES(2,'carpentry,electrical');

INSERT INTO ContractedJobs(ManagerID,TechnicianID,ApartmentID,WorkRequired,WorkCompleted)
VALUES(1,1,1,'Light in hall fixed',TRUE);