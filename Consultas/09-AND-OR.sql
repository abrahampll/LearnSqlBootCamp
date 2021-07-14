USE AdventureWorks
GO

-- AND 
SELECT * 
FROM Person.Person
WHERE FirstName LIKE 'R%' AND LastName LIKE 'H%' -- 60

SELECT * 
FROM Person.Person
WHERE FirstName LIKE 'R%' OR LastName LIKE 'H%'  -- 2299

SELECT *
FROM Person.Person
WHERE FirstName LIKE 'R%' AND LastName LIKE 'H%' OR MiddleName = 'M'
-- 1196


SELECT *
FROM Person.Person
WHERE FirstName LIKE 'R%' AND (LastName LIKE 'H%' OR MiddleName = 'M')
-- 124