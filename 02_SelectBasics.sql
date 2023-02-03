USE Northwind; --Datenbank auswählen

/*
Mehrzeilige
Kommentar
*/

SELECT 100; --Einzelnen Wert ausgeben

SELECT 10.5; --Kommazahl mit Punkt statt mit Beistrich

SELECT 'Test'; --Texte mit ''

--Strg + E: Markiertes Statement ausführen
--Strg + R: Ergebnisansicht schließen

SELECT 100 * 3; --Berechnung

SELECT '100 * 3'; --Wird als Text interpretiert

SELECT 100 AS Zahl; --AS: Spalte einen Namen geben

SELECT 100 AS Zahl, 'Text' AS Text, 200 AS Zahl2; --Mehrere Spalten auswählen

SELECT * FROM Customers; --*: Alles selektieren (alle Spalten)

SELECT CompanyName FROM Customers; --Bestimmte Spalten auswählen

SELECT CompanyName, ContactName FROM Customers; --Mehrere Spalten auswählen

SELECT Freight * 5 FROM Orders; --Berechnungen auf Spalten durchführen

SELECT Freight % 5 FROM Orders; --Modulo (%): Gibt den Rest einer Division zurück

SELECT Address + City + PostalCode + Country FROM Customers; --Strings verbinden (unschön)

SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country FROM Customers; --Strings verbinden mit Abständen

SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country AS [Volle Adresse] FROM Customers;
SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country AS "Volle Adresse" FROM Customers;
SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country AS 'Volle Adresse' FROM Customers;
--Namen mit Abständen müssen mit [] oder "" angegeben werden

SELECT
CompanyName,
ContactName,
Address,
Phone
FROM Customers; --Umbrüche beliebig möglich