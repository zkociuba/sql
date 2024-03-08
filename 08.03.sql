SELECT * FROM world.country

SELECT
GNP AS PKB,
Name AS Kraj,
Continent AS Kontynent,
Population AS Populacja,
SurfaceArea AS Powierzchnia,
LifeExpectancy AS DlugoscZycia
FROM
country;


-sortowanie według kraju z najwiekszym PKB
SELECT
GNP AS PKB,
Name AS Kraj,
Continent AS Kontynent,
Population AS Populacja,
SurfaceArea AS Powierzchnia,
LifeExpectancy AS DlugoscZycia
FROM
country
ORDER BY PKB DESC;

-tworzenie widoku
CREATE VIEW PozycjaPKB AS
SELECT
GNP AS PKB,
Name AS Kraj,
Continent AS Kontynent,
Population AS Populacja,
SurfaceArea AS Powierzchnia,
LifeExpectancy AS DlugoscZycia
FROM
country
ORDER BY PKB DESC;


SELECT * FROM world.pozycjapkb;

-wybieranie poszczególnych kolumn, ale z widoku
SELECT PKB, Kraj FROM world.pozycjapkb;

-zrobić to samo do kolejnych tabel

SELECT
ID AS ID,
Name AS Kraj,
CountryCode AS KodKraju,
District AS Dzielnica,
Population AS Populacja
FROM
city;

CREATE VIEW miasta AS
SELECT
ID AS ID,
Name AS Kraj,
CountryCode AS KodKraju,
District AS Dzielnica,
Population AS Populacja
FROM
city
ORDER BY ID DESC;


SELECT
CountryCode AS KodKraju,
Language AS Jezyk,
isOfficial AS CzyJestOficjalny,
Percentage AS Procent
FROM
countrylanguage;

CREATE VIEW JezykKraju AS
SELECT
CountryCode AS KodKraju,
Language AS Jezyk,
isOfficial AS CzyJestOficjalny,
Percentage AS Procent
FROM
countrylanguage
ORDER BY KodKraju DESC;

-jakas numeracja
SET @nr :=0;
SELECT @nr := +1, PKB, Kraj, DlugoscZycia FROM world.pozycjapkb;

-jakis alias np.AS pozycja
SET @nr :=0;
SELECT @nr := @nr +1 AS Pozycja, PKB, Kraj, DlugoscZycia FROM world.pozycjapkb;

SELECT * FROM pozycjapkb WHERE Kontynent = 'Europe';
SELECT * FROM pozycjapkb WHERE Kontynent = 'Europe' ORDER BY DlugoscZycia;

SELECT * FROM miasta WHERE KodKraju = 'PSE';


SELECT
concat(C.first_name, ' ', C.last_name) AS klient,
SUM(P.amount) AS Zaplacil,
AVG(P.amount) AS Srednia
FROM
payment AS P, customer AS C 
WHERE
C.customer_id= P.customer_id
GROUP BY
C.customer_id
ORDER BY Zaplacil DESC;

CREATE VIEW Platnosci AS
SELECT
concat(C.first_name, ' ', C.last_name) AS klient,
SUM(P.amount) AS Zaplacil,
AVG(P.amount) AS Srednia
FROM
payment AS P, customer AS C 
WHERE
C.customer_id= P.customer_id
GROUP BY
C.customer_id
ORDER BY Zaplacil DESC;



ZADANIE 30
-stwórz widok powstały na podstawie 2 tabel z bazy danych world
CREATE VIEW CountryCapitalView AS
SELECT country.Name AS CountryName, city.Name AS CapitalName
FROM country
INNER JOIN city ON country.Capital = city.ID;

-sprawdz widoki w bazie danych Sakila i stworz 3 widoki podobne z użyciem join  

-dodaj do tabeli z językami jeszcze informacje o kraju, aby widzieć już nie po kodzie kraju, ale
po nazwie kraju jaki jest język, czy jest oficjalny i w ilu "procentach" jest uzywany.
Informacje o kraju dodaj z tabeli country do countrylanguage i powiąż po kodzie, gdzie w jednej tabeli nazywa się to code, a w drugiej Countrycode.
Aby to zrobić uzyj lewostronnego połączenia.



