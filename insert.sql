INSERT INTO `Person`(`FName`,`SName`,`DoB`,`ContactNo`,`NextOfKinNo`,`Disabilities`)
VALUES('John','Smith','1999-01-15',07763549871,07855643251,FALSE);

INSERT INTO `Employee`(`PersonID`)
VALUES(1);

INSERT INTO `Bank_Account`(`BankAccountID`,`PersonID`,`AccountNumber`,`SortCode`)
VALUES(1,1,992525286,452345);

INSERT INTO `Building`(`BuildingNameorNum`,`Street`,`PostCode`)
VALUES('Elms','78 Malone Rd', 'BT9 5BW');

INSERT INTO `Manager`(`EmployeeID`)
VALUES(1);

INSERT INTO `Apartment`(`BuildingID`,`ManagerID`,`Block`,`Type`,`HMO`)
VALUES(1,1,'Ash','Term-Time',TRUE);

INSERT INTO `Office`(`ApartmentID`,`ManagerID`)
VALUES(1,1);

INSERT INTO `Person`(`FName`,`SName`,`DoB`,`ContactNo`,`NextOfKinNo`,`Disabilities`)
VALUES('Michael','Apple','2000-02-20',07765679871,07895683251,TRUE);

INSERT INTO `Tenant`(`PersonID`)
VALUES(2);

INSERT INTO `Bank_Account`(`BankAccountID`,`PersonID`,`AccountNumber`,`SortCode`)
VALUES(2,2,256845656,985585);

INSERT INTO `Lease`(`TenantID`,`ApartmentID`,`ManagerID`,`Status`,`Cost`)
VALUES(1,1,1,TRUE,130);

INSERT INTO `Person`(`FName`,`SName`,`DoB`,`ContactNo`,`NextOfKinNo`,`Disabilities`)
VALUES('Ronan','Martin','1999-01-15',07763549871,07855643251,FALSE);

INSERT INTO `Employee`(`PersonID`)
VALUES(3);

INSERT INTO `Technician`(`EmployeeID`,`Skills`)
VALUES(2,'carpentry,electrical');

INSERT INTO `ContractedJobs`(`ManagerID`,`TechnicianID`,`ApartmentID`)
VALUES(1,1,1);