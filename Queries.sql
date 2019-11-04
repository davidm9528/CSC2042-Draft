--1
SELECT Person.FName, Person.SName, Person.ContactNo 
FROM Person 
WHERE Person.Disabillities = TRUE AND (Tenant.TenantID > 0)
AND (Employee.EmployeeID = 0); 

--5
SELECT Person.FName, Person.ContactNo, Person.SName, Office.OfficeID 
FROM Person
--Can't be completed with current table attribuites (no elms names in the table)

