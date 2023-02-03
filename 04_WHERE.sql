USE Northwind;

--WHERE: Ausgabe filtern nach Bedingungen
-- <, >, <=, >= kleiner, größer, kleiner-gleich, größer-gleich
-- =, !=, <> gleich, ungleich, ungleich
-- BETWEEN, IN, LIKE: BETWEEN: Zwischen X und Y, IN: Innerhalb einer Liste, LIKE: Wildcards
-- AND, OR: Bedingungen verknüpfen, AND: Beide Bedingungen müssen wahr sein, OR: Mindestens eine Bedingung muss wahr sein
-- NOT: Bedingung invertieren

SELECT * FROM Orders WHERE Freight > 50; --Bestellungen mit Freight mindestens 50

SELECT * FROM Orders WHERE Freight < 50;

SELECT * FROM Orders WHERE EmployeeID = 1 AND Freight > 50; --Alle Bestellungen vom Employee 1 mit mindestens 50 Frachtkosten

SELECT * FROM Orders WHERE EmployeeID = 1 OR Freight > 50; --Alle Bestellungen vom Employee 1 und alle Bestellungen die mindestens 50 kosten

--BETWEEN

SELECT * FROM Orders WHERE Freight BETWEEN 10 AND 20; --Alle Bestellungen mit Frachtkosten von 10 bis 20

SELECT * FROM Orders WHERE EmployeeID BETWEEN 1 AND 3; --Grenzen sind inkludiert

SELECT * FROM Orders WHERE OrderDate BETWEEN '19970101' AND '19970303'; --Between mit Datumswerten

SELECT * FROM Orders WHERE OrderDate BETWEEN '1997-01-01' AND '1997-06-30'; --In MySQL möglich, hier nicht

--Funktionen

SELECT * FROM Orders WHERE YEAR(OrderDate) = 1997; --Funktionen im WHERE benutzen

SELECT * FROM Orders WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 10; --Funktionen kombinieren

SELECT * FROM Orders WHERE LEFT(ShipName, 1) = 'A'; --Auch andere Funktionen hier möglich

--IN

SELECT * FROM Customers WHERE Country = 'Spain' OR Country = 'UK' OR Country = 'USA'; --Lang und unübersichtlich

SELECT * FROM Customers WHERE Country IN('Spain', 'UK', 'USA'); --Selbiges wie oben nur mit IN

SELECT * FROM Orders WHERE EmployeeID IN(1, 2, 5, 8); --IN mit numerischen Werten

SELECT * FROM Orders WHERE YEAR(OrderDate) IN(1997, 1998); --IN mit Funktionen

SELECT * FROM Orders WHERE ShipCountry = 'UK' AND (YEAR(OrderDate) = 1997 OR YEAR(OrderDate) = 1998);

--NULL

SELECT * FROM Customers WHERE Fax = NULL; --NULL Vergleiche funktioniert nicht mit = oder !=

SELECT * FROM Customers WHERE Fax IS NULL; --IS muss verwendet werden für Null Vergleiche

SELECT * FROM Customers WHERE Fax IS NOT NULL; --IS NOT NULL um zu schauen welche Datensätze nicht leer sind

--NOT

SELECT * FROM Orders WHERE EmployeeID NOT IN(1, 2, 5, 8);

SELECT * FROM Orders WHERE Freight NOT BETWEEN 10 AND 20;