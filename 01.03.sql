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
