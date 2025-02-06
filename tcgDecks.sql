DROP TABLE IF EXISTS tcgDecks;

CREATE TABLE tcgDecks
(
  Id           INTEGER PRIMARY KEY,
  Name         TEXT,
  CardCount    INTEGER,
  YearReleased INTEGER
);

INSERT INTO tcgDecks (Id, Name, CardCount, YearReleased)
VALUES (265, 'Greninja ex Battle Deck', 65, 2023)
;

----------------------------------------------

DROP TABLE IF EXISTS tcgDeckCards;

CREATE TABLE tcgDeckCards
(
  Quantity  INTEGER DEFAULT 1,
  DeckId    INTEGER,
  SetCode   TEXT    NOT NULL,
  SetNumber INTEGER NOT NULL,
  PRIMARY KEY (DeckId, SetCode, SetNumber),
  FOREIGN KEY (DeckId) REFERENCES tcgDecks (Id)
);

-- Looking up info (SetId) from SetName
SELECT SeriesId, SetId, SetName, SetCode, Length, HiddenLength, ReleaseYear
FROM tcgSets
WHERE SetName LIKE '%Destinies%';

-- Update code if necessary for quicker future reference
UPDATE tcgSets
SET SetCode      = 'BWND',
    Length       = 99,
    HiddenLength = 103,
    ReleaseYear  = 2012
WHERE SetName = 'Next Destinies'
  AND SeriesId = 14;

-- Verify updated SetCode:
SELECT *
FROM tcgSets
WHERE SetCode = 'BWND';

-- Find all sets with set codes populated:
SELECT *
FROM tcgSets
WHERE SetCode IS NOT NULL;

/* Add cards from Greninja ex Battle Deck (2023)  */
INSERT INTO tcgDeckCards (DeckId, Quantity, SetNumber, SetCode)
VALUES (265, 1, 054, 'SVP'), -- 1x Greninja ex
       (265, 2, 056, 'OBF'), -- 2x Froakie
       (265, 2, 057, 'OBF'), -- 2x Frogadier
       (265, 1, 026, 'BWND'), -- 1x Lapras
       (265, 1, 052, 'SV1'), -- 1x Quaxly
       (265, 1, 053, 'SV1'), -- 1x Quaxwell
       (265, 1, 054, 'SV1'), -- 1x Quaquaval
       (265, 2, 045, 'OBF'), -- 2x Lapras
       (265, 2, 046, 'PAL'), -- 2x Delibird
       (265, 1, 175, 'SV1'), -- Supporter - Jacq
       (265, 1, 180, 'SV1'), -- Supporter - Nemona
       (265, 1, 181, 'SV1'), -- ITEM Nest Ball
       (265, 1, 183, 'SV1'), -- ITEM Great Ball
       (265, 1, 186, 'SV1'), -- ITEM Pokégear 3.0
       (265, 1, 194, 'SV1'), -- ITEM Switch
       (265, 1, 188, 'SV1')  -- ITEM Potion
;

-- Verify operation was successful.
SELECT *
FROM tcgDecks;

-- Update set information:
-----------------------------
UPDATE tcgSets
SET Length       = 196,
    HiddenLength = NULL,
    ReleaseYear  = 2023
WHERE SetCode = 'SVP';

UPDATE tcgSets
SET Length       = 198,
    HiddenLength = 258,
    ReleaseYear  = 2023
WHERE SetCode = 'SV1';

UPDATE tcgSets
SET Length       = 197,
    HiddenLength = 230,
    ReleaseYear  = 2023
WHERE SetCode = 'OBF';

UPDATE tcgSets
SET Length       = 193,
    HiddenLength = 279,
    ReleaseYear  = 2023
WHERE SetCode = 'PAL';

UPDATE tcgSets
SET Length       = 99,
    HiddenLength = 103,
    ReleaseYear  = 2012
WHERE SetCode = 'BWND';

SELECT *
FROM tcgSets
WHERE SetId BETWEEN 153 AND 170;

----------------------------------------------------

-- Return total number of sets for a given named deck:
SELECT -----------------------------------------------
       tD.Id,
       tD.Name,
       tD.YearReleased,
------------------------------------------------------
       tS.SetCode         AS SetCode,
------------------------------------------------------
       SUM(tC.Quantity)   AS TotalCardsFromSet,
       COUNT(tC.Quantity) AS UniqueCardsFromSet,
------------------------------------------------------
       tS.SetName,
       tS.SeriesId,
       tS.SetId,
       tS.Length,
       tS.HiddenLength,
       tS.ReleaseYear
------------------------------------------------------
FROM tcgDeckCards tC
       JOIN tcgDecks tD ON tC.DeckId = tD.Id
       JOIN tcgSets tS ON tC.SetCode = tS.SetCode
GROUP BY tC.SetCode;

-- Return total number of cards in deck:
SELECT SUM(Quantity)
FROM tcgDecks tD
       LEFT JOIN tcgDeckCards tC on tD.Id = tC.DeckId
WHERE Quantity > 0 AND tD.Id = 265;