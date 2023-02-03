USE Northwind;

SELECT GETDATE(); --Jetztiges Datum, Millisekundengenau
SELECT SYSDATETIME(); --Jetztiges Datum, Nanosekundengenau

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

--YEAR/MONTH/DAY
SELECT YEAR(GETDATE()); --Das Jahr vom gegebenen Datum
SELECT MONTH(GETDATE()); --Das Monat vom heutigen Datum
SELECT DAY(GETDATE()); --Der Tag vom heutigen Datum

SELECT HireDate, YEAR(HireDate) FROM Employees; --Datumsfunktion auf eine Spalte anwenden

--DATEPART: Gibt einen Teil eines Datum zurück, flexibler als YEAR/MONTH/DAY
SELECT DATEPART(YEAR, GETDATE()); --Selbiges wie YEAR(...)
SELECT DATEPART(SECOND, GETDATE()); --Die Sekunde von jetzt

SELECT DATEPART(WEEKDAY, GETDATE()); --Wochentag vom heutigen Datum numerisch (5 -> Freitag)
SELECT DATEPART(DAYOFYEAR, GETDATE()); --Der heutige Jahrestag (34)
SELECT DATEPART(QUARTER, GETDATE()); --Das jetztige Quartal (1)

SELECT HireDate, DATEPART(DAYOFYEAR, HireDate) FROM Employees;

--DATEDIFF: Unterschied zwischen zwei Datumswerten ermitteln
SELECT DATEDIFF(YEAR, '20001231', GETDATE()); --Sehr ungenau (23 Jahre obwohl noch 11 Monate fehlen)

SELECT DATEDIFF(YEAR, '2010-11-11', GETDATE()); --ISO-8601 Datum immer möglich
SELECT DATEDIFF(YEAR, '03.02.2020', GETDATE()); --Deutsches Datum möglich weil deutscher Server
SELECT DATEDIFF(YEAR, '10/30/2000', GETDATE()); --Amerikanisches Datum nicht möglich (auf amerikanischem Server möglich)

--Bei Datumswerten generell ISO benutzen

--DATENAME: Von Monat oder Tag den schönen Namen ausgeben
SELECT DATENAME(MONTH, GETDATE()); --Februar
SELECT DATENAME(WEEKDAY, GETDATE()); --Freitag (hier WEEKDAY benutzen)

--DATEADD: Addiert Intervalle auf Datumswerte
SELECT DATEADD(YEAR, 4, GETDATE()); --Addiert 4 Jahre auf das heutige Datum
SELECT DATEADD(YEAR, -4, GETDATE()); --Subtrahiert 4 Jahre vom heutigen Datum

SELECT DATEADD(DAY, 50, GETDATE()); --Überschläge werden beachtet
SELECT DATEADD(DAY, 730, GETDATE()); --Schaltjahre werden auch beachtet