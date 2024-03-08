SELECT * FROM world.country

SELECT
GNP AS PKB,
Name AS Kontynent,
Population AS Populacja,
SurfaceArea AS Powierzchnia,
LifeExpectancy AS DlugoscZycia
FROM
country;

-sortowanie według kraju z najwiekszym PKB
SELECT
GNP AS PKB,
Name AS Kontynent,
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
Name AS Kontynent,
Population AS Populacja,
SurfaceArea AS Powierzchnia,
LifeExpectancy AS DlugoscZycia
FROM
country
ORDER BY PKB DESC;


SELECT * FROM world.pozycjapkb;

SELECT PKB, Kraj FROM world.pozycjapkb;

