--1
SELECT Person.FName, Person.SName, Person.ContactNo 
FROM Person 
WHERE Person.Disabillities = TRUE AND (Tenant.TenantID > 0); 