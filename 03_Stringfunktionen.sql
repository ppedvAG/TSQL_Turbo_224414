USE Northwind;

SELECT FirstName + ' ' + LastName FROM Employees; --Strings verbinden mit +

SELECT CONCAT(FirstName, ' ', LastName) FROM Employees; --CONCAT: beliebig viele Strings zusammenbauen

SELECT CONCAT_WS(' ', Address, City, PostalCode, Country) FROM Customers; --CONCAT_WS: Concat with Separator, baut beliebig viele Strings zusammen

--TRIM/LTRIM/RTRIM: Schneiden Abstände weg
SELECT TRIM(' Test '); --Alle Abstände links und rechts wegschneiden
SELECT LTRIM(' Test '); --Alle Abstände links wegschneiden
SELECT RTRIM(' Test '); --Alle Abstände rechts wegschneiden

--LOWER/UPPER: Macht den Text lowercase oder UPPERCASE
SELECT LOWER('Test');
SELECT UPPER('Test');

--LEN/DATALENGTH: Geben die Länge eines Texts zurück
SELECT LEN(' Test '); --Macht automatisch ein RTRIM
SELECT DATALENGTH(' Test '); --DATALENGTH um RTRIM zu verhindern

--REVERSE: Dreht den String um
SELECT REVERSE('Test');

SELECT LEN(FirstName), REVERSE(LastName) FROM Employees; --Funktionen auf Spalten anwenden

--LEFT/RIGHT/SUBSTRING: Geben einen Teil des Strings zurück
SELECT LEFT('Testtext', 4); --Die linken 4 Zeichen (Test)
SELECT RIGHT('Testtext', 4); --Die rechten 4 Zeichen (text)
SELECT SUBSTRING('Testtext', 2, 4); --Zeichen von der Mitte nehmen (2 als Startzeichen -> e und dann 4 Zeichen -> estt)

--REPLICATE: Gibt den String X-mal aus
SELECT REPLICATE('xy', 10);

--STUFF: In einen Text einen anderen Text einfügen
SELECT STUFF('Testtext', 2, 0, '_Hallo_'); --Vor Stelle 2 (e) den Text (_Hallo_) mit 0 Zeichen Überschreibung einbauen
SELECT STUFF('Testtext', 2, 7, '_Hallo_'); --Ab Stelle 2 7 Zeichen überschreiben mit dem neuen Text

--REPLACE: Ersetzt alle Vorkommnisse von dem gegebenen Zeichen mit einem anderen Zeichen
SELECT REPLACE('Testtext', 'x', '-'); --Ersetze alle X mit einem Bindestrich
SELECT REPLACE('Testtext', 'e', '-'); --Beide E's weg
SELECT REPLACE('Test', 't', '-'); --Groß-/Kleinschreibung wird hier nicht beachtet

--CHARINDEX: Gibt die erste Stelle des gesuchten Zeichens zurück
SELECT CHARINDEX('e', 'Testtext'); --Erstes Vorkommnis von E: Stelle 2
SELECT CHARINDEX('e', 'Testtext', 4); --Suche ab Stelle 4 das erste E: Stelle 6