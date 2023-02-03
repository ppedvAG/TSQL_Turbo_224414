USE Northwind;

SELECT * FROM Employees; --EmployeeID
SELECT * FROM Orders; --Datensätze kombinieren über EmployeeID

SELECT * FROM Orders
INNER JOIN Employees --Hier andere Tabelle auswählen
ON Employees.EmployeeID = Orders.EmployeeID; --Hier angeben welche 2 Spalten hinzugefügt werden

SELECT
Employees.EmployeeID, --Ambiguous column name EmployeeID (in Orders und in Employees ist eine EmployeeID enthalten)
FirstName + ' ' + LastName AS FullName,
Freight,
ShipName,
ShipAddress
FROM Orders
INNER JOIN Employees
ON Employees.EmployeeID = Orders.EmployeeID;

SELECT
e.EmployeeID,
e.FirstName + ' ' + e.LastName AS FullName,
o.Freight,
o.ShipName,
o.ShipAddress
FROM Orders o --Tabellenalias: Tabelle einen kurzen Namen geben um diese einfacher zu verwenden
INNER JOIN Employees e
ON e.EmployeeID = o.EmployeeID;

SELECT * FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Orders und Customers kombinieren

SELECT 
o.OrderID,
o.Freight,
o.OrderDate,
c.CustomerID,
c.CompanyName,
c.ContactName,
c.Phone,
CONCAT_WS(' ', c.Address, c.City, c.PostalCode, c.Country) AS [Volle Adresse] --Funktionen im SELECT benutzen
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Sinnvolle Spalten auswählen

SELECT * FROM Customers c
JOIN Orders o --JOIN = INNER JOIN
ON c.CustomerID = o.CustomerID;

SELECT * FROM [Order Details] od
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Orders o ON od.OrderID = o.OrderID; --JOIN mit mehr als 2 Tabellen

SELECT 
o.OrderID,
--p.ProductID,
p.ProductName,
p.QuantityPerUnit,
od.UnitPrice,
od.Quantity,
FORMAT(o.Freight, '#.##$') --Format Funktion um $ anzuzeigen
FROM [Order Details] od
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Orders o ON od.OrderID = o.OrderID; --Sinnvolle Spalten bei JOIN mit 3 Tabellen

SELECT * FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID; --830 Rows

SELECT * FROM Orders
RIGHT JOIN Customers --Beachtet auch Datensätze die auf der anderen Seite keine Übereinstimmung haben
ON Orders.CustomerID = Customers.CustomerID; --832 Rows

SELECT Customers.* FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
WHERE OrderID IS NULL; --Finde alle Customer die keine Bestellung bisher getätigt haben

SELECT * FROM Orders
LEFT JOIN Customers --Alle Order werden ergänzt die keinen Customer auf der anderen Seite haben (gibts nicht)
ON Orders.CustomerID = Customers.CustomerID;

SELECT * FROM Orders
FULL JOIN Customers --Alle Customer die kein Order haben und alle Order die keine Customer haben
ON Orders.CustomerID = Customers.CustomerID;

SELECT * FROM Orders CROSS JOIN Customers; --Alle Order/Customer Kombinationen (75530 Rows)