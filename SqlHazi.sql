CREATE TABLE TermekMaszkolt
(
TERMEKKOD   VARCHAR(16)    NOT NULL, 
    MEGNEVEZES  VARCHAR(64)  
        MASKED WITH (FUNCTION = 'partial(1,"****",1)')  NOT NULL, --reszleges
    KAT_ID      NUMERIC(5,0)   NULL,     
    LISTAAR     NUMERIC(8,2)   MASKED WITH (FUNCTION = 'random(1000,5000)') NULL, -- random
    LEIRAS      VARCHAR(MAX)   MASKED WITH (FUNCTION = 'default()') NULL, --alap
    RAKTAR_KOD  NUMERIC(3,0) NOT NULL,  -- nincs maszkolva
    KESZLET     NUMERIC(7,2) NULL,     
    MEGYS       VARCHAR(16) NULL,
    FELVITTE    DATE NOT NULL,
    FELVITEL    DATE NULL
);

CREATE USER Maszkolt WITHOUT Login;
GRANT SELECT ON TermekMaszkolt TO Maszkolt;

INSERT INTO TermekMaszkolt
(TERMEKKOD,MEGNEVEZES,KAT_ID,LISTAAR,LEIRAS,RAKTAR_KOD, KESZLET, MEGYS, FELVITTE, FELVITEL)
VALUES
--tabla ertekei ide, sajnos nemtudom azokat hogy lehet megszerezni


EXECUTE AS User= 'Maszkolt';
SELECT * FROM TermekMaszkolt
REVERT