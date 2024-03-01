alter table sprzedaz add blokada int default 1

DELIMITER $$
create TRIGGER aktualizacjasprzedazy before update on sprzedaz 
for each row 
	begin 
		if(SELECT blokada from sprzedaz where id=NEW.id)>0 then 
        signal sqlstate '45000' set MESSAGE_TEXT = 'Blad: nie mozna zaktualizowac rekordu';
        end if;
    end $$
DELIMITER ;

-- delimiter - separator zaczyna się od deli..$$
-- sqlstate- wyświetla błąd

START TRANSACTION;
UPDATE sprzedaz SET cena=300 WHERE id=3;
COMMIT;
SELECT * FROM sprzedaz;

INSERT INTO sprzedaz(id_towaru, sztuk, cena, kursantki_id, blokada) VALUES (1,10,100,2,0);
SELECT * FROM sprzedaz;

START TRANSACTION;
UPDATE sprzedaz set cena=333 where id=7;
COMMIT;
SELECT * FROM sprzedaz;

CREATE TABLE zdarzenia (
`id` serial,
`czas` timestamp,
`wydarzenia` varchar(255),
`uzytkownik` varchar(255),
`tablica` varchar(255),
`record_id` bigint
);
    
DELIMITER $$
CREATE TRIGGER logSprzedazy AFTER INSERT ON sprzedaz
FOR EACH ROW
BEGIN
	INSERT INTO zdarzenia(wydarzenia, uzytkownik, tablica, record_id) VALUES ('insert', 'trigger', 'sprzedaz', NEW.id);
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS nowaSprzedaz;

Tworzy trigger dla każdej kolumny. Dodaje do zdarzenia nowe wartości insert, trigger, sprzedaz, i nowe id
uzytkownik wypisze trigger, tablica sprzedaz


DELIMITER $$
CREATE TRIGGER nowaSprzedaz AFTER INSERT ON sprzedaz
FOR EACH ROW
BEGIN 
	UPDATE kursantki SET ostatni_zakup_id = new.id WHERE kursantki_id= new.kursantki_id;
    INSERT INTO zdarzenia(wydarzenia, uzytkownik, tablica, record_id)
    VALUES ('insert', 'trigger', 'sprzedaz', new.id);
END $$
DELIMITER ;

INSERT INTO sprzedaz(id_towaru, sztuk, cena, kursantki_id, blokada) VALUES (1,555,1010,5,0);


ZADANIE 29.
A:
CREATE TABLE memo (
`memo_id` serial,
`tytul` varchar(255),
`wpis` varchar(255),
`termin` date,
`dodanie` time
);

INSERT into memo(memo_id, tytul, wpis, termin, dodanie) VALUES (1,'Urodziny Babci','Kupic kwaitki oraz torcik Wedlowski','2023-03-09',"13:47:00")
INSERT into memo(memo_id, tytul, wpis, termin, dodanie) VALUES (3,'Rozmowa z szefem','Przygotować plany sprzedaży','2023-03-09',"13:57:00")

B:
Utwórz kolejną tabele o nazwie sukcesy. Wystarczą tu 3 lub 4 kolumny: sukcesy_id, wydarzenie, czas.
ALTER TABLE memo
ADD COLUMN zrobione int DEFAULT 0;

CREATE TABLE sukcesy(
`sukcesy_id` serial,
`wydarzenie` varchar(255),
`czas` timestamp
    );

C:
Stwórz odpowiedniego triggera który będzie działał na twojej tabeli memo, ale w taki sposób, że jeżeli jest 0, to nic się nie wydarza.
Natomiast jeżeli wpiszesz tym razem 1 przy wydarzeniu, czyli wydarzenie zakończyło się sukcesem np. byłem na tych urodzinach babci, to wtedy trigger przepisze tytuł wydarzenia do tej tabeli sukcesy.
Przetestuj triggera wykonując kilka update na przemian z SELECT.

DELIMITER $$
CREATE TRIGGER sukcess AFTER UPDATE ON memo 
FOR EACH ROW 
BEGIN if new.zrobione>0 then 
INSERT INTO sukcesy(wydarzenie,czas) VALUES(new.tytul,NOW()); 
END IF; 
END;
DELIMITER ;

INSERT into memo(tytul, wpis, termin, dodanie,zrobione) VALUES ('Urodziny Mamy','Kupic kwaitki oraz torcik Wedlowski','2023-03-09',"14:47:00",1)




NEW DATABASE
https://dev.mysql.com/doc/index-other.html
