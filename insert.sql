INSERT INTO 'Person'('FName','SName','DoB','ContactNo','NextOfKinNo','Disabilities')
VALUES('John','Smith',1999-01-15,07763549871,07855643251,FALSE);

INSERT INTO 'Employee'('PersonID')
VALUES('1');

INSERT INTO 'Bank Account'('BankAccountID','PersonID','AccountNumber','SortCode')
VALUES(1,1,99845656,456925);

INSERT INTO 'Building'('BuildingNum','Street','PostCode')
VALUES('Elms','78 Malone Rd', 'BT9 5BW');

INSERT INTO 'Apartment'('BuildingID','ManagerID','Block','Type','HMO')
VALUES(1,1,'Ash','Term-Time',TRUE);

INSERT INTO 'Manager'('EmployeeID')
VALUES(1);

INSERT INTO 'Office'('ApartmentID','ManagerID')
VALUES(1,1);

INSERT INTO 'Person'('FName','SName','DoB','ContactNo','NextOfKinNo','Disabilities')
VALUES('Michael','Apple',2000-02-20,07765679871,07895683251,TRUE);

INSERT INTO 'Tenant'('PersonID')
VALUES(2);

INSERT INTO 'Bank Account'('BankAccountID','PersonID','AccountNumber','SortCode')
VALUES(2,2,25645656,987925);

INSERT INTO 'Lease'('TenantID','ApartmentID','ManagerID','Status','Cost')
VALUES(1,1,1TRUE,130);