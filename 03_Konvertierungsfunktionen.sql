USE Northwind;

--CAST: Wandelt einen Wert zu einem anderen Typen um
SELECT CAST(GETDATE() AS DATE); --Datetime zu Date konvertieren (Zeit fällt weg)

SELECT CAST(GETDATE() AS TIME); --Datetime zu Time konvertieren (Datum fällt weg)

SELECT CAST('2000-01-01' AS DATE); --Text zu Datum umwandeln (z.B. aus Datei oder aus Webformular)

SELECT HireDate, CAST(HireDate AS DATE) FROM Employees; --Konvertierungsfunktion auf Spalte anwenden

SELECT '123' + 3; --Automatische Konvertierung hier möglich

SELECT '123.4' + 3; --Kommazahlen sind hier nicht möglich

SELECT CAST('123.4' AS FLOAT) + 3; --Hier explizite Konvertierung notwendig

SELECT CAST('2000-01-01' AS DATE); --ISO funktioniert immer
SELECT CAST('03.02.2023' AS DATE); --Funktioniert
SELECT CAST('10/30/2023' AS DATE); --Funktioniert (wieder) nicht

--CONVERT: Selbiges wie CAST nur alt

SELECT CONVERT(DATE, GETDATE());

--Date Styles
--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles

SELECT CONVERT(VARCHAR, GETDATE(), 4); --03.02.23
SELECT CONVERT(VARCHAR, GETDATE(), 104); --03.02.2023

--FORMAT: Formatiert den gegebenen Wert in die angegebene Formatierung

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, n = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT FORMAT(GETDATE(), 'yy-MM-dd');

SELECT FORMAT(GETDATE(), 'dd.MM.yyyy');

SELECT FORMAT(GETDATE(), 'dd ddd dddd MM MMM MMMM yy yyyy');

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy - hh:mm:ss');

SELECT FORMAT(HireDate, 'dddd, dd. MMMM yyyy - hh:mm:ss') FROM Employees;

--Schnellformatierung
SELECT FORMAT(GETDATE(), 'd');
SELECT FORMAT(GETDATE(), 'D');

SELECT FORMAT(12345, 'Die Zahl ist #'); --# ist der Platzhalter für den Text links
SELECT FORMAT(12345, 'Die Zahl beginnt mit # und endet mit #');

SELECT FORMAT(HireDate, 'D') FROM Employees;